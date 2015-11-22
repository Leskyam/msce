// Copyright (c) 2002-2005 ComponentOne L.L.C. All rights reserved.
// Version 1.0.20053.121, 19-Apr-2005.

// the currently active root menu
var c1c_l_button_is_down = false;

function c1c_tbctrl_onmouseover(ev, item)
{
	if (item != null)
	{
		var styleStr = item.getAttribute("HoverStyle");
		
		//restore normal style
		var prev_style = item.getAttribute("c1c_prev_state_style");
		if (prev_style && prev_style != " ")
			c1c_set_style(item, prev_style);
		//save replacing normal style
		item.setAttribute("c1c_prev_state_style", 
		c1c_get_replaced_style(item, styleStr), 0);
		//apply hover style
		c1c_set_style(item, styleStr);
	}
}

function c1c_tbctrl_onmouseout(ev, item)
{
	if (item != null)
	{
		var prev_style = item.getAttribute("c1c_prev_state_style");
		if (prev_style && prev_style != " ")
			c1c_set_style(item, prev_style);
		item.setAttribute("c1c_prev_state_style", " ")	
		// item.removeAttribute("c1c_prev_state_style", 0); - don't compatable with opera6
		item.setAttribute("c1c_state_hover", 0);
	}
}

function c1c_tbctrl_onmousedown(ev, item)
{
	if (item != null)
	{
		var styleStr = item.getAttribute("SelectedStyle");
		var prev_style = item.getAttribute("c1c_prev_state_style");
		if (prev_style && prev_style != " ")
			c1c_set_style(item, prev_style);
		item.setAttribute("c1c_prev_state_style", 
		c1c_get_replaced_style(item, styleStr), 0);
		c1c_set_style(item, styleStr);
	}
}

function c1c_tbctrl_onmouseup(ev, item)
{
	if (item != null)
	{
		c1c_tbctrl_unpush(item);
		c1c_do_postback_orlink_ifneeded(item,'');
	}    
}

function c1c_tbctrl_unpush(item)
{
	if (item != null)
	{
		var styleStr = item.getAttribute("HoverStyle");
		var prev_style = item.getAttribute("c1c_prev_state_style");
		//c1c_remove_style(item, prev_style);
		if (prev_style	&& prev_style != " ")
			c1c_set_style(item, prev_style);
		item.setAttribute("c1c_prev_state_style", 
		c1c_get_replaced_style(item, styleStr), 0);
		c1c_set_style(item, styleStr);
	}    
}

function c1c_tbctrl_onselectstart(ev, item)
{
	return false;
}

function c1c_tbbtn_onmouseover(ev, item)
{
	if ((item != null) && !c1c_l_button_is_down)
	{
		//var pushed = item.getAttribute("IsPushed");
		var pushed = c1c_get_prop_from_state_field(item, "IsPushed");
		if (pushed && pushed == "true")
			return;
		else
		{
			c1c_tbctrl_onmouseover(ev, item);
			var url = item.getAttribute("hoverImageURL");
			var prevUrl = c1c_tbbtn_get_img_url(item);
			var isHover = item.getAttribute("c1c_state_hover");
			if (isHover != 1)
				item.setAttribute("c1c_prev_state_img_url", prevUrl);
			if (url)
				c1c_tbbtn_set_img_url(item, url);
			item.setAttribute("c1c_state_hover", 1);
		}
	}
}

function c1c_tbbtn_onmouseout(ev, item)
{
	if (c1c_btn_check_mouse_out(ev, item)) 
	{
		//var pushed = item.getAttribute("IsPushed");
		c1c_l_button_is_down = false;
		var pushed = c1c_get_prop_from_state_field(item, "IsPushed");
		if (pushed && pushed == "true")
			return;
		else
		{
			c1c_tbctrl_onmouseout(ev, item); 
			
			var prev_img_url = item.getAttribute("c1c_prev_state_img_url");
			if (prev_img_url != null)
				c1c_tbbtn_set_img_url(item, prev_img_url);   
			item.setAttribute("c1c_prev_state_img_url", " ");
			
			// item.removeAttribute("c1c_prev_state_img_url", 0);
			
		}
	}
}

function c1c_tbbtn_onmouseup(ev, item)
{
	if ((item != null) && ((ev.button == 0) || (ev.button == 1) || ((ev.type == "keypress") && (ev.keyCode == 13) && (!ev.altKey) && (!ev.ctrlKey) && (!ev.shiftKey))))
	{
		c1c_l_button_is_down = false;
		var toggle = item.getAttribute("IsToggle");
		if (toggle && toggle == "true")
		{
			//var pushed = item.getAttribute("IsPushed");
			var pushed = c1c_get_prop_from_state_field(item, "IsPushed");
			if (pushed == null || pushed == "false")
			{
				//item.setAttribute("IsPushed", "true");
				c1c_set_prop_to_state_field(item, "IsPushed", "true");
				var ownerContID = item.getAttribute("ownerContainer");
				if (ownerContID != null)
				{
					var ownerCont = window.document.getElementById(ownerContID);
					if (ownerCont != null)
					{
						var isToggleGroup = ownerCont.getAttribute("isToggleGroup");
						if (isToggleGroup && isToggleGroup == "true")
							c1c_ensure_tglbar_singpush(ownerCont, item.getAttribute("ID"));
					}
				}
				c1c_do_postback_orlink_ifneeded(item,'');
				return;
			}
			else
			{
				//c1c_set_prop_to_state_field(item, "IsPushed", "false"); 
				//c1c_tbctrl_onmouseup(ev, item);
				c1c_tbbtn_unpush(item);
				c1c_dopostback_ifneeded(item,'');
				return;
			}
		}
		else
			c1c_tbbtn_unpush(item);
		c1c_tbctrl_onmouseup(ev, item);
	}
}

function c1c_tbbtn_onmousedown(ev, item)
{
	if ((item != null) && (ev.button == 0 || ev.button == 1))
	{
		c1c_tbbtn_onmouseover(ev, item);
		var url = item.getAttribute("selectedImageURL");
		var normUrl = item.getAttribute("c1c_prev_state_img_url");
		if (url)
			c1c_tbbtn_set_img_url(item, url);
		else
			c1c_tbbtn_set_img_url(item, normUrl);
		c1c_tbctrl_onmousedown(ev, item);
		c1c_l_button_is_down = true;
	}
}

function c1c_tbbtn_get_img_url(item)
{
	var ret = null;
	if (item != null)
	{
		var imgID = item.getAttribute("imageID");
		if (imgID)
		{
			var img = window.document.getElementById(imgID);
			if (img != null)
			{
				ret = img.getAttribute("src", 0);
				//if (ret != null && ret.length > 0 && ret.charAt(ret.length - 1) == '/')
				if (c1c_is_url_empty(ret))
					ret = "";
			}
		}
	}
	return ret;
}

function c1c_tbbtn_set_img_url(item, url)
{
	if (item != null)
	{
		var imgID = item.getAttribute("imageID");
		if (imgID)
		{
			var img = window.document.getElementById(imgID);
			if (img != null)
			{
				var curUrl = img.getAttribute("src", 0);
				if (url)
				{
					if (url != curUrl)
						img.setAttribute("src", url, 0);
					img.style["display"] = "inline";
					img.style["visibility"] = "visible";
				}
				
				else
				{
					if (img.getAttribute("sizeDef") == "true")
					{
						img.style["visibility"] = "hidden";
					}
					else
					{
						img.style["display"] = "none";
					}
					if (!c1c_is_url_empty(curUrl))
						img.setAttribute("src", "", 0);
				}
			}
		}
	}
}

function c1c_is_url_empty(url)
{
	var ret = url == null || c1c_trim_all(url) == "";
	if (!ret) //workaround for IE
		ret = url.charAt(url.length - 1) == '/';
	return ret;
}

function c1c_tbbtn_unpush(item)
{
	if (item != null)
	{
		c1c_tbctrl_unpush(item);
		c1c_set_prop_to_state_field(item, "IsPushed", "false");
		
		var url = item.getAttribute("hoverImageURL");
		var normUrl = item.getAttribute("c1c_prev_state_img_url");
		if (url)
			c1c_tbbtn_set_img_url(item, url);
		else
			c1c_tbbtn_set_img_url(item, normUrl);
	}
}

function c1c_ensure_tglbar_singpush(toggleBar, pushedButtID)
{
	if (toggleBar != null)
	{
		var buttIDListStr = toggleBar.getAttribute("childButtonListID");
		if (buttIDListStr)
		{
			var doc = window.document;
			var buttIDs = buttIDListStr.split(';');
			for (var i = 0; i < buttIDs.length; i++)
			{
				if (buttIDs[i] != pushedButtID)
				{
					var curButt = doc.getElementById(buttIDs[i]);
					if (curButt != null)
					{
						var toggleState = curButt.getAttribute("IsToggle");
						var pushedState = c1c_get_prop_from_state_field(curButt, "IsPushed");
						if (toggleState && toggleState == "true"
							&& pushedState && pushedState == "true")
						{
							c1c_tbbtn_unpush(curButt);
							c1c_tbbtn_set_img_url(curButt, curButt.getAttribute("c1c_prev_state_img_url")); //patch
							c1c_tbctrl_onmouseout(null, curButt); //patch
						}
					}
				}
			}
		}
	}
}


function c1c_grbarbtn_onmouseup(ev, item)
{
	if (item != null)
	{
		var doc = window.document;
		var ownerBarID = item.getAttribute("ownerGroupBarID");
		var ownerBar = null;
		if (ownerBarID)
			ownerBar = doc.getElementById(ownerBarID);
		var isSingleExpanded = "false";
		var barLayout = null;
		if (ownerBar)
		{
			isSingleExpanded = ownerBar.getAttribute("isSingleExpanded");
			barLayout = ownerBar.getAttribute("barLayout")
		}
		isSingleExpanded = isSingleExpanded == null || isSingleExpanded == "true";
		var itemsContID = item.getAttribute("itemsContainerID");
		if (itemsContID)
		{
			var itemsCont = doc.getElementById(itemsContID);
			if (itemsCont != null)
			{
				var itemsAreaLen = null;
				if (barLayout != null)
					itemsAreaLen = c1c_get_grbar_itemarea_length(ownerBar);
				c1c_toggle_gr_item_cont(itemsCont, itemsAreaLen, barLayout == "vert");
				if (isSingleExpanded)
					c1c_ensure_grbar_singexp(ownerBar, item.getAttribute("ID"));
			}
		}
	}
	//c1c_tbbtn_onmouseup(ev, item);
}

function c1c_get_grbar_itemarea_length(groupBar)
{
	if (groupBar != null)
	{
		var barLayout = groupBar.getAttribute("barLayout");
		var isVert = barLayout == "vert";
		var barClientLen = isVert ? groupBar.offsetHeight : groupBar.offsetWidth;
		var occupLen = 0;
		var buttIDListStr = groupBar.getAttribute("groupButtonListID");
		if (buttIDListStr)
		{
			var buttIDs = buttIDListStr.split(';');
			var doc = window.document; 
			for (var i = 0; i < buttIDs.length; i++)
			{
				var curButt = doc.getElementById(buttIDs[i]);
				if (curButt != null)
					occupLen += isVert ? curButt.offsetHeight : curButt.offsetWidth;
			}
			if (occupLen < barClientLen)
				return barClientLen - occupLen;
			else
				return 0;
		}
		else
			return barClientLen;
	}
	else
		return 0;
}

function c1c_ensure_grbar_singexp(groupBar, expandedButtID)
{
	if (groupBar != null)
	{
		var buttIDListStr = groupBar.getAttribute("groupButtonListID");
		if (buttIDListStr)
		{
			var doc = window.document;
			var buttIDs = buttIDListStr.split(';');
			for (var i = 0; i < buttIDs.length; i++)
			{
				if (buttIDs[i] != expandedButtID)
					c1c_ensure_gr_butt_hidden(doc.getElementById(buttIDs[i]));
			}
		}
	}
}

function c1c_ensure_gr_butt_hidden(grButton)
{
	if (grButton)
	{
		var itemsContID = grButton.getAttribute("itemsContainerID");
		if (itemsContID)
		{
			var doc = window.document;
			var itemsCont = doc.getElementById(itemsContID);
			if (itemsCont != null)
			{
				var expandedState = 
				c1c_get_prop_from_state_field(itemsCont, "IsExpanded");
				if (expandedState == "true")
					c1c_hide_gr_item_cont(itemsCont);
			}
		}
	}
}

function c1c_hide_gr_item_cont(itemContainer)
{
	if (itemContainer)
	{
		itemContainer.style.display = "none";
		c1c_set_prop_to_state_field(itemContainer, "IsExpanded", "false");
	}
}
function c1c_show_gr_item_cont(itemContainer, contLength, isVert)
{
	if (itemContainer)
	{
		if (isVert)
			itemContainer.style["height"] = contLength;
		else
			itemContainer.style["width"] = contLength;
		itemContainer.style["overflow"] = "auto";
		itemContainer.style.display = "block";
		c1c_set_prop_to_state_field(itemContainer, "IsExpanded", "true");
	}
}
function c1c_toggle_gr_item_cont(itemContainer, contLength, isVert)
{
	if (itemContainer)
	{
		var expandedState = c1c_get_prop_from_state_field(itemContainer, "IsExpanded");
		if (expandedState == null || expandedState == "false")
			c1c_show_gr_item_cont(itemContainer, contLength, isVert);
		else
			c1c_hide_gr_item_cont(itemContainer);
	}
}

function c1c_set_style(el, style_str)
{
	if (!style_str)
		return;
	var kvs = style_str.split(';');
	for (var i = 0; i < kvs.length; ++i) {
		var kv = c1c_splitTwice(kvs[i], ':');
		if (kv.length == 2) {
			if (kv[0] == 'className')
				el.className = kv[1];
			else 
				el.style[c1c_css_attr_to_prop_name(kv[0])] = c1c_trim_all(kv[1]);
		}
	}
	// for apply forecolor from div to table
	// c1c_apply_fore_color_to_child(el);
	c1c_setElementFont(el, null);
}

function c1c_remove_style(el, style_str)
{
	if (!style_str)
		return;
	var kvs = style_str.split(';');
	for (var i = 0; i < kvs.length; ++i) {
		var kv = c1c_splitTwice(kvs[i], ':');
		if (kv.length == 2) 
		{
			if (kv[0] == 'className')
			{
				el.className = "";
			}
			else 
				el.style[c1c_css_attr_to_prop_name(kv[0])] = "";
		}
	}
	c1c_setElementFont(el, null);
	//    c1c_apply_fore_color_to_child(el);
}


function c1c_get_replaced_style(el, style_str)
{
	if (!style_str)
		return;
	var kvs = style_str.split(';');
	var ret = "";
	for (var i = 0; i < kvs.length; ++i) {
		var kv = c1c_splitTwice(kvs[i], ':');
		if (kv.length == 2) 
		{
			if (kv[0] == 'className')
				ret += kv[0] + ':' + el.className;
			else
				ret += kv[0] + ':' + el.style[c1c_css_attr_to_prop_name(kv[0])] + ';';
		}
	}
	return ret;
}


function c1c_css_attr_to_prop_name(attrName)
{
	if (!attrName)
		return '';
	var np = attrName.split('-');
	var ret = np[0];
	for (var i = 1; i < np.length; i++)
	{
		var part = np[i];
		if (part.length > 0)
			part = part.slice(0, 1).toUpperCase() + part.slice(1);
		ret += part;
	}
	return ret;
}

function c1c_get_prop_from_state_str(propName, stateStr)
{
	if (!propName || !stateStr)
		return null;
	var propNameLC = c1c_trim_all(propName).toLowerCase();
	var props = stateStr.split(';');
	for (var i = 0; i < props.length; i++)
	{
		var curProp = props[i].split('=');
		if (curProp.length >= 2 && c1c_trim_all(curProp[0]).toLowerCase() == propNameLC)
			return curProp[1];
	}
	return null;
}
function c1c_set_prop_to_state_str(propName, propValue, stateStr)
{
	var ret = stateStr;
	if (!propName)
		return ret;
	if (!stateStr)
	{
		if (propValue != null)
		{
			ret = propName + '=' + propValue;
		}
		return ret;
	}
	var propNameLC = c1c_trim_all(propName).toLowerCase();
	var props = stateStr.split(';');
	var propIdx = -1;
	for (var i = 0; i < props.length; i++)
	{
		var curProp = props[i].split('=');
		if (curProp.length >= 2 && c1c_trim_all(curProp[0]).toLowerCase() == propNameLC)
		{
			propIdx = i;
			break;
		}
	}
	if (propIdx != -1)
	{
		ret = '';
		for (var i = 0; i < props.length; i++)
		{
			if (i != propIdx)
			{
				ret += props[i];
			}
			else
			{
				if (propValue != null)
					ret += propName + '=' + propValue;
			}
			if (i != props.length - 1)
				ret += ';';
		}
	}
	else
	{
		if (propValue != null)
			ret += ';' + propName + '=' + propValue;
	}
	return ret;
}

function c1c_get_prop_from_state_field(el, propName)
{
	var ret = null;
	var stateField = get_el_state_field(el);
	if (stateField)
		ret = c1c_get_prop_from_state_str(propName, stateField.value);
	return ret;
}

function c1c_set_prop_to_state_field(el, propName, propValue)
{
	var stateField = get_el_state_field(el);
	if (stateField)
	{
		var stateStr = c1c_set_prop_to_state_str(propName, propValue, stateField.value);
		stateField.value = stateStr;
	}
}

function get_el_state_field(el)
{
	var ret = null;
	if (el)
	{
		var stateFieldName = el.getAttribute("StateFieldName");
		if (stateFieldName)
		{
			var doc = window.document;
			var stateFieldColl = doc.getElementsByName(stateFieldName);
			if (stateFieldColl.length > 0)
				ret = stateFieldColl.item(0);
		}
	}
	return ret;
}

function c1c_trim(str, left, right)
{
	if (!str)
		return '';
	var len = str.length;
	var fromIdx = 0;
	var toIdx = len;
	if (left)
	{
		var found = false;
		for (var i = 0; i < len; i++)
		{
			if (str.charAt(i) != ' ')
			{
				fromIdx = i;
				found = true;
				break;
			}
		}
		if (!found)
			return "";
	}
	if (right)
	{
		var found = false;
		for (var i = len - 1; i >= 0; i--)
		{
			if (str.charAt(i) != ' ')
			{
				toIdx = i + 1;
				found = true;
				break;
			}
		}
		if (!found)
			return "";
	}
	return str.slice(fromIdx, toIdx);
}

function c1c_trim_all(str)
{
	return c1c_trim(str, true, true);
}

function c1c_dopostback_ifneeded(item, param)
{
	var postNeeded = item.getAttribute("clickPostBack");
	if (postNeeded == "true")
		__doPostBack(item.id, param);
}

function c1c_do_postback_orlink_ifneeded(item, param)
{
	if (item != null)
	{
		var linkStr = item.getAttribute("LinkUrl");
		var target = item.getAttribute("target");
		if (!target)
			target = '_self';	
		if (linkStr)
			window.open(c1c_trim_all(linkStr),target);
		else
			c1c_dopostback_ifneeded(item,'');
	}
}

// Applies color and font of item to first children's table
function c1c_apply_fore_color_to_child(item)
{
	if (c1c_isIE())
	{
		if (item.children.length > 0)
		{
			var _child = item.children(0);
			if (_child.tagName == 'TABLE')
			{
				_child.className = item.className;
				_child.style.color = item.currentStyle.color;
				_child.style.fontVariant = item.currentStyle.fontVariant;
				_child.style.fontWeight = item.currentStyle.fontWeight;
				_child.style.fontStyle = item.currentStyle.fontStyle;
				_child.style.fontSize = item.currentStyle.fontSize;
				_child.style.fontFamily = item.currentStyle.fontFamily;
				_child.style.textDecorationUnderline = item.style.textDecorationUnderline;
				_child.style.textDecorationOverline = item.style.textDecorationOverline;
				_child.style.textDecorationLineThrough = item.style.textDecorationLineThrough;
			}
		}
	}
}

// True if browser is MSIE
function c1c_isIE()
{
	var ua = window.navigator.userAgent;
	var msie = ua.indexOf('MSIE');
	var opera = ua.indexOf('Opera');
	return ((msie > 0) && (opera < 0));
}

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

function c1c_btn_check_mouse_out(ev, item)
{
	var tgt;
	if (ev.relatedTarget)
		tgt = ev.relatedTarget;
	else if (ev.toElement)
		tgt = ev.toElement;
	return	(!tgt || !c1c_object_contains(item, tgt));
}

function c1c_init_control(id)
{
	var	item = c1c_getElementById(id);
	if (item)
	{
		c1c_setElementFont(item, null);
	}
}

function c1c_hasChildren(item)
{
	return (item.childNodes && item.childNodes.length > 0);
}

function c1c_getChildrenLength(item)
{
	return item.childNodes.length;
}

function c1c_getChild(item, index)
{
	return item.childNodes[index];
}

function c1c_applyParentFont(item, parent)
{
	if (!parent)
		return;
	var fontSize = '';
	if (parent.currentStyle)
		fontSize = parent.currentStyle.fontSize;
	else if (document.defaultView && document.defaultView.getComputedStyle)
		fontSize = document.defaultView.getComputedStyle(parent, '').getPropertyValue('font-size');
	item.style.fontSize = fontSize;
	var fontStyle = '';
	if (parent.currentStyle)
		fontStyle = parent.currentStyle.fontStyle;
	else if (document.defaultView && document.defaultView.getComputedStyle)
		fontStyle = document.defaultView.getComputedStyle(parent, '').getPropertyValue('font-style');
	item.style.fontStyle = fontStyle;
	var fontWeight = '';
	if (parent.currentStyle)
		fontWeight = parent.currentStyle.fontWeight;
	else if (document.defaultView && document.defaultView.getComputedStyle)
		fontWeight = document.defaultView.getComputedStyle(parent, '').getPropertyValue('font-weight');
	item.style.fontWeight = fontWeight;
	var fontStyle = '';
	if (parent.currentStyle)
		fontStyle = parent.currentStyle.fontStyle;
	else if (document.defaultView && document.defaultView.getComputedStyle)
		fontStyle = document.defaultView.getComputedStyle(parent, '').getPropertyValue('font-style');
	item.style.fontStyle = fontStyle;
	var fontVariant = '';
	if (parent.currentStyle)
		fontVariant = parent.currentStyle.fontVariant;
	else if (document.defaultView && document.defaultView.getComputedStyle)
		fontVariant = document.defaultView.getComputedStyle(parent, '').getPropertyValue('font-variant');
	item.style.fontVariant = fontVariant;
	var color = '';
	if (parent.currentStyle)
		color = parent.currentStyle.color;
	else if (document.defaultView && document.defaultView.getComputedStyle)
		color = document.defaultView.getComputedStyle(parent, '').getPropertyValue('color');
	item.style.color = color;
	var textDecoration = '';
	if (parent.currentStyle)
	{
		if (parent.style.textDecoration && parent.style.textDecoration != '')
			textDecoration = parent.style.textDecoration;
		else if (parent.className != '' && parent.currentStyle.textDecoration != '')
		{
			try
			{
			var re = new RegExp("(^| |,)\\."+parent.className+"($| |,)", "gi");
			for (var s = 0; s < document.styleSheets.length; s++)
				for (var r = 0; r < document.styleSheets[s].rules.length; r++)
					if (document.styleSheets[s].rules[r].selectorText.search(re) != -1) 
					{
						var style = document.styleSheets[s].rules[r].style;
						if (style.textDecoration && style.textDecoration != '')
						{
							if (textDecoration != '')
				                        	textDecoration += ' ';
							textDecoration += style.textDecoration;
						}
					}
			}
			catch (exception)
			{
				textDecoration = parent.currentStyle.textDecoration;
			}
		}
	}
	else if (document.defaultView && document.defaultView.getComputedStyle)
		textDecoration = document.defaultView.getComputedStyle(parent, '').getPropertyValue('text-decoration');
	item.style.textDecoration = textDecoration;
}

function c1c_setElementFont(item, parent)
{
	if (!c1c_hasChildren(item))
		return;
	c1c_applyParentFont(item, parent);
	var l = c1c_getChildrenLength(item);
	for(var i=0;i<l;i++)
	{
		var child = c1c_getChild(item, i);
		c1c_setElementFont(child, item);
	}
}

// Utils
function c1c_getElementById(id) {
	var	result = null;
	if (document.getElementById) {
		result = document.getElementById(id);
	}
	else if (document.all) {
		result = document.all[id];
	}
	else if (document.layers) {
		result = document.layers[id];
	}
	return result;
}

function c1c_splitTwice(str, ch)
{
	var res = new Array();

	if (str)
	{
		var i = str.indexOf(ch);
		
		if (i >= 0)
		{
			res[0] = str.substr(0, i);
			res[1] = str.substr(i + 1, str.length);
		}
	}

	return res;
}
