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
  this._succeed = (options && options.succeed) ? options.succeed : false;
  this._drop = (options && options.drop) ? options.drop : false;
  this._callbackFunc = (options && options.callbackFunc) ? options.callbackFunc : null;
  this._popupBox = (options && options.popupBox) ? options.popupBox : null;

  this._createElements();
};

ModuleDialogInput.prototype._createElements = function() {
  var _self = this;
  
  this._gui = new DialogInput(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;
  
  console.log(this._gui);
  this._gui.input.value = this._operation.content;
  this._gui.input.onchange = function() { _self._operation.content = this.value; };
  
  this._gui.save.onclick = function() { var pos = DOMUtils.findPos(this);
                                        if (_self._drop) {
                                          _self._visitor.status = (_self._drop) ? -1 : 0;
                                          new RequestUtils()._custom('drop', {operation: _self._operation, visitor: _self._visitor}, function(result, params) { _self._callbackFunc(); }, { pos: pos });
                                        } else if (_self._succeed) {
                                          var visitor = { fromVisitor: true,
                                                          brideName: _self._visitor.brideName,
                                                          brideAddress: _self._visitor.brideAddress,
                                                          bridePhone: _self._visitor.bridePhone,
                                                          brideMobile: _self._visitor.brideMobile,
                                                          brideEmail: _self._visitor.brideEmail,
                                                          groomName: _self._visitor.groomName,
                                                          groomAddress: _self._visitor.groomAddress,
                                                          groomPhone: _self._visitor.groomPhone,
                                                          groomMobile: _self._visitor.groomMobile,
                                                          groomEmail: _self._visitor.groomEmail,
                                                          culture: _self._visitor.culturalBackground,
                                                          ceremony: _self._visitor.ceremonyLocation,
                                                          reception: _self._visitor.receptionLocation,
                                                          source: _self._visitor.source,
                                                          weddingDay: _self._visitor.weddingDay
                                                        }
                                          var func = function() { window.open('http://dlmanage.co.nz/test/dms1/?p=pageasst&t=pagecustomer&m=' + MiscUtils.encode({ a: 2, b: 2 }) + '&opts=' + MiscUtils.encode({visitor: visitor}))
                                                                }
                                          _self._visitor.status = (_self._succeed) ? 1 : 0;
                                          new RequestUtils()._custom('succeed', {operation: _self._operation, visitor: _self._visitor}, function(result, params) { _self._callbackFunc(); func(); }, { pos: pos });
                                        } else {
                                          new RequestUtils()._write('operation', [_self._operation], [], function() { _self._callbackFunc(); }, { pos: pos });
                                        }
                                        _self._popupBox._close();
                                      };
  this._gui.cancel.onclick = function() {_self._popupBox._close();};
};