function ModuleDialogInput(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._operation = (options && options.item) ? options.item : null;
  this._visitor = (options && options.visitor) ? options.visitor : null;
  this._failed = (options && options.failed) ? options.failed : false;
  this._deleted = (options && options.deleted) ? options.deleted : false;
  this._callbackFunc = (options && options.callbackFunc) ? options.callbackFunc : null;
  this._popupBox = (options && options.popupBox) ? options.popupBox : null;
  this._pos = (options && options.pos) ? options.pos : null;
  this._createElements();
};

ModuleDialogInput.prototype._createElements = function() {
  var _self = this;
  
  this._gui = new DialogInput(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;
  
  this._gui.input.value = (this._operation && this._operation) ? this._operation.content : '';
  this._gui.input.onchange = function() { if (_self._failed || _self._deleted) {
                                            _self._visitor.cancelledMessage = this.value;
                                          } else {
                                            _self._operation.content = this.value;
                                          }
                                        };
  this._visitor.cancelledOperator = this._operator.account;
  this._visitor.cancelledDate = this._now;
  this._gui.save.onclick = function() { if (_self._failed) {
                                          _self._visitor.status = -1;
                                          new RequestUtils()._write('visitor', [_self._visitor], [], function() { _self._callbackFunc(); }, { pos: _self._pos });
                                        } else if (_self._deleted) {
                                          _self._visitor.status = -2;
                                          new RequestUtils()._write('visitor', [_self._visitor], [], function() { _self._callbackFunc(); }, { pos: _self._pos });
                                        } else {
                                          new RequestUtils()._write('operation', [_self._operation], [], function() { _self._callbackFunc(); }, { pos: _self._pos });
                                        }
                                        _self._popupBox._close();
                                      };
  this._gui.cancel.onclick = function() { _self._popupBox._close(); };
};