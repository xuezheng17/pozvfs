function ModuleDialogInput(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._title = (options && options.title) ? options.title : '';
  this._item = (options && options.item) ? options.item : '';
  this._default = (options && options.content) ? options.content : '';
  
  this._createElements();
};

ModuleDialogInput.prototype._createElements = function() {
  var _self = this;
  
  this._gui = new DialogInput(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;
  
  this._gui.title.appendChild(this._doc.createTextNode(this._title));
  this._gui.input.value = this._default;
  this._gui.input.onchange = function() { _self._item.content = this.value; };
};