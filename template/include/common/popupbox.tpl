function PopupBox3() {
  this._background = null;
  this._container = null;
}

PopupBox3.prototype._reset = function(pos) {
  this._close();
  
  this._background = document.createElement('div');
  this._background.className = 'popupSimpleWhite';
  this._background.style.width = document.body.offsetWidth + 'px';
  this._background.style.height = document.body.offsetHeight + 'px';
  document.body.appendChild(this._background);
  
  this._container = document.createElement('div');
  this._container.className = 'popupSimpleBase';
  this._container.style.top = ((this._position[1] - 60) > 0) ? (this._position[1] - 60) + 'px' : '0px';
  this._container.style.left = ((this._position[0] + 200) > window.screen.width) ? (window.screen.width - 200) + 'px' : this._position[0] + 'px';
  this._background.appendChild(this._container);
  
  var posX = this._position[0];
  var posY = ((this._position[1] - 100) > 0) ? (this._position[1] - 100) : 0;
  window.scrollTo(posX, posY);
};

PopupBox3.prototype._open = function(container, options) {
  var table, tr, td, _self = this;

  this._position = (options && options.pos) ? options.pos : [((document.body.offsetWidth / 2) - 50), ((document.body.offsetHeight / 2) - 50)];
  
  this._reset();

  table = document.createElement('table');
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.appendChild(container);
  this._container.appendChild(table);
};

PopupBox3.prototype._close = function() {
  if (this._background) {
    document.body.removeChild(this._background);
    this._background = null;
    this._container = null;
  }
};


