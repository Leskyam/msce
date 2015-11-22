// Copyright (c) 2002-2005 ComponentOne L.L.C. All rights reserved.
// Version 1.0.20053.121, 20-Jul-2005

var isIE = (navigator.userAgent.indexOf('MSIE') != -1);

var tbDatas;
if (!tbDatas)
    tbDatas = [];
var dragObj = null;
var deltaX = 0;
var deltaY = 0;

//INIT STUFF
function c1c_topicbar_init(id, canDrag, collapsePb, expandPb, clickPb, selectPb, autoCollapse, btnStyle, blankUrl, uniqueID)
{
	var tb = document.getElementById(id);
	
	tbDatas[id] = new c1c_innerInit(id, tb, canDrag, collapsePb, expandPb, clickPb, selectPb, autoCollapse, btnStyle, blankUrl, uniqueID);
	
	if (!tbDatas[id].expandedGroup)
		tbDatas[id].btnStyle = false;
	
	if (! tbDatas[id].btnStyle && tb)
		tb.style.height = 0;
	else
		if (tbDatas[id].expandedGroup)
		{
			var row = c1c_getGroupContentRow(tbDatas[id].expandedGroup);
			var tbl = row.cells[0].firstChild;
			row = tbl.rows[tbl.rows.length-1];
			row = row.cells[0]; //group table
			
			c1c_setHeight(row, tbDatas[id].availHeight);
		}
		
	c1c_getHeadersPos(tb, tbDatas[id].headers);		 
			
	if (isIE)
	{			
		document.attachEvent("onmousemove", c1c_docOnMouseMove);
		document.attachEvent("onmouseup", c1c_docOnMouseUp);
		document.attachEvent("onselectstart", c1c_docOnSelectStart);
	}
	else
	{
		document.onmousemove = c1c_docOnMouseMove;
		document.onmouseup = c1c_docOnMouseUp;
		document.onselectstart = c1c_docOnSelectStart;
	}		
}


function c1c_innerInit(id, tb, canDrag, collapsePb, expandPb, clickPb, selectPb, autoCollapse, btnStyle, blankUrl, uniqueID)
{
	this.selectedItem = c1c_getSelectedItem(tb);
	this.expandedGroup = c1c_getExpandedGroup(tb);
	this.groupsDragStatus = c1c_getByName("__" + id + "_GDSF");
	this.groupsStatus = c1c_getByName("__" + id + "_GSF");
	this.selectionStatus = c1c_getByName("__" + id + "_SSF");
	this.canDrag = (canDrag == 1);
	this.collapsePb = (collapsePb == 1);
	this.expandPb = (expandPb == 1);
	this.clickPb = (clickPb == 1);
	this.selectPb = (selectPb == 1);
	this.headers = new Array();
	this.init = false;
	this.autoCollapse = (autoCollapse == 1);
	this.btnStyle = (btnStyle == 1);
	this.blankUrl = blankUrl;
	this.uniqueID = uniqueID;
	
	this.height = (tb) ? tb.offsetHeight : 0;
	this.availHeight = 0;
	
	if (this.btnStyle)
		this.availHeight = c1c_getAvailHeight(tb, this.expandedGroup, this.height);
}


function c1c_getAvailHeight(tb, expdGroup,  height)
{
	var res = height;
	
	var grpRows = tb.rows[0].cells[0].firstChild.rows; //group rows
	for (var i = 0; i < grpRows.length; i++)
	{
		var tmp = grpRows[i].cells[0].firstChild; //group table;
		if (tmp.rows.length == 2)
		{
			var tab = tmp.rows[0].cells[0].firstChild; //header table
			res -= tab.offsetHeight;
			if (!c1c_canToggle(tab))
			{
				tab = tmp.rows[tmp.rows.length-1].cells[0].firstChild; //body table;
				res -= tab.offsetHeight;
			}
		}
	}
	
	return res;
}


function c1c_getHeadersPos(tb, headers)
{
	if (tb && headers)
	{
		var grpRows = tb.rows[0].cells[0].firstChild.rows;
		for (var i = 0; i < grpRows.length; i++)
		{
			var grpTable = grpRows[i].cells[0].firstChild;
			if (grpTable.rows.length == 2)
			{
				var ht = grpTable.rows[0].cells[0].firstChild;
				headers[i] = new c1c_coords(c1c_findPosX(ht), c1c_findPosY(ht), ht.offsetWidth, ht.offsetHeight, ht);
			}
		}
	}
}


function c1c_dragObj(id, idx, obj, lh, hdr)
{
	this.dragFromTopicId = id;
	this.groupIdx = idx;
	this.o = obj;
	this.o.style["zIndex"] = "1";
	this.lastHighlight = lh;
	this.header = hdr;
}


function c1c_coords(x, y, w, h, hdr)
{
	this.x = x;
	this.y = y;
	this.width = w;
	this.height = h;
	this.xx = x + w;
	this.yy = y + h;
	this.header = hdr;
}


//DOC STUFF (Drag-n-drop)
function c1c_docOnSelectStart(e)
{
	if (dragObj || c1c_getTopicBar(e.srcElement))
		return false;
}


function c1c_onHeaderMouseDown(src, e)
{
	if (dragObj == null && c1c_canDrag(src))
	{
		dragObj = new c1c_dragObj(c1c_getTopicBarId(src), c1c_getGroupIdx(src), document.getElementById("c1c_dragItem"), src, src); 
		 
		if (dragObj != null)
		{
			dragObj.o.style.height = src.offsetHeight;
			dragObj.o.style.width = src.offsetWidth;
			dragObj.o.style.left = c1c_findPosX(src); 
			dragObj.o.style.top = c1c_findPosY(src); 
			
			var evt = c1c_e(e);
			deltaX = parseInt(dragObj.o.style.left) - evt.x;
			deltaY = parseInt(dragObj.o.style.top) - evt.y;
		
			//dragObj.o.innerHTML = src.outerHTML;
			dragObj.o.appendChild(src.cloneNode(true));
		
			c1c_clearNode(dragObj.o.firstChild);
		}
	}
}


function c1c_docOnMouseMove(e)
{
	if (dragObj != null && c1c_e(e).leftBtn)
	{
		dragObj.o.style["zIndex"] = "10000";
		if (dragObj.o.style.visibility != "visible")
		{
			dragObj.o.style.visibility = "visible";
			dragObj.o.firstChild.style.cursor = "";
		}
	
		var hdr = c1c_isMouseOverHeader(e, dragObj.dragFromTopicId);
		
		if (dragObj && dragObj.lastHighlight && hdr != dragObj.lastHighlight)
		{
			c1c_onHeaderMouseOut(dragObj.lastHighlight, null);
			dragObj.lastHighlight = null;
		}

		if (hdr && hdr != dragObj.lastHighlight) // if (hdr)
		{
			c1c_onHeaderMouseOver(hdr, null); 
			dragObj.lastHighlight = hdr;
		}
			
		var evt = c1c_e(e);
		dragObj.o.style.left = deltaX + evt.x;
		dragObj.o.style.top = deltaY + evt.y;
	}
}


function c1c_docOnMouseUp(e)
{
	if (dragObj != null)
	{
		dragObj.o.style.visibility = "hidden";
		dragObj.o.firstChild.style.cursor = "pointer";
		dragObj.o.removeChild(dragObj.o.firstChild);
		
		var hdr = c1c_isMouseOverHeader(e, dragObj.dragFromTopicId);
		if (hdr != null)
		{
			//hdr.style.cursor = "pointer";
			
			if (dragObj.lastHighlight != null)
				c1c_onHeaderMouseOut(dragObj.lastHighlight, null);
		
			var row = c1c_getGroupContentRow(dragObj.header);
			var src = row.cloneNode(true);
			var dst = c1c_getGroupContentRow(hdr);
		
			var srcIdx = row.rowIndex;	
			var dstIdx = dst.rowIndex;
			
			var isItems = c1c_getAttribute(row, "items");
			var allowselection = c1c_getAttribute(row, "allowselection");
					
			var grpsTable = c1c_upToTag(row, "TABLE"); 
			grpsTable.deleteRow(srcIdx);
			
			row = grpsTable.insertRow(dstIdx);

			if (isIE)
				row.appendChild(src.firstChild);
			else
				c1c_copyContent(src, row);
				//row.innerHTML = src.innerHTML;
				
			row.setAttribute("grprow", 1);
			if (isItems)
				row.setAttribute("items", 1);
			if (allowselection)
				row.setAttribute("allowselection", 1);
				
			var tb = c1c_getTopicBar(hdr);
			var id = c1c_getAttribute(tb, "id");
			
			tbDatas[id].selectedItem = c1c_getSelectedItem(tb);
			tbDatas[id].expandedGroup = c1c_getExpandedGroup(tb);  
			
			c1c_getHeadersPos(document.getElementById(id), tbDatas[id].headers);  

			if (tbDatas[id].selectionStatus.value != "")
				tbDatas[id].selectionStatus.value = tbDatas[id].selectedItem;
				
			tbDatas[id].groupsDragStatus.value += srcIdx + ":" + dstIdx + ";";
			
			c1c_refreshGroupsStatus(id, srcIdx, dstIdx);
			
			hdr = c1c_isMouseOverHeader(e, dragObj.dragFromTopicId);
			if (hdr)
				c1c_onHeaderMouseOver(hdr, null);
		}
		
		dragObj.header = null;
		dragObj.lastHighlight = null;
		dragObj = null;
	}
}


function c1c_refreshGroupsStatus(id, srcIdx, dstIdx)
{
	var val = tbDatas[id].groupsStatus.value;
	if (val)
	{
		var grps = val.split(";");
		val = "";
		
		for (var i = 0; i < grps.length - 1; i++)
		{
			if (grps[i] == srcIdx)
				grps[i] = dstIdx;
			else
			{
				if (grps[i] > srcIdx)
					grps[i]--;
				
				if (grps[i] >= dstIdx)
					grps[i]++;
			}
				
			val += grps[i] + ";";
		}
	}

	tbDatas[id].groupsStatus.value = val;	
}


//e == null when calling from code
function c1c_onHeaderMouseOver(src, e)
{
	if (!src.disabled && !(dragObj && e))
	{
		var expanded = c1c_isVisible(c1c_getHeaderContentRow(src).nextSibling);
		var applyStyle = c1c_getAttribute(src, (expanded) ? "movExpandedStyle" : "movCollapsedStyle");
		
		if (applyStyle)
			c1c_setHeaderStyle(src, applyStyle);
		else
		{
			applyStyle = c1c_getAttribute(src, (expanded) ? "expandedStyle" : "collapsedStyle");
			if (applyStyle)
				c1c_setHeaderStyle(src, applyStyle);
			else
				c1c_resetHeaderImages(src);
		}
		if ((c1c_canDrag(src) || c1c_canToggle(src)) && src.style.cursor != "pointer")
			src.style.cursor = "pointer";
	}
}	


//e == null when calling from code
function c1c_onHeaderMouseOut(src, e)
{
	if (!src.disabled && !(dragObj && e))
	{
		var expanded = c1c_isVisible(c1c_getHeaderContentRow(src).nextSibling);
		var applyStyle = c1c_getAttribute(src, (expanded) ? "expandedStyle" : "collapsedStyle");

		if (applyStyle != null)
			c1c_setHeaderStyle(src, applyStyle);		
	}
}


function c1c_toggleGroup(src, e)
{
	e.cancelBubble = true;
	
	if (!src.disabled)
	{
		src = c1c_upToTag(src, "TABLE");

		var id = c1c_getTopicBarId(src);
		var row = c1c_getHeaderContentRow(src);
	
		if (tbDatas[id].btnStyle && c1c_isVisible(row.nextSibling) && tbDatas[id].expandedGroup == src)
			return; 
		
		if (c1c_canToggle(src))
		{
			c1c_toggleVisibility(row.nextSibling); //body row
			var expanded = c1c_isVisible(row.nextSibling);

			c1c_updateGroupsStatus(row);
			
			if (tbDatas[id].expandedGroup)
				c1c_onHeaderMouseOut(tbDatas[id].expandedGroup, null); 
			
			if (tbDatas[id].autoCollapse && tbDatas[id].expandedGroup && src != tbDatas[id].expandedGroup)
			{
				if (tbDatas[id].btnStyle)
				{
					c1c_setHeight(row.nextSibling.cells[0], tbDatas[id].availHeight);  
				}

				row = c1c_getHeaderContentRow(tbDatas[id].expandedGroup);
	
				if (expanded)
				{ 
					if (tbDatas[id].btnStyle)
						c1c_setHeight(row.nextSibling.cells[0], "0"); 

					c1c_toggleVisibility(row.nextSibling); //body row
					c1c_onHeaderMouseOut(tbDatas[id].expandedGroup, null); 
					c1c_updateGroupsStatus(row);
				}
			}
	
			tbDatas[id].expandedGroup = (expanded) ? src : null;
		
			if ((tbDatas[id].expandPb && expanded) || (tbDatas[id].collapsePb && !expanded))
				__doPostBack(tbDatas[id].uniqueID, "");
			else
			{
				c1c_getHeadersPos(document.getElementById(id), tbDatas[id].headers);  
				
				if (!tbDatas[id].autoCollapse)
					c1c_onHeaderMouseOver(src, e); //mouse always over header
				else
				{
					var hdr = c1c_isMouseOverHeader(e, id)
					if (hdr)
						c1c_onHeaderMouseOver(hdr, e);
					else
						c1c_onHeaderMouseOut(src, e); 
				}
			}
		}
	}
}


function c1c_onItemMouseOver(src, e)
{
	if (!src.disabled && !dragObj)
	{
		var id = c1c_getTopicBarId(src);
		
		var itemInfo = c1c_getGroupItemInfo(src);
	
		if (tbDatas[id].selectedItem != itemInfo)
		{
			var applyStyle = c1c_getAttribute(src, "movStyle");

			if (applyStyle != null)
				c1c_setItemStyle(src, applyStyle, id);
		}
	
		if (c1c_isSpecified(src.onclick) || c1c_isSpecified(src.ondblclick))
		{
			src.style.cursor = "pointer";
	
			var href = c1c_getHref(src);
			if (href)
				window.defaultStatus = href;
		}
	}
}


function c1c_onItemMouseOut(src, e)
{
	if (!src.disabled && !dragObj)
	{
		var id = c1c_getTopicBarId(src);
		var itemInfo = c1c_getGroupItemInfo(src);
	
		if (tbDatas[id].selectedItem != itemInfo)
		{
			var applyStyle = c1c_getAttribute(src, "itemStyle");

			if (applyStyle != null)
				c1c_setItemStyle(src, applyStyle, id);
			else
			{
				src.style.cssText = "";
				c1c_resetItemContent(src, id);
			}
		}
	
		window.defaultStatus = "";
	}
}


function c1c_onItemClick(src, e)
{
	var id = c1c_getTopicBarId(src);
	var itemInfo = c1c_getGroupItemInfo(src);
	
	//if (tbDatas[id].selectedItem != itemInfo)
	//{
		var tmp = tbDatas[id].selectedItem;

		var group = c1c_getGroupContentRow(src);
		var allowselection = (group && c1c_getAttribute(group, "allowselection") == "1")
		
		if (allowselection)
		{
			tbDatas[id].selectedItem = itemInfo;

		}
		tbDatas[id].selectionStatus.value = itemInfo;		
		
		if (!c1c_isAnchor(src) && (tbDatas[id].clickPb || c1c_checkItemCausesValidation(src) || (tbDatas[id].selectPb && (!allowselection || !c1c_isSelected(src)))))
                {
			__doPostBack(tbDatas[id].uniqueID, itemInfo);
			e.cancelBubble = true;
			return;
                }
		else
		{
			if (tmp)
			{
				tmp = c1c_getItemByItemInfo(id, tmp);
				tmp.removeAttribute("selected");
				c1c_onItemMouseOut(tmp, e);
			}
	
			if (allowselection)
			{
				var applyStyle = c1c_getAttribute(src, "selectedStyle");
				{
					if (applyStyle != null)
						c1c_setItemStyle(src, applyStyle, id);
			        		src.setAttribute("selected", "1");
				}
			}
		}
	//}
	
	c1c_clickAnchor(src);
	e.cancelBubble = true;
		
}


function c1c_getHref(itemDiv)
{
	var res = ""
	
	if (itemDiv)
	{
		var a = itemDiv.getElementsByTagName("A");
		if (a)
			res = c1c_getAttribute(a[0], "h_ref");
	}
	
	return res;
}

function c1c_clickAnchor(itemDiv)
{
	if (itemDiv)
	{
		var href = c1c_getHref(itemDiv);
		var target = c1c_getTarget(itemDiv);
		if (target && href)
	        {
			window.open(href, target);
	        }
		else if (href)
	        {
			window.document.location.href = href;
	        }
	}	
}

function c1c_isAnchor(itemDiv)
{
	if (itemDiv)
	{
		var href = c1c_getHref(itemDiv);
		if (href)
			return true;
	}	
	return false;
}

function c1c_getTarget(itemDiv)
{
	var res = ""
	
	if (itemDiv)
	{
		var a = itemDiv.getElementsByTagName("A");
		if (a)
			res = c1c_getAttribute(a[0], "target");
	}
	
	return res;
}



function c1c_getItemByItemInfo(id, info)
{
	var tb = document.getElementById(id);
	var inf = info.split(":");
		
	var grpRow = tb.rows[0].cells[0].firstChild.rows[parseInt(inf[0])];
	var grpTable = grpRow.cells[0].firstChild;
	var grpBody =  grpTable.rows[grpTable.rows.length - 1].cells[0]; // body
        var itmTable = grpBody.childNodes[inf[1]];
        var itm = itmTable.rows[0].cells[0];
	
	return itm;
}


//HEADER STUFF
function c1c_canToggle(o)
{
	return (c1c_getAttribute(o, "banToggle") == null);
}


function getCaptionImg(hdrTable)
{
	return hdrTable.rows[0].cells[0].firstChild;
}


function getIndicatorImg(hdrTable)
{
	return hdrTable.rows[0].cells[2].firstChild;
}


function c1c_resetHeaderImagesSp(hdrTable, isCapSet, isIndSet, isBgSet)
{
	if (!isBgSet)
	{
		if (hdrTable.style.backgroundImage)
			hdrTable.style.backgroundImage = "";
	}	
	if (!isCapSet)
	{
		obj = getCaptionImg(hdrTable);
		c1c_setVisibility(obj, false);
	}
	
	if (!isIndSet)
	{
		obj = getIndicatorImg(hdrTable);
		c1c_setVisibility(obj, false);
	}
}

function c1c_resetHeaderImages(hdrTable)
{
	c1c_resetHeaderImagesSp(hdrTable, false, false, false);
}


function c1c_setHeaderStyle(table, styleStr)
{
	var isBgSet = false;
	var isCapSet = false;
	var isIndSet = false;
	var isCssClassSet = false;
	//table.style.cssText = "";
	styleStr += "width:100%";
	//table.className = "";
	var ss = styleStr.split(";");
	
	for (var i = 0; i < ss.length; i++)
	{
		var pair = c1c_splitTwice(ss[i], ":");
		if (pair.length == 2)
		{
			if (pair[0] == "className")
			{
				table.className = pair[1];
				isCssClassSet = true;
			}
			else
				if (pair[0] == "captionImg")
				{
					var captImg = getCaptionImg(table); 
					captImg.src = pair[1];
					c1c_setVisibility(captImg, true);
					isCapSet = true;
				}
				else
					if (pair[0] == "indicatorImg")
					{
						var indImg = getIndicatorImg(table);
						indImg.src = pair[1];
						c1c_setVisibility(indImg, true);
						isIndSet = true;
					}
					else
					{
						if (pair[0] == 'backgroundImage')	
							isBgSet = true;	
						if (table.style[pair[0]] != pair[1])
						 	table.style[pair[0]] = pair[1];
					}
		}
	}
	if (!isCssClassSet && table.className != '')
	{
		table.className = '';
	}
	c1c_resetHeaderImagesSp(table, isCapSet, isIndSet, isBgSet);
	
}


function c1c_updateGroupsStatus(o)
{
	var o = c1c_getGroupContentRow(o);
	var id = c1c_getTopicBarId(o);
	
	if (tbDatas[id].init == 0)
	{
		tbDatas[id].groupsStatus.value = "";
		tbDatas[id].init = 1;
	}
	
	var tmp = tbDatas[id].groupsStatus.value.split(";");

	tbDatas[id].groupsStatus.value = "";
	var f = false;
			
	for (var i = 0; i < tmp.length - 1; i++)
		if (tmp[i] != o.rowIndex)
			tbDatas[id].groupsStatus.value += tmp[i] + ";";
		else
			f = true;
					
	if (!f)
		tbDatas[id].groupsStatus.value += o.rowIndex + ";";
}


//ITEMS STUFF
function c1c_moveContent(src, dest)
{
     while(src.firstChild)
     {
        var o = src.firstChild;
        src.removeChild(o);
        dest.appendChild(o);
     }
}

function c1c_resetItemContent(div, id)
{	
	var inTable = div.firstChild;
	if (inTable)
	{
		var celldest = inTable.rows[1].cells[0];

		var cellsrc = inTable.rows[0].cells[1];
		c1c_moveContent(cellsrc, celldest);

		var cellsrc = inTable.rows[1].cells[2];
		c1c_moveContent(cellsrc, celldest);

		var cellsrc = inTable.rows[2].cells[1];
		c1c_moveContent(cellsrc, celldest);
		c1c_updateItemImgSp(div, "Near");
	}   
}

function c1c_updateItemImgSp(div, imgPos)
{
	var inTable = div.firstChild;
	var cell = inTable.rows[1].cells[1];
	if (inTable)
	{
		if (imgPos == "Far")
		{
			var p;
			p = cell.style.paddingLeft;
			if (!p || p == "")
				p = cell.style.paddingTop;
			if (!p || p == "")
				p = cell.style.paddingBottom;
			if (!p || p == "")
				cell.style.paddingRight = p;
                } else
		if (imgPos == "Top")
		{
			var p;
			p = cell.style.paddingLeft;
			if (!p || p == "")
				p = cell.style.paddingRight;
			if (!p || p == "")
				p = cell.style.paddingBottom;
			if (!p || p == "")
				cell.style.paddingTop = p;
                } else
		if (imgPos == "Bottom")
		{
			var p;
			p = cell.style.paddingLeft;
			if (!p || p == "")
				p = cell.style.paddingRight;
			if (!p || p == "")
				p = cell.style.paddingTop;
			if (!p || p == "")
				cell.style.paddingBottom = p;
                } else
		{
			var p;
			p = cell.style.paddingBottom;
			if (!p || p == "")
				p = cell.style.paddingRight;
			if (!p || p == "")
				p = cell.style.paddingTop;
			if (!p || p == "")
				cell.style.paddingLeft = p;
                }
	}
}

function c1c_updateImgTxSp(div, sp)
{
	var inTable = div.firstChild;
	if (inTable)
	{
		var cell = inTable.rows[1].cells[1];
		cell.style.padding = "";
		if (inTable.rows[0].cells[1].firstChild)
			cell.style.paddingTop = sp;
		else if (inTable.rows[1].cells[0].firstChild)
			cell.style.paddingLeft = sp;
		else if (inTable.rows[1].cells[2].firstChild)
			cell.style.paddingRight = sp;
		else if (inTable.rows[2].cells[1].firstChild)
			cell.style.paddingBottom = sp;
	}
}

function c1c_updateItemContent(div, imgPos)
{
	var inTable = div.firstChild;
	if (inTable)
	{
		if (imgPos == "Far")
		{
			var celldest = inTable.rows[1].cells[2];

			var cellsrc = inTable.rows[0].cells[1];
			c1c_moveContent(cellsrc, celldest);

			var cellsrc = inTable.rows[1].cells[0];
			c1c_moveContent(cellsrc, celldest);

			var cellsrc = inTable.rows[2].cells[1];
			c1c_moveContent(cellsrc, celldest);
		}
		else
		if (imgPos == "Top")
		{
			var celldest = inTable.rows[0].cells[1];

			var cellsrc = inTable.rows[1].cells[2];
			c1c_moveContent(cellsrc, celldest);

			var cellsrc = inTable.rows[1].cells[0];
			c1c_moveContent(cellsrc, celldest);

			var cellsrc = inTable.rows[2].cells[1];
			c1c_moveContent(cellsrc, celldest);
		}
		else
		if (imgPos == "Bottom")
		{
			var celldest = inTable.rows[2].cells[1];

			var cellsrc = inTable.rows[0].cells[1];
			c1c_moveContent(cellsrc, celldest);

			var cellsrc = inTable.rows[1].cells[0];
			c1c_moveContent(cellsrc, celldest);

			var cellsrc = inTable.rows[1].cells[2];
			c1c_moveContent(cellsrc, celldest);
		}
		c1c_updateItemImgSp(div, imgPos);
	}
}


function c1c_getItemImagePosition(div)
{
	var res = "None";
	var itmTbl = div.firstChild;
	if (itmTbl.rows[0].cells[1].firstChild)
		res = "Top";
	else if (itmTbl.rows[1].cells[0].firstChild)
		res = "Near";
	else if (itmTbl.rows[1].cells[2].firstChild)
		res = "Far";
	else if (itmTbl.rows[2].cells[1].firstChild)
		res = "Bottom";
	return res;
}


function c1c_setItemStyle(div, styleStr, id)
{

	div.style.cssText = "";
	styleStr += "width:100%";
	div.className = "";

	var ss = styleStr.split(";");
	for (var i = 0; i < ss.length; i++)
	{
		var pair = c1c_splitTwice(ss[i], ":");

		if (pair.length == 2)
			if (pair[0] == "className")
				div.className = pair[1];
			else
				if (pair[0] == "itemImgPos")
				{
					if (c1c_getItemImagePosition(div) != pair[1])
					{
						c1c_resetItemContent(div, id);
						c1c_updateItemContent(div, pair[1]);
					}
				}
				else
					if (pair[0] == "imgTxSp")
					{
						c1c_updateImgTxSp(div, pair[1]);
					}
					else
						div.style[pair[0]] = pair[1];
	}
	c1c_setInnerTextProps(div);
}

function c1c_setInnerTextProps(o)
{
	c1c_setElementFont(o, null);
}


//MISC//
function c1c_isMouseOverHeader(e, id)
{
	var hdrs = tbDatas[id].headers;
	var evt = c1c_e(e);

	for (var i = 0; i < hdrs.length; i++)
		if (evt.x > hdrs[i].x && evt.x < hdrs[i].xx && evt.y > hdrs[i].y && evt.y < hdrs[i].yy)			
			if (dragObj == null || i != dragObj.groupIdx)
				return hdrs[i].header;
				
	return null;
}


//return header table
function c1c_getExpandedGroup(o)
{
	var res = null;
	if (o)
	{
		var grpRows = o.rows[0].cells[0].firstChild.rows;
	
		for (var i = 0; i < grpRows.length && res == null; i++)
		{
			var grp = grpRows[i].cells[0].firstChild;

			if ((grp.rows.length == 2) && c1c_isVisible(grp.rows[1]) && c1c_canToggle(grp.rows[0].cells[0].firstChild))
				res = grp.rows[0].cells[0].firstChild;
		}
	}
	
	return res;
}


function c1c_getSelectedItem(tb)
{
	var res = null;
	
	if (tb)
	{
		var grpRows = tb.rows[0].cells[0].firstChild.rows;
	
		for (var i = 0; i < grpRows.length && res == null; i++)
		{
			if (c1c_getAttribute(grpRows[i], "items"))
			{
				var grpTable = grpRows[i].cells[0].firstChild;
				//var items = body.rows[0].cells[0].firstChild.rows;
				var body = grpRows[i].cells[0].firstChild;
				body = body.rows[body.rows.length-1].cells[0];
				if (body && body.childNodes)		
				{
					for (var j = 0; j < body.childNodes.length && res == null; j++)
					{
						var itemDiv = body.childNodes[j].rows[0].cells[0];
			
						if (c1c_isSelected(itemDiv))
							res = i + ":" + c1c_getIdx(itemDiv); //#grpoup:#item
					}
				}
			}
		}
	}
	
	return res;
}

function c1c_getItemIdx(obj)
{
	var idx = c1c_getAttribute(obj, "itemidx");
	if (idx)
		return parseInt(idx);
	else
		return 0;
}

function c1c_getIdx(obj)
{
	var res = -1;
	
	if (obj)
	{
		var obt = c1c_upToTag(obj, "TABLE"); //group table
		if (obt) 
			prnt = c1c_getParent(obt);
		if (prnt)
			for (var i = 0; i < prnt.childNodes.length; i++)
				if (prnt.childNodes[i].tagName == obt.tagName)
				{
					res++;
					if (prnt.childNodes[i] == obt)
						return res;
				}
	}
	
	return res;
}


function c1c_getGroupItemInfo(itemDiv)
{
	var o = c1c_upToTag(itemDiv, "TABLE"); //group table
	do
        {
		o = c1c_getParent(o);
		o = c1c_upToTag(o, "TR"); //group row
	}
	while (o && !(c1c_getAttribute(o,"grprow")=="1"))
	
	return o.rowIndex + ":" + c1c_getIdx(itemDiv);
}


function c1c_getHeaderContentRow(o)
{
	var res = o;
	while (res != null && c1c_getAttribute(res, "hdrrow") == null)
		res = c1c_getParent(res);

	return res;
}

function c1c_getGroupBodyContentRow(o)
{
	var res = o;
	while (res != null && c1c_getAttribute(res, "bodyrow") == null)
		res = c1c_getParent(res);

	return res;
}

function c1c_canDrag(o)
{
	var id = c1c_getTopicBarId(o);
	return tbDatas[id].canDrag; 
}

function c1c_getGroupContentRow(o)
{
	var res = c1c_getHeaderContentRow(o);
	if (!res)
		res = c1c_getGroupBodyContentRow(o);
	if (res)
	{
		res = c1c_getParent(res);
		res = c1c_upToTag(res, "TR"); 
	}
	
	return res;
}

function c1c_getGroupIdx(hdrTable)
{
	if (hdrTable != null)
		return c1c_getGroupContentRow(hdrTable).rowIndex; 
	else
		return -1;
}

function c1c_isSelected(itemDiv)
{
	return c1c_getAttribute(itemDiv, "selected");
}


function c1c_isVisible(o)
{
	return (!o.style.display || o.style.display == "");
}


function c1c_toggleVisibility(o)
{
	c1c_setVisibility(o, !c1c_isVisible(o));
}


function c1c_setVisibility(o, visible)
{
	o.style.display = (visible) ? "" : "none";
}


function c1c_getAttribute(o, name)
{
	try
	{
	if (o != null)
	{
		if (o.getAttribute)
			return o.getAttribute(name);
	
		if (o.attributes)
		{
			var atr = o.attributes[name];
			return (atr) ? val.value : null;
		}
		else
			return o[name];	
	}
	else
		return null;
	}
	catch (exception)
	{
		return null;
	}
}


function c1c_upToTag(o, name)
{
	var res = o;
	
	while (res != null && res.tagName != name)
		res = c1c_getParent(res);

	return res;
}


function c1c_getTopicBar(o)
{
	while (o != null && c1c_getAttribute(o, "tbtop") == null)
		o = c1c_getParent(o);

	return o;
}


function c1c_getTopicBarId(o)
{
	o = c1c_getTopicBar(o);
	return c1c_getAttribute(o, "id");
}

function c1c_getParent(o)
{
	if (o != null)
		return (o.parentElement) ? o.parentElement : o.parentNode;
	else
		return null;
}

function c1c_findPosX(o)
{
	var res = 0;
  
	if (o)
	do 
	{
		res += o.offsetLeft + ((o.border == undefined || o.border == "") ? 0 : parseInt(o.border));
		o = o.offsetParent;
	} 
	while (o != null);
   
   	return res;
}


function c1c_findPosY(elem)
{
	var res = 0;

	if (elem)
	do 
	{
		res += elem.offsetTop + ((elem.border == undefined || elem.border == "") ? 0 : parseInt(elem.border));
		elem = elem.offsetParent;
	} 
	while (elem != null);
   
	return res;
}

function c1c_isSpecified(val)
{
	return (val && (typeof(val) != "undefied")) ? true : false;
}


function c1c_setHeight(o, val)
{
	//if (o.style && o.style["height"])
	if (o.style)
		o.style["height"] = val;
	else
		o.setAttribute("height", val);
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

//CROSSBROWSER
function c1c_getByName(name)
{
	var o = document.getElementById(name);
	if (!o)
	{
		for (var i = 0; i < document.forms.length; i++)
		if (typeof(document.forms[i].elements[name]) != "undefined")
		{
			o = document.forms[i].elements[name]
			break;				
		}
	}
	
	return o;
}


function c1c_e(e)
{
	var o = new Object();
	
	o.x = (isIE) ? e.x : e.pageX;
	o.y = (isIE) ? e.y : e.pageY;
	o.leftBtn = (isIE) ? (e.button == 1) : true;
	
	return o;
}


function c1c_cleanNode(dest)
{
	while (child = dest.firstChild) dest.removeChild(child);
}


function c1c_copyContent(from, to)
{
	c1c_cleanNode(to);
	
	if (isIE)
	{
		var tmp = to.cloneNode(false);
		tmp.innerHTML = from.innerHTML;
		to.replaceNode(tmp);
	}
	else
		for (var child = from.firstChild; child; child = child.nextSibling)
			c1c_copyNodeDOM(child, to);
}

function c1c_copyNodeDOM(node, to)
{
	var newNode;

	switch (node.nodeType)
	{
		case 1: // ELEMENT_NODE
			newNode = document.createElement(node.nodeName.toLowerCase());

			for (var i = 0; i < node.attributes.length; i++)
			{
				var value = node.attributes[i].nodeValue;

				if (node.attributes[i].specified && value != null)
					newNode.setAttribute(node.attributes[i].nodeName.toLowerCase(), value);
			}

			c1c_copyContent(node, newNode);
			break;

		case 3:   //TEXT_NODE
			newNode = document.createTextNode(node.nodeValue);
			break;
	}

	if (newNode)
	{
		var addedNode;
		addedNode = to.appendChild(newNode);
		if (node.form)
			addedNode.value = node.value;
	}
}


function c1c_clearNode(o)
{
	c1c_clear(o, 0); 
}

function c1c_clear(o, level)
{
	while (o != null)
	{
		if (o.onmouseout)
			o.onmouseout =  null;
		
		if (o.onmouseover)
			o.onmouseover = null;
		
		if (o.onclick)
			o.onclick = null;
			
		if (o.ondblclick)
			o.ondblclick = null;
		
		if (c1c_getAttribute(o, "id"))
			o.removeAttribute("id");
		
		c1c_clear(o.firstChild, level + 1);
		
		if (level == 0)
			return;
	
		o = o.nextSisbling;
	}
}

//PAGE VALIDATION
// returns true if item has attribute "CausesValidation"
function c1c_checkItemCausesValidation(obj)
{
	return c1c_getAttribute(obj, "CausesValidation");
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
	var textAlign = '';
	if (parent.currentStyle)
		textAlign = parent.currentStyle.textAlign;
	else if (document.defaultView && document.defaultView.getComputedStyle)
		textAlign = document.defaultView.getComputedStyle(parent, '').getPropertyValue('text-align');
	item.style.textAlign = textAlign;
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

function c1c_init_tpbitem(id)
{
	var	item = c1c_getElementById(id);
	if (item)
	{
		c1c_setElementFont(item, null);
	}
}