function PopupBoxSimple(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
//  this._width = (width) ? width : '100';
//  this._height = (height) ? height : '100';
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  
  this._createElements();
  this._gui = AbstractPopupBoxSimple.gui(this._unique, this._doc);
}

PopupBoxSimple.prototype._createElements = function() {
  var table, tr, td;
  table = this._doc.createElement('table');
  table.cellPadding = 0;
  table.cellSpacing = 0;
  this._container.appendChild(table);
 
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.align = 'center';
  td.style.padding = '10px';
  td.id = this._unique + '_panel_div';
};