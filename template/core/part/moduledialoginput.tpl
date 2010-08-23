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
  this._failed = (options && options.failed) ? options.failed : false;
  this._deleted = (options && options.deleted) ? options.deleted : false;
  this._visited = (options && options.visited) ? options.visited : false;
  this._callbackFunc = (options && options.callbackFunc) ? options.callbackFunc : null;
  this._popupBox = (options && options.popupBox) ? options.popupBox : null;
  this._pos = (options && options.pos) ? options.pos : null;
  
  this._gui = new DialogInput(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;

  this._createElements();
};

ModuleDialogInput.prototype._createElements = function() {
  if (this._failed) {
    this._loadData();
  } else {
    this._updateElements();
  }
};

ModuleDialogInput.prototype._loadData = function() {
  this._opponents = null;
  this._categorys = null;
  this._retrieveOpponents();
  this._retrieveCategorys();
};

ModuleDialogInput.prototype._verifyData = function() {
  if (this._opponents && this._categorys) {
    this._updateElements();
  }
};

ModuleDialogInput.prototype._retrieveOpponents = function() {
  var _self = this;
  new RequestUtils()._read('pz_iopponent', null, null, null, null, 'd.name', null, function(result, params) { _self._opponents = result.data;
                                                                                                              _self._verifyData.call(_self);
                                                                                                            }, null);
};

ModuleDialogInput.prototype._retrieveCategorys = function() {
  var _self = this;
  new RequestUtils()._read('pz_icategory', null, null, null, null, 'd.name', null, function(result, params) { _self._categorys = result.data;
                                                                                                              _self._verifyData.call(_self);
                                                                                                            }, null);
};

ModuleDialogInput.prototype._updateElements = function() {
  var _self = this;
  DOMUtils.removeChildElements(this._gui.opponent);
  DOMUtils.removeChildElements(this._gui.category);
  if (this._failed) {
    this._gui.opponent.options[this._gui.opponent.options.length] = new Option('');
    for (var i = 0, il = this._opponents.length; i < il; i++) {
      var opponent = this._opponents[i];
      var option = new Option(opponent.name);
      this._gui.opponent.options[this._gui.opponent.options.length] = option;
      if (option.text == this._visitor.opponent) {
        this._gui.opponent.selectedIndex = this._gui.opponent.options.length - 1;
      }
    }
    if (this._opponents.length > 0) {
      this._visitor.opponent = this._gui.opponent.options[this._gui.opponent.selectedIndex].text;
      this._gui.opponent.onchange = function() { _self._visitor.opponent = this.options[this.selectedIndex].text; };
    }
    
    this._gui.add.onclick = function() { var object = pz_iopponent.instance(); 
                                         var func1 = function() { tmp._close();
                                                                  _self._visitor.opponent = object.name;
                                                                  new RequestUtils()._write('pz_iopponent', [object], [], function() { _self._retrieveOpponents.call(_self); }, { pos: DOMUtils.findPos(_self._gui.add) });
                                                                };
                                         var func2 = function() { tmp._close(); };
                                         var pos = DOMUtils.findPos(this);
                                         var tmp = new ModulePopupBoxSimple(document, document.body, null, null, _self._operator, _self._now, { pos: pos});
                                         new ModuleDialogIObject(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, { name: 'pz_iopponent', title: 'Opponents', item: object });
                                         MiscUtils.dialog(tmp, null, func1, func2, { ok: 'Add'});
                                       };
  
    this._gui.category.options[this._gui.category.options.length] = new Option('');
    for (var i = 0, il = this._categorys.length; i < il; i++) {
      var category = this._categorys[i];
      var option = new Option(category.name);
      this._gui.category.options[this._gui.category.options.length] = option;
      if (option.text == this._visitor.category) {
        this._gui.category.selectedIndex = this._gui.category.options.length - 1;
      }
    }
    if (this._categorys.length > 0) {
      this._visitor.category = this._gui.category.options[this._gui.category.selectedIndex].text;
      this._gui.category.onchange = function() { _self._visitor.category = this.options[this.selectedIndex].text; };
    }
  
    this._gui.addcategory.onclick = function() { var object = pz_icategory.instance(); 
                                                 var func1 = function() { tmp._close();
                                                                          _self._visitor.category = object.name;
                                                                          new RequestUtils()._write('pz_icategory', [object], [], function() { _self._retrieveCategorys.call(_self); }, { pos: DOMUtils.findPos(_self._gui.add) });
                                                                        };
                                                 var func2 = function() { tmp._close(); };
                                                 var pos = DOMUtils.findPos(this);
                                                 var tmp = new ModulePopupBoxSimple(document, document.body, null, null, _self._operator, _self._now, { pos: pos});
                                                 new ModuleDialogIObject(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, { name: 'pz_icategory', title: 'Categorys', item: object });
                                                 MiscUtils.dialog(tmp, null, func1, func2, { ok: 'Add'});
                                               };
  }
  
  this._gui.input.value = (this._operation && this._operation) ? this._operation.content : '';
  this._gui.input.onchange = function() { if (_self._failed || _self._deleted) {
                                            _self._visitor.operatorMessage = this.value;
                                          } else {
                                            _self._operation.content = this.value;
                                          }
                                        };
  this._gui.save.onclick = function() { if (_self._failed) {
                                          _self._visitor.status = -1;
                                          _self._visitor.operator = _self._operator.account;
                                          _self._visitor.operatorDate = _self._now;
                                          new RequestUtils()._write('pz_visitor', [_self._visitor], [], function() { _self._callbackFunc(); }, { pos: _self._pos });
                                        } else if (_self._deleted) {
                                          _self._visitor.status = -2;
                                          _self._visitor.operator = _self._operator.account;
                                          _self._visitor.operatorDate = _self._now;
                                          new RequestUtils()._write('pz_visitor', [_self._visitor], [], function() { _self._callbackFunc(); }, { pos: _self._pos });
                                        } else {
                                          if (_self._succeed) {
                                            _self._visitor.isVisited = true;
                                            _self._visitor.status = 1;
                                            _self._visitor.operator = _self._operator.account;
                                            _self._visitor.operatorDate = _self._now;
                                            new RequestUtils()._custom('succeeded', {operation: _self._operation, visitor: _self._visitor}, function(result, params) { _self._callbackFunc(); }, { pos: _self._pos });
                                          }
                                          if (_self._visited) {
                                            if (!_self._visitor.isVisited) {
                                              _self._visitor.isVisited = true;
                                              new RequestUtils()._custom('succeeded', {operation: _self._operation, visitor: _self._visitor}, function(result, params) { _self._callbackFunc(); }, { pos: _self._pos });
                                            } else {
                                              new RequestUtils()._write('pz_operation', [_self._operation], [], function() { _self._callbackFunc(); }, { pos: _self._pos });
                                            }
                                          } else  {
                                            new RequestUtils()._write('pz_operation', [_self._operation], [], function() { _self._callbackFunc(); }, { pos: _self._pos });
                                          }
                                        } 
                                        _self._popupBox._close();
                                      };
  this._gui.cancel.onclick = function() { _self._popupBox._close(); };
};