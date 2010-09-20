function ModulePopupBoxSimple(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._position = (options && options.pos) ? options.pos : [0, 0];
  this._where = (options && options.where) ? options.where : null;
  
  this._background = null;
  this._createElements();
}

ModulePopupBoxSimple.prototype._createElements = function() {
  var _self = this;

  this._background = this._doc.createElement('div');
  this._background.className = 'popupSimpleWhite';
  this._background.style.width = this._container.offsetWidth + 'px';
  this._background.style.height = this._container.offsetHeight + 'px';
  this._container.appendChild(this._background);
  
  this._container2 = this._doc.createElement('div');
  this._container2.className = (this._where) ? 'popupSimpleBase1' : 'popupSimpleBase';
  this._container2.style.top = ((this._position[1] - 60) > 0) ? (this._position[1] - 60) + 'px' : '0px';
  this._container2.style.left = ((this._position[0] + 200) > window.screen.width) ? (window.screen.width - 200) + 'px' : this._position[0] + 'px';
  this._background.appendChild(this._container2);
  
  this._gui = new PopupBoxSimple(this._doc, this._container2, this._width, this._height, this._operator, this._now, this._options)._gui;
  
  if (this._where) {
    this._background.onclick = function() { _self._close(); };
  }
};


ModulePopupBoxSimple.prototype._close = function() {
  if (this._background) {
    this._container.removeChild(this._background);
    this._background = null;
    this._container = null;
  }
};