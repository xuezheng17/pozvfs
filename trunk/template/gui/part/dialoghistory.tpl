function DialogHistory(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  this._createElements();
  this._gui = AbstractDialogHistory.gui(this._unique, this._doc);
};

DialogHistory.prototype._createElements = function() {
  var gui, input, table, tr, td, _self = this;
  
  DOMUtils.removeChildElements(this._container);
  
  table = document.createElement('table');
  table.style.width = '500px';
  table.style.height = '24px';
  table.cellPadding = 0;
  table.cellSpacing = 0;
  this._container.appendChild(table);
  
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.height = '24px';
  td.style.textAlign = 'center';
  td.style.verticalAlign = 'middle';
  td.id = this._unique + '_title_div';
  
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  var itable = document.createElement('table');
  itable.style.width = '500px';
  itable.cellPadding = 0;
  itable.cellSpacing = 0;
  itable.id = this._unique + '_mains_table';
  td.appendChild(itable);
  
};