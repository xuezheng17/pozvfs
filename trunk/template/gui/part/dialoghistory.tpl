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
  table.style.height = '100px';
  table.cellPadding = 0;
  table.cellSpacing = 0;
  table.id = this._unique + '_mains_table';
  this._container.appendChild(table);
  
};