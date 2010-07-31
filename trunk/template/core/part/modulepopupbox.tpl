function ModulePopupBox(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._position = (options && options.pos) ? options.pos : [0, 0];
  this._title = (options && options.title) ? options.title : '';
  
  this._background = null;
  this._createElements();

}

ModulePopupBox.prototype._createElements = function() {
  var _self = this;

  this._background = this._doc.createElement('div');
  this._background.className = 'popupWhite';
  this._background.style.width = this._container.offsetWidth + 'px';
  this._background.style.height = this._container.offsetHeight + 'px';
  this._container.appendChild(this._background);
  
  this._container2 = this._doc.createElement('div');
  this._container2.className = 'popupBase';
  this._container2.style.top = ((this._position[1] - 60) > 0) ? (this._position[1] - 60) + 'px' : '0px';
  this._container2.style.left = ((this._position[0] + 200) > window.screen.width) ? (window.screen.width - 200) + 'px' : this._position[0] + 'px';
  this._background.appendChild(this._container2);
  
  this._gui = new PopupBox(this._doc, this._container2, this._width, this._height, this._operator, this._now, this._options)._gui;

  this._gui.title.appendChild(this._doc.createTextNode(this._title));
  this._gui.close.onclick = function() { _self._close(); };

  this._moveX = 0;
  this._moveY = 0;
  this._moveTop = 0;
  this._moveLeft = 0;
  this._moveable = false;
  this._docMouseMoveEvent = this._doc.onmousemove;
  this._docMouseUpEvent = this._doc.onmouseup;
  this._iWidth = this._container.clientWidth;
  this._iHeight = this._container.clientHeight;
  
  this._gui.menu.onmousedown = function() { var evt = _self._getEvent();
                                            _self._moveable = true;
                                            _self._moveX = evt.clientX;
                                            _self._moveY = evt.clientY;
                                            _self._moveTop = parseInt(_self._container2.style.top);
                                            _self._moveLeft = parseInt(_self._container2.style.left);
                                          };
  this._gui.menu.onmousemove = function() { if (_self._moveable) {
                                              this.className = 'popupMove';
                                              var evt = _self._getEvent();
                                              var x = _self._moveLeft + evt.clientX - _self._moveX;
                                              var y = _self._moveTop + evt.clientY - _self._moveY;
                                              if ( x > 0 && ( x + _self._width < _self._iWidth) && y > 0 && (y + _self._height < _self._iHeight) ) {
                                                _self._container2.style.left = x + "px";
                                                _self._container2.style.top = y + "px";
                                              }
                                            }
                                          };
  this._gui.menu.onmouseup = function () { if (_self._moveable) {
                                             _self._doc.onmousemove = _self._docMouseMoveEvent;
                                             _self._doc.onmouseup = _self._docMouseUpEvent;
                                             _self._moveable = false;
                                             _self._moveX = 0;
                                             _self._moveY = 0;
                                             _self._moveTop = 0;
                                             _self._moveLeft = 0;
                                             this.className = 'popupUp';
                                           }
                                         };
};

ModulePopupBox.prototype._getEvent = function() {
  if(window.parent == window) {
    return window.event || arguments.callee.caller.arguments[0];
  } else {
    return window.parent.event || arguments.callee.caller.arguments[0];
  }
};

ModulePopupBox.prototype._close = function() {
  if (this._background) {
    this._container.removeChild(this._background);
    this._background = null;
    this._container = null;
  }
};