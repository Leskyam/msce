// Copyright (c) 2002-2005 ComponentOne L.L.C. All rights reserved.
// Version 1.0.20053.121, 18-Jul-2005.
//
// Implementation notes:
//
// Two kinds of elements are involved in menu tracking logic: menus
// and menu items. Both kinds are HTML elements, menu items are
// contained in menus in HTML (in the current realization menu items
// are immediate children of menus, and that fact is significant for
// the functioning of the system). Menu items may contain nested
// elements but these are opaque to the menu tracking. Submenus are
// NOT nested inside their parent items or menus in HTML.
//
// A form may contain several root (always shown) menus. Only one root
// menu can be active at a time (an active menu is the one with a
// selected item and/or an open submenu; if there is a selected item
// and an open menu, both must belong to the same root). At any given
// moment, the global c1c_active_menu variable contains the currently
// active root menu, or null if there is none.
//
// A menu can have zero or one selected item. In each menu, the member
// c1_sel_item points to that item, or is null if the menu does not
// have a selected item at the moment.
//
// A menu can have at most one item with an open submenu. Most often,
// this is the selected item, but that need not be true always. In
// each menu, c1_menu_item points to the item with the currently open
// submenu, or is null if there is none.
//
// Items with associated submenus have c1_submenu_id specified in HTML
// which does not change and contains the id of the submenu element.
// If an item has a submenu open, it has a member c1_submenu pointing
// to that menu. In the menu, menu.c1_parent_item points back to the
// item.
//
// List of custom element attributes used by this code:
//
// Static (should be present in html):
//   - menu.c1_horz (true/false)
//   - menu.c1_sel_item_styles
//   - menu.c1_item_styles
//   - menu.c1_sel_item_styles_class
//   - menu.c1_item_styles_class
//   - menu.c1_c1_horzpopup
//   - item.c1_submenu_id
//   - item.c1_sel_item_styles
//   - item.c1_item_styles
//   - item.c1_sel_item_styles_class
//   - item.c1_item_styles_class
//   - item.c1_img_src
//   - item.c1_img_sel_src
//   - item.c1_status
//
// Dynamic (created at runtime):
//   - menu.c1_menu_item
//   - menu.c1_sel_item
//   - menu.c1_parent_item
//   - item.c1_submenu
//   - item.c1_img
//   - item.c1_img_sel
//

var c1c_smart_submenu_pos = true;
var c1c_submenu_offset_left = 0;
var c1c_submenu_offset_right = 8;

// Url for source of IFRAME
// replace with "javascript:false" for SSL
var c1c_blank_url = "javascript:false";
// the currently active root menu
var c1c_active_menu = null;
// true if we are tracking menus
var c1c_tracking_menus = false;
// menu pop down delay (ms); change as needed
var c1c_menu_popdown_delay = 500;
// arbitrary large z-index for popup menus (set to 0 to disable)
var c1c_submenu_zindex = 32000;
// initialization code was executed
var c1c_initialized = false;
// if always overlap IE windowed controls 
var c1c_always_overlapIE = true;

// mousedown handler for outside of menus clicks
function c1c_doc_onmousedown(ev)
{
	c1c_init();
	var src = null;
	if (ev.srcElement)
		src = ev.srcElement;
	else if (ev.target)
		src = ev.target;
	if (src && !c1c_checkInActiveMenu(src))
	{
		popdown_and_unselect(c1c_active_menu);
		c1c_active_menu = null;
	}
}

// mouseup fires after the click (which is when the menu action
// is run), and we hide menus here unless we've clicked a menu
// with a submenu
function c1c_doc_onmouseup(ev)
{
    c1c_init();
    var src = null;
    if (ev.srcElement)
        src = ev.srcElement;
    else if (ev.target)
        src = ev.target;
    // ignore mouse up on items with submenus
    while (src && getSubMenuForNestedNode(src)) {
        if (src.c1_submenu || c1c_getattr(src, 'c1_submenu_id'))
            return;
        src = getSubMenuForNestedNode(src);
    }
    popdown_and_unselect(c1c_active_menu);
    c1c_active_menu = null;
}

// this function is attached to mousedown of menu items
// that do not have other handlers (postback or script)
function c1c_onmousedown(ev, item)
{
    c1c_onmouseover(ev, item);
}

function c1c_onclick(ev, item)
{
    c1c_onmouseover(ev, item);
}

// mouseover for menu items
function c1c_onmouseover(ev, item)
{
    c1c_init();
    var src = null;
    if (ev.srcElement)
        src = ev.srcElement;
    else if (ev.target)
        src = ev.target;
    if (src != item && !c1c_object_contains(item, src))
        return;
    c1c_select_item(item);
}

// mouseout for menu items
function c1c_onmouseout(ev, item)
{
    c1c_init();
    var tgt;
    if (ev.relatedTarget)
        tgt = ev.relatedTarget;
    else if (ev.toElement)
        tgt = ev.toElement;
    if (!tgt || (tgt != item.c1_submenu && !c1c_object_contains(item.c1_submenu, tgt))) {
        c1c_unselect_item(item);
    }
}

// close any open menus if we moused out of a menu
// (the arg is one for a "mouseout" of a menu event)
function c1c_popdown_if_out()
{
    if (!c1c_tracking_menus && c1c_active_menu) {
        popdown_and_unselect(c1c_active_menu);
        c1c_active_menu = null;
    }
}

// mouseout for submenus
function c1c_onmouseout_submenu(ev, submenu)
{
    // Find out where to the mouse's gone. If it has moved out
    // of the menus altogether, register a timed handler which
    // will pop down all menus after a while.
    var tgt;
    if (ev.relatedTarget)
        tgt = ev.relatedTarget;
    else if (ev.toElement)
        tgt = ev.toElement;
    // do nothing if we still are in a menu
    while (tgt && getSubMenuForNestedNode(tgt)) {
        if (c1c_object_contains(submenu, tgt) || tgt == c1c_active_menu || c1c_getattr(tgt, 'c1_parent_item'))
            return;
        tgt = c1c_getParentElement(tgt);
    }
    // if we got here, we are not in a menu
    c1c_tracking_menus = false;
    if (window.setTimeout)
        window.setTimeout('c1c_popdown_if_out()', c1c_menu_popdown_delay);
    else
        c1c_popdown_if_out();
}

function c1c_select_item(item)
{
    c1c_tracking_menus = true;
    var menu = getSubMenuForNestedNode(item);

    // if the currently selected item is the same as the new selection, nothing to do
    if (menu.c1_sel_item == item)
        return;
    // otherwise, if there is a selected item, unselect it
    if (menu.c1_sel_item) {
        c1c_unselect_item(menu.c1_sel_item);
        c1c_tracking_menus = true;
    }
    // if there is an open submenu, hide it
    if (menu.c1_menu_item && menu.c1_menu_item != item)
        c1c_popdown_item_menu(menu.c1_menu_item)
    // show item status message
    var st = c1c_getattr(item, 'c1_status');
    if (st)
        window.status = st;
    // if we're selecting an item in a root menu,
    if (!menu.c1_parent_item) {
        // ..and there is a selected item in another root menu, unselect it and hide any menus
        if (c1c_active_menu && c1c_active_menu != menu) {
            popdown_and_unselect(c1c_active_menu);
            c1c_active_menu = null;
        }
    }
    else {
        // make sure the parent item is selected
        if (getSubMenuForNestedNode(menu.c1_parent_item).c1_sel_item != menu.c1_parent_item)
            c1c_select_item(menu.c1_parent_item);
    }
    
    // update the global c1c_active_menu var if needed.
    if (c1c_active_menu == null)
        c1c_active_menu = menu;
            
    // if the item to be selected has a submenu, show it
    c1c_popup_item_menu(item);
    // redraw the item to be selected using selected style
    c1c_hilite_item(item, true);
    // store the new selected item in its menu
    menu.c1_sel_item = item;
    
    c1c_tracking_menus = true;
}

function c1c_unselect_item(item)
{
    // if the item has an open submenu, hide it
    if (c1c_getattr(item, 'c1_submenu_id')) {
        if (window.setTimeout)
            window.setTimeout('c1c_popdown_item_menu_delayed("' + item.id + '")', c1c_menu_popdown_delay);
        else
            c1c_popdown_item_menu(item);
    }
    // redraw item in normal style
    c1c_hilite_item(item, false);
    // remove status
    if (c1c_getattr(item, 'c1_status'))
        window.status = '';
    // store the fact that there is no selection in the menu
    if (getSubMenuForNestedNode(item).c1_sel_item == item)
        getSubMenuForNestedNode(item).c1_sel_item = null;
    // update the global c1c_active_menu var if needed.
    if (c1c_active_menu == getSubMenuForNestedNode(item) && !c1c_active_menu.c1_menu_item)
        c1c_active_menu = null;
}

// pops up item's submenu
function c1c_popup_item_menu(item)
{
    var submenu_id = c1c_getattr(item, 'c1_submenu_id');
    if (submenu_id) {
        var submenu = document.getElementById(submenu_id);
        if (submenu) {
            c1c_show_submenu(item, submenu);
            item.c1_submenu = submenu;
            submenu.c1_parent_item = item;
            getSubMenuForNestedNode(item).c1_menu_item = item;
        }
    }
}

function c1c_popdown_item_menu_delayed(id)
{
    var item = document.getElementById(id);
    if (item && getSubMenuForNestedNode(item).c1_sel_item != item)
        c1c_popdown_item_menu(item);
}

// pops down item's submenu
function c1c_popdown_item_menu(item)
{
    var submenu = item.c1_submenu;
    if (submenu) {
        // recursively unselect and pop down all nested menus
        if (submenu.c1_menu_item)
            c1c_popdown_item_menu(submenu.c1_menu_item);
        if (submenu.c1_sel_item)
            c1c_unselect_item(submenu.c1_sel_item);
        c1c_hide_submenu(submenu);
        submenu.c1_parent_item = null;
        item.c1_submenu = null;
        getSubMenuForNestedNode(item).c1_menu_item = null;
        // update the global c1c_active_menu var if needed.
        if (c1c_active_menu == getSubMenuForNestedNode(item) && !c1c_active_menu.c1_sel_item)
            c1c_active_menu = null;
    }
}

function popdown_and_unselect(menu)
{
    // remove any popup menus, remove selection.
    if (menu) {
        if (menu.c1_menu_item)
            c1c_popdown_item_menu(menu.c1_menu_item);
        if (menu.c1_sel_item)
            c1c_unselect_item(menu.c1_sel_item);
    }
}

// ---- none of the functions below deal with menu tracking logic ----

function c1c_hilite_item(item, on)
{
    if (on) {
        // styles
        if (c1c_getattr(item, 'c1_sel_item_styles_class'))
        	c1c_set_style_class(item, c1c_getattr(item, 'c1_sel_item_styles_class'))
        else {
        	c1c_add_styles(item, c1c_getattr(getSubMenuForNestedNode(item), 'c1_sel_item_styles'));
        	c1c_add_styles(item, c1c_getattr(item, 'c1_sel_item_styles'));
        }
        // image
        if (!item.c1_img && (c1c_getattr(item, 'c1_img_sel_src'))) {
            item.c1_img = new Image;
            item.c1_img.src = c1c_getattr(item, 'c1_img_src');
            item.c1_img_sel = new Image;
            item.c1_img_sel.src = c1c_getattr(item, 'c1_img_sel_src');
        }
        if (item.c1_img) {
            var image;
            if (item.childNodes && item.childNodes[0].TagName == 'IMG')
            {
                image = item.childNodes[0];
            }
            else {
                image = item.getElementsByTagName('IMG')[0];
            }
            if (image)
            {
                image.src = item.c1_img_sel.src;
                if (image.src)
                {
                  if (image.style.height == '0px')
                    image.style.height = '';
                  if (image.style.width == '0px')
                    image.style.width = '';
                  if (image.style.visibility == 'hidden')                
                    image.style.visibility = 'visible';
                }
 
            }
        }
    }
    else {
        // styles
        if (c1c_getattr(item, 'c1_item_styles_class'))
        	c1c_set_style_class(item, c1c_getattr(item, 'c1_item_styles_class'))
        else {
            c1c_remove_styles(item, c1c_getattr(item, 'c1_sel_item_styles'));
            c1c_remove_styles(item, c1c_getattr(getSubMenuForNestedNode(item), 'c1_sel_item_styles'));
            c1c_add_styles(item, c1c_getattr(getSubMenuForNestedNode(item), 'c1_item_styles'));
            c1c_add_styles(item, c1c_getattr(item, 'c1_item_styles'));
        }
        // image
        if (item.c1_img) {
            var image;
            if (item.childNodes && item.childNodes[0].TagName == 'IMG')
            {
                image = item.childNodes[0];
            }
            else {
                image = item.getElementsByTagName('IMG')[0];
            }
            if (image)
            {
                image.src = item.c1_img.src;
                if (!c1c_getattr(item, 'c1_img_src'))
                {
                  image.style.height = '0px';
                  image.style.width = '0px';
                  image.style.visibility = 'hidden';
                }
 
            }
        }
    }
}

function c1c_show_submenu(item, submenu)
{
	if (c1c_submenu_zindex)
		submenu.style.zIndex = c1c_submenu_zindex;
	
	var tx, ty;
	var leftToRight = true;
	var topToBottom = true;
	var horzpopup = c1c_getattr(c1c_active_menu, 'c1_horzpopup');

	if (c1c_active_menu)
	{
		leftToRight = !(c1c_getattr(c1c_active_menu, 'c1_horzpopup') == 'RightToLeft');
		topToBottom = !(c1c_getattr(c1c_active_menu, 'c1_vertpopup') == 'BottomToTop');
	}

	var itm = c1c_getFreezTextNode(item);
	if (c1c_getattr(getSubMenuForNestedNode(item), 'c1_horz')) 
	{
	        if (leftToRight)
        		tx = c1c_offset_x(itm) - c1c_offset_x(submenu.offsetParent);
	        else
        		tx = c1c_offset_x(itm) - submenu.offsetWidth + itm.offsetWidth;

	        if (topToBottom)
        		ty = c1c_offset_y(itm) - c1c_offset_y(submenu.offsetParent) + itm.offsetHeight;
	        else    
        		ty = c1c_offset_y(itm) - submenu.offsetHeight;
		if (c1c_smart_submenu_pos)	
		{
			if (tx + submenu.offsetWidth > document.body.clientWidth + document.body.scrollLeft)
			{
				tx = document.body.clientWidth  + document.body.scrollLeft - submenu.offsetWidth - 5; 
			}
			if (tx <  document.body.scrollLeft)
				tx =  document.body.scrollLeft;
	    	}
	}
	else 
	{
        	if (leftToRight)
			tx = c1c_offset_x(itm) - c1c_offset_x(submenu.offsetParent) + itm.offsetWidth -  + c1c_submenu_offset_left;
		else
			tx = c1c_offset_x(itm) - submenu.offsetWidth + c1c_submenu_offset_right;
		ty = c1c_offset_y(itm) - c1c_offset_y(submenu.offsetParent);
		if (!topToBottom)
			ty = ty - (submenu.offsetHeight - itm.offsetHeight);

		if (c1c_smart_submenu_pos)	
		{
			if (tx + submenu.offsetWidth > document.body.clientWidth +  document.body.scrollLeft)
			{
				tx = tx - submenu.offsetWidth - itm.offsetWidth + c1c_submenu_offset_right; 
			}
			if (tx <  document.body.scrollLeft)
				tx =  document.body.scrollLeft;
	    	}
	}

	
	submenu.style.left = tx;
	submenu.style.top = ty;
	
	c1c_set_item_visibility(submenu.id, 'visible');
	c1c_create_and_show_overlay(submenu);
}

// OVERLAY STUFF
function c1c_create_overlay(menu)
{
	c1c_innerText = menu.innerHTML;
	var c1c_overlay_zindex = "";
	if (menu.style.zIndex)
	{
		var ind = menu.style.zIndex-1;	
		c1c_overlay_zindex = 'Z-INDEX:' + ind + ';';
	}

	var iframe_text = '<iframe id="ifr_' + menu.id + '" src="'+c1c_blank_url+'"'+' style="position:absolute;left:'+menu.style.left+';top:'+menu.style.top + ';' + c1c_overlay_zindex +'visibility:hidden;filter:progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);" ' + 'frameborder=no scrolling=no width=' + menu.offsetWidth + 'px height=' + menu.offsetHeight + 'px noresize marginheight=0 marginwidth=0"></iframe>';
	menu.insertAdjacentHTML('beforeBegin', iframe_text);
}

function c1c_show_overlay(menu)
{
       	var ifr = document.getElementById("ifr_"+menu.id);
	if (ifr)
	{
		ifr.style.visibility = 'visible';
		ifr.style.left = menu.style.left;
		ifr.style.top = menu.style.top;
		ifr.style.width = menu.offsetWidth;
		ifr.style.height = menu.offsetHeight;
	}
}

function c1c_hide_overlay(menu)
{
       	var ifr = document.getElementById("ifr_"+menu.id);
	if (ifr)
	{
		ifr.style.visibility = 'hidden';
		ifr.style.left = 0;
		ifr.style.top = 0;
		ifr.style.width = 0;
		ifr.style.height = 0;
	}
}

function c1c_create_and_show_overlay(menu)
{
    if (c1c_need_to_cover_dropdowns())
    {
	var ifr_id = 'ifr_'+menu.id;
        var ifr = document.getElementById(ifr_id);
        if (!ifr) 
        {
		c1c_create_overlay(menu);
	}
	c1c_show_overlay(menu);
    }        
}

//
function c1c_set_item_visibility(item_id, value)
{
   var item = document.getElementById(item_id);
   if (item)
      if (window.setTimeout)
          window.setTimeout("c1c_set_item_visibility_delayed('"+item_id+"','"+value+"')",0);
      else
          item.style.visibility = value;
   
}

function c1c_set_item_visibility_delayed(item_id, value)
{
   var item = document.getElementById(item_id);
   if (item)
      item.style.visibility = value;
}

function c1c_hide_submenu(submenu)
{
    c1c_set_item_visibility(submenu.id, 'hidden');
    if (c1c_iframes_supported())
    {
        var ifr_id = 'ifr_'+submenu.id;
        c1c_set_item_visibility(ifr_id, 'hidden');
    }
}

function c1c_getattr(obj, att)
{
    return obj.getAttribute(att);
}

// returns true if obj contains elem inside its tree
function c1c_object_contains(obj, elem)
{
    if (!obj)
        return null;
    else if (obj.contains)
        return obj.contains(elem);
    else
        return _c1c_object_contains(obj, elem);
}

function _c1c_object_contains(obj, elem)
{
    if (!obj)
        return null;
    var i;
    if (!obj.childNodes)
        return false;
    for (i = 0; i < obj.childNodes.length; ++i) {
        var child = obj.childNodes[i];
        if (elem == child)
            return true;
        else if (_c1c_object_contains(child, elem))
            return true;
    }
    return false;
}

function c1c_offset_x(o, relto)
{
    if (typeof(o) != 'object' || o == null)
        return 0;
    else
        return o.offsetLeft + c1c_offset_x(o.offsetParent, relto);
}

function c1c_offset_y(o)
{
    if (typeof(o) != 'object' || o == null)
        return 0;
    else
        return o.offsetTop + c1c_offset_y(o.offsetParent);
}

function c1c_add_styles(el, style_str)
{
    if (!style_str)
        return;
    var kvs = style_str.split(';');
    for (var i = 0; i < kvs.length; ++i) {
        var kv = kvs[i].split(':');
        if (kv.length == 2) {
            if (kv[0] == 'className')
                el.className = kv[1];
            else
            {
				if (kv[0] == 'borderWidth')
                   c1c_set_freezBorderWidth(el, el.style[kv[0]]);
                el.style[kv[0]] = kv[1];
			}
        }
    }
}

function c1c_remove_styles(el, style_str)
{
    if (!style_str)
        return;
    var kvs = style_str.split(';');
    for (var i = 0; i < kvs.length; ++i) {
        var kv = kvs[i].split(':');
        if (kv.length == 2) {
            if (kv[0] == 'className')
                el.className = '';
            else
            {
		if (kv[0] == 'borderWidth')
		{
                   c1c_set_freezBorderWidth(el, el.style[kv[0]]);
	           el.style[kv[0]] = '0px 0px 0px 0px';
                }
		else
	           el.style[kv[0]] = '';
            }
        }
    }
}

function c1c_set_freezBorderWidth(el, borderWidth)
{
	var parEl;
        var value = borderWidth;
        if (value == '')
            value = '0px 0px 0px 0px';
        parEl = c1c_getParentElement(el);
	if (parEl && c1c_getattr(parEl, 'c1_freez') == 'yes')
        {
            parEl.style['padding'] = value;
        }
}

function c1c_set_style_class(item, className)
{
    item.className = className;
}

// true if dropdowns is present on the page
function c1c_dropdowns_present()
{
    return (document.all.tags('SELECT').length > 0);
}

// true if embed or objects is present on the page
function c1c_embed_present()
{
    return ((document.all.tags('OBJECT').length > 0) || (document.all.tags('EMBED').length > 0));
}

// true if user agent support property scripting with iframes
function c1c_iframes_supported()
{
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf('MSIE');
    var opera = ua.indexOf('Opera');
    return ((msie > 0) && (opera < 0));
}


// true if need to cover dropdowns in IE by submenus
function c1c_need_to_cover_dropdowns()
{
	return (document.body.insertAdjacentHTML && c1c_iframes_supported() && (c1c_always_overlapIE || c1c_dropdowns_present() || c1c_embed_present())); 
}

function c1c_mnu_check_mouse_out(ev, item)
{
    var tgt;
    if (ev.relatedTarget)
        tgt = ev.relatedTarget;
    else if (ev.toElement)
        tgt = ev.toElement;
    return  (!tgt || !c1c_object_contains(item, tgt));
}

function c1c_init()
{
    if (!c1c_initialized)
    { 
        if (!document.expando)
            document.expando = true;
        if (document.attachEvent)
        {
            document.attachEvent('onmousedown',c1c_doc_onmousedown);
            document.attachEvent('onmouseup',c1c_doc_onmouseup);
        }
        else
        {
            c1c_menu_popdown_delay = 200;
        }
        c1c_initialized = true;
    }
}

function c1c_getParentElement(node)
{
   if (node.parentElement)
     return node.parentElement;
   else if (node.parentNode)
     return node.parentNode;
   else 
     return null;

}


function c1c_getFreezTextNode(item)
{
    var freez = c1c_getParentElement(item);
    while (freez != null && !freez.tagName == 'TABLE' && menu.tagName != 'SPAN')
    {
	freez = c1c_getParentElement(item);	
    }
    if (c1c_getattr(item, 'c1_freeztext') != 'yes')
        freez = item;
    return freez;	
}

function getSubMenuForNestedNode(item)
{
    var menu = c1c_getParentElement(item);
    while (menu != null && ((menu.tagName != 'SPAN' && menu.tagName != 'TABLE') || c1c_getattr(menu, 'c1_freeztext') == 'yes'))
    {
        menu = c1c_getParentElement(menu);
    }
    return menu;	
}

function c1c_checkInMenu(item, menu)
{
    while (item != menu)
    {
        if (!item)
            return false;
        // item is a submenu
        else if (item.c1_parent_item)       
           item = item.c1_parent_item;
        else 
           item = c1c_getParentElement(item);
    }
    return true;
}

// returns true if item in hierarchy of active menu
function c1c_checkInActiveMenu(item)
{
	if (c1c_active_menu == null)
		return false;
	else
		return c1c_checkInMenu(item, c1c_active_menu);
}

// CONTEXT MENUS STUFF
function c1c_init_default_contextmenu()
{
	if(c1c_supportOnContextMenu)
		document.oncontextmenu = c1c_showDefaultContextMenu;
	else
		document.onmouseup = c1c_showDefaultContextMenu;
}

function c1c_init_control_contextmenu(control, menu)
{
	control.c1_context_menu = menu;
	if(c1c_supportOnContextMenu)
		control.oncontextmenu = c1c_showControlContextMenu;
	else
		control.onmouseup = c1c_showControlContextMenu;
}

function c1c_menu_init(id)
{
        var menu = document.getElementById(id);
	c1c_hideContext(menu);
        if (!document.expando)
            document.expando = true;
	if (menu.contextmenu == 'Default')
	{
		document.c1_context_menu = menu;
		c1c_init_default_contextmenu();
	}
	else if (menu.contextmenu == 'Control')
	{
		var control = document.getElementById(menu.contextcontrolid);
		if (control)
			c1c_init_control_contextmenu(control, menu);
	}
}

function c1c_hideContextMenu()
{
	if (document.c1_active_context_menu)
	{
		c1c_hideContext(document.c1_active_context_menu);
		document.body.onmousemove = null;
	}
}

function c1c_surelyHideContextMenu(ev)
{
	c1c_hideContextMenu();
}

function c1c_hideContextMenuEv(ev)
{
	var e = ev;
	if (!ev)            
		e = window.event;
	var src = c1c_getEventSrc(e);
	if (src && !c1c_checkInMenu(src, document.c1_active_context_menu))
		c1c_hideContext(document.c1_active_context_menu);
	else
		document.body.onmousemove = c1c_surelyHideContextMenu;
	document.body.onmousedown = null;
}

function c1c_getControlContextInParent(control)
{
	while (control && !control.c1_context_menu) 
        	control = c1c_getParentElement(control);
	return control;
}

function c1c_showControlContextMenu(ev)
{       
	var e = ev;
	if (!ev)            
		e = window.event;
	var control = null;
	if (e)
		control = c1c_getEventSrc(e);
	control = c1c_getControlContextInParent(control);


	if (!c1c_active_menu && control && control.c1_context_menu)
	{
		document.body.onmousedown = c1c_hideContextMenuEv;
		c1c_showContext(control.c1_context_menu, e);
	}
	if (e)
	{
		e.cancelBubble = true;
		e.returnValue = false;
	}
	return false;
}

function c1c_showDefaultContextMenu(ev)
{       

	if(!c1c_supportOnContextMenu && ev.button != 2)
		return true;
	document.body.onmousedown = c1c_hideContextMenuEv;
	var e = ev;
	if (!ev)            
		e = window.event;
	if (!c1c_active_menu)
	{
		c1c_showContext(document.c1_context_menu, e);
	}
	if (e)
	{
		e.cancelBubble = true;
		e.returnValue = false;
	}
	return false;
}

function c1c_showContextMenuInternal(id, x, y) 
{
        var menu = document.getElementById(id);
	document.body.onmousedown = c1c_hideContextMenuEv;
	c1c_showContextPos(menu, x, y);
}


function c1c_showContextPos(menu, x, y)
{
	document.c1_active_context_menu = menu;
	menu.style.position = "absolute";
	menu.style.left = x;
	menu.style.top = y;
	if (c1c_submenu_zindex)
		menu.style.zIndex = c1c_submenu_zindex;
	c1c_create_and_show_overlay(menu);
	menu.style.visibility = "visible";
}

function c1c_showContext(menu, ev)
{
	document.c1_active_context_menu = menu;
	menu.style.position = "absolute";
	menu.style.left = c1c_getContextMenuLeft(menu, ev);
	menu.style.top = c1c_getContextMenuTop(menu, ev);
	if (c1c_submenu_zindex)
		menu.style.zIndex = c1c_submenu_zindex;
	c1c_create_and_show_overlay(menu);
	menu.style.visibility = "visible";
}

function c1c_hideContext(menu)
{
        popdown_and_unselect(menu);
	menu.style.position = "absolute";
	menu.style.visibility = "hidden";
	menu.style.left = 0;
	menu.style.top = 0;
	c1c_hide_overlay(menu);
	document.body.onmousedown = null;
	document.body.onkeydown = null;
	document.c1_active_context_menu = null;
}

function c1c_supportAddEventHandler()
{
	if (document.AddEventHandler)
		return true;
	else
		return false;
}

function c1c_supportOnContextMenu()
{
	if (typeof document.oncontextmenu == "object")
		return true;
	else
		return false;
}

function c1c_getContextMenuLeft(menu, ev)
{
	var left = 0;
	var cw = document.body.clientWidth;
	var sl = document.body.scrollLeft;
	if (ev.x)
	{
		left = ev.x;
		left = left + sl;
	}
	else if (ev.pageX)
		left = ev.pageX;
		
	if (left + menu.offsetWidth > sl + cw)
		left = sl + cw - menu.offsetWidth;
	if (left < 0)
		left = 0;
	return left;
}

function c1c_getContextMenuTop(menu, ev)
{
	var top = 0;
	var ch = document.body.clientHeight;
	var st = document.body.scrollTop;
	if (ev.y)
	{
		top = ev.y;
		top = top + st;
	}
	else if (ev.pageY)
		top = ev.pageY;
		
	if (top + menu.offsetHeight > st + ch)
		top = st + ch - menu.offsetHeight;
	if (top < 0)
		top = 0;
	return top;
}

function c1c_getEventSrc(ev)
{
	var src = null;
	if (ev.srcElement)
		src = ev.srcElement;
	else if (ev.target)
		src = ev.target;	
	return src;
}

function c1c_showContextMenu(id, arg1, arg2)
{
	if (arg2)
		c1c_showContextMenuInternal(id, arg1, arg2);
	else
	{
		var e = arg1;
		if (!e)
			e = window.event;
		var x, y;
		if (e.x)
		{	
			x = e.x;
			if (document.body)
				x += document.body.scrollLeft;
			if (document.documentElement)
				x += document.documentElement.scrollLeft;
		}
		else if (e.pageX)
			x = e.pageX;
		if (e.y)
		{	
			y = e.y;
			if (document.body)
				y += document.body.scrollTop;
			if (document.documentElement)
				y += document.documentElement.scrollTop;
		}
		else if (e.pageY)
			y = e.pageY;
		c1c_showContextMenuInternal(id, x, y);
	}
}
// ---- end of file. ----
