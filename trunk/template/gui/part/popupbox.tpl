function PopupBox(doc, container, width, height, operator, now, options) {
this._doc = doc;
this._container = container;
this._operator = operator;
this._width = (width) ? width : '874';
this._height = (height) ? height : '814';
this._now = now;
this._options = options;
this._unique = MiscUtils.unique();

this._createElements();
this._gui = AbstractPopupBox.gui(this._unique, this._doc);
}

PopupBox.prototype._createElements = function() {
  var table, tr, td, input;
  table = this._doc.createElement('table');
  table.style.width = this._width + 'px';
  table.style.height = this._height + 'px';
  table.border=0
  table.style.margin='20px 0 0 0'
  table.cellPadding = 0;
  table.cellSpacing = 0; 
  this._container.appendChild(table);
  
  tr=table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.height = '2px';
  td.style.width = '2px';
  td.style.backgroundImage='url(image/popupbox/tl.png)';
  td.style.backgroundRepeat = 'no-repeat';
  td = tr.insertCell(-1);
  td.style.height = '2px';
  td.style.width = (this._width-8)+'px';
  td.style.backgroundImage='url(image/popupbox/tm.png)';
  td.style.backgroundRepeat = 'repeat-x';
  td = tr.insertCell(-1);
  td.style.height = '2px';
  td.style.width = '6px';
  td.style.backgroundImage='url(image/popupbox/tr.png)';
  td.style.backgroundRepeat = 'no-repeat';
  
  tr=table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.height = (this._height-8) + 'px';
  td.style.width = '2px';
  td.style.backgroundImage='url(image/popupbox/lm.png)';
  td.style.backgroundRepeat = 'repeat-y';
  td = tr.insertCell(-1);
  td.style.height = (this._height-8) + 'px';
  td.style.width = (this._width-8) + 'px';
  td.style.background = '#f0f0f0 url(image/popupbox/back.png) repeat-x 0 0';
    
  var itable = this._doc.createElement('table');
  itable.style.width = (this._width-8) + 'px';
  itable.style.height = (this._height-8) + 'px';
  itable.cellPadding = 0;
  itable.cellSpacing = 0; 
  itable.border = 0
  itable.style.margin='-1px 0 0 -1px';
  td.appendChild(itable);
  td = tr.insertCell(-1);
  td.style.height = (this._height-8) + 'px';
  td.style.width = '6px';
  td.style.backgroundImage='url(image/popupbox/rm.png)';
  td.style.backgroundRepeat = 'repeat-y';
  
  tr=table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.height = '6px';
  td.style.width = '2px';
  td.style.backgroundImage='url(image/popupbox/bl.png)';
  td.style.backgroundRepeat = 'no-repeat';
  td = tr.insertCell(-1);
  td.style.height = '6px';
  td.style.width = (this._width-8) + 'px';
  td.style.backgroundImage='url(image/popupbox/bm.png)';
  td.style.backgroundRepeat = 'repeat-x';
  td = tr.insertCell(-1);
  td.style.height = '6px';
  td.style.width = '6px';
  td.style.backgroundImage='url(image/popupbox/br.png)';
  td.style.backgroundRepeat = 'no-repeat';


  itr = itable.insertRow(-1);
  itd = itr.insertCell(-1);
  itd.style.height = '29px';
  itd.style.width = (this._width-6) + 'px';
 // itd.align = 'center';
  itd.id=this._unique + '_menu_div';
  var table1 = this._doc.createElement('table');
  table1.style.width = (this._width-6) + 'px';
  table1.style.height = '29px';
  table1.cellPadding = 0;
  table1.cellSpacing = 0;
//  table1.border=1
  table1.style.margin='0 -3px 0 -1px';
  itd.appendChild(table1);
  
  tr1 = table1.insertRow(-1);
  td1 = tr1.insertCell(-1);
  td1.style.height = '29px';
  td1.style.width = '170px';
  td1.style.padding='0 0 0 20px'
  td1.style.whiteSpace = 'nowrap'
  td1.align = 'left';
  td1.id = this._unique + '_title_img';
  td1.style.fontWeight = 'bold';
  td1.style.fontSize = '15px';
  td1.style.backgroundImage='url(image/popupbox/ttl.png)';
  td1.style.backgroundRepeat = 'no-repeat';
  
  td1 = tr1.insertCell(-1);
  td1.style.height = '29px';
  td1.style.width = (this._width - 240) + 'px';
  td1.style.backgroundImage='url(image/popupbox/ttm.png)';
  td1.style.backgroundRepeat = 'repeat-x';
  
  td1 = tr1.insertCell(-1);
  td1.style.height = '29px';
  td1.style.width = '45px';
  td1.align = 'left';
  td1.style.verticalAlign='top';
  td1.style.backgroundImage='url(image/popupbox/ttr.png)';
  td1.style.backgroundRepeat = 'no-repeat';
  var close = this._doc.createElement('img');
  close.style.cursor = 'pointer';
  close.src = 'image/popupbox/close.png';
  close.id = this._unique + '_close_button';
  td1.appendChild(close);
  
  
  itr=itable.insertRow(-1);
  itd = itr.insertCell(-1);
  itd.style.width = (this._width-8) + 'px';
  itd.style.height = (this._height-8-29) + 'px';
  itd.align = 'center';
  itd.id = this._unique + '_panel_div';
};