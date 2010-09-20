function DialogResult(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
  this._width = width;
  this._height = height;
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  
  this._createElements();
  this._gui = AbstractDialogInput.gui(this._unique, this._doc);
};

DialogResult.prototype._createElements = function() {
  var gui, input, table, tr, td, _self = this;
  
  table = document.createElement('table');
  table.style.width = this._width + 'px';
  table.style.height = this._height + 'px';
  table.cellPadding = 0;
  table.cellSpacing = 0;
  table.id= this._unique + '_mains_table';
  this._container.appendChild(table);
};