function ModuleDialogIObject(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;

  this._php = (options && options.php) ? options.php : null;
  this._name = (options && options.name) ? options.name : null;
  this._title = (options && options.title) ? options.title : null;
  this._item = (options && options.item) ? options.item : null;
  
  this._createElements();
};

ModuleDialogIObject.prototype._createElements = function() {
  this._gui = new DialogIObject(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;
  this._loadData();
};

ModuleDialogIObject.prototype._loadData = function() {
  this._objects = null;
  this._retrieveUsers();
};

ModuleDialogIObject.prototype._verifyData = function() {
  if (this._objects) {
    this._updateElements();
  }
};

ModuleDialogIObject.prototype._retrieveUsers = function() {
  var _self = this;
  new RequestUtils()._read(this._name, null, null, null, null, null, null, function(result, params) { _self._objects = result.data;
                                                                                                      _self._verifyData.call(_self);
                                                                                                    }, { php: this._php });
};

ModuleDialogIObject.prototype._updateElements = function() {
  var table, tr, td, radio, input, _self = this;

  POZVFSUtils.clear(this._gui);
  
  if (this._title) {
    this._gui.title.appendChild(document.createTextNode(this._title));
  }
  
  input = DOMUtils.createInput(null, null, 'text', null, null);
  input.onchange = function() { _self._item.name = this.value; };
  this._gui.object.appendChild(input);
  
  table = document.createElement('table');
  this._gui.objects.appendChild(table);
  for (var i = 0, il = this._objects.length; i < il; i++) {
    var obj = this._objects[i];
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    td.appendChild(document.createTextNode(obj.name));
  }
};
