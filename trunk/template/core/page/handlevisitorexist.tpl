function HandleVisitorExist(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._visitorId = (options && options.id) ? options.id : null;
  this._menu = (options && options.menu) ? options.menu : '';
  this._cont = (options && options.cont) ? options.cont : '';
  
  this._gui.email.style.display = 'none';
  this._gui.call.style.display = 'none';
  this._gui.visit.style.display = 'none';
  this._gui.succeed.style.display = 'none';
  this._gui.drop.style.display = 'none';
  
  this._createElements();
};

HandleVisitorExist.prototype._createElements = function() {
  
  var pos = [window.screen.width / 2, window.screen.height / 5];
  this._popupBox = new ModulePopupBoxSimple(document, document.body, null, null, null, null, { pos: pos});
  MiscUtils.load(this._popupBox, 'Loading data...');
  
  this._loadData();
};

HandleVisitorExist.prototype._loadData = function() {
  this._visitor = null;
  this._sources = null;
  this._receptions = null;
  this._cultures = null;
  this._ceremonys = null;
  this._operations = null;

  this._retrieveVisitor();
  this._retrieveSources();
  this._retrieveReceptions();
  this._retrieveCultures();
  this._retrieveCeremonys();
  this._retrieveOperations();
};

HandleVisitorExist.prototype._verifyData = function() {
  if (this._visitor && this._sources && this._receptions && this._cultures && this._ceremonys && this._operations) {
    this._updateElements();
  }
};

HandleVisitorExist.prototype._retrieveSources = function() {
  var _self = this;
  new RequestUtils()._read('isource', null, null, null, null, null, null, function(result, params) { _self._sources = result.data;
                                                                                                     _self._verifyData.call(_self);
                                                                                                   }, null);
};

HandleVisitorExist.prototype._retrieveReceptions = function() {
  var _self = this;
  new RequestUtils()._read('ireception', null, null, null, null, null, null, function(result, params) { _self._receptions = result.data;
                                                                                                        _self._verifyData.call(_self);
                                                                                                      }, null);
};

HandleVisitorExist.prototype._retrieveCultures = function() {
  var _self = this;
  new RequestUtils()._read('iculture', null, null, null, null, null, null, function(result, params) { _self._cultures = result.data;
                                                                                                      _self._verifyData.call(_self);
                                                                                                    }, null);
};

HandleVisitorExist.prototype._retrieveCeremonys = function() {
  var _self = this;
  new RequestUtils()._read('iceremony', null, null, null, null, null, null, function(result, params) { _self._ceremonys = result.data;
                                                                                                       _self._verifyData.call(_self);
                                                                                                     }, null);
};

HandleVisitorExist.prototype._retrieveOperations = function() {
  var _self = this;
  new RequestUtils()._read('operation', null, 'd.visitId = \'' + this._visitorId + '\'', null, null, null, null, function(result, params) { _self._operations = result.data;
                                                                                                                                           _self._verifyData.call(_self);
                                                                                                                                         }, null);
};

HandleVisitorExist.prototype._retrieveVisitor = function() {
  var _self = this;
  if (this._visitorId) {
    new RequestUtils()._read('visitor', null, 'd.oid = \'' + this._visitorId + '\'', null, null, null, null, function(result, params) { _self._visitor = (result.data.length == 1) ? result.data[0] : null;
                                                                                                                                        if (!_self._visitor) {
                                                                                                                                          window.alert('NO VISITOR ' + _self._visitorId);
                                                                                                                                          history.back();
                                                                                                                                          return;
                                                                                                                                        }
                                                                                                                                        _self._verifyData.call(_self);
                                                                                                                                      }, null);
  } else {
    this._visitor = Visitor.instance();
    this._visitor.weddingDay = '';
    this._visitor.firstVisitDate = '';
    this._visitor.creator = this._operator.account;
    this._verifyData();
  }
};

HandleVisitorExist.prototype._updateElements = function() {
  var _self = this, table, tr, td;
  this._popupBox._close();
  DOMUtils.removeChildElements(this._gui.title);
  DOMUtils.removeChildElements(this._gui.source);
  DOMUtils.removeChildElements(this._gui.ceremonyLocation);
  DOMUtils.removeChildElements(this._gui.receptionLocation);
  DOMUtils.removeChildElements(this._gui.culturalBackground);
  DOMUtils.removeTableRows(this._gui.operations, 1);
  DOMUtils.removeChildElements(this._gui.page);
  
  this._gui.email.style.display = 'block';
  this._gui.call.style.display = 'block';
  this._gui.visit.style.display = 'block';
  this._gui.succeed.style.display = 'block';
  this._gui.drop.style.display = 'block';
  console.log(this._menu, this._cont);
  this._gui.title.appendChild(document.createTextNode('No. ' + POZVFSUtils.visitorId(this._visitor.id) + ' ' + this._visitor.firstVisitMethod));
  this._gui.next.onclick = function() { location.href = '?t=visitorexist&m=' + MiscUtils.encode({ a: (_self._menu) ? _self._menu : 2, b: (_self._cont) ? _self._cont : 1 }) + '&opts=' + MiscUtils.encode({id: parseInt(_self._visitor.id, 10) + 1, menu: _self._menu, cont: _self._cont});
                                      };
  this._gui.back.onclick = function() { if (_self._visitor.id - 1 != 0) {
                                          location.href = '?t=visitorexist&m=' + MiscUtils.encode({ a: (_self._menu) ? _self._menu : 2, b: (_self._cont) ? _self._cont : 1 }) + '&opts=' + MiscUtils.encode({id: _self._visitor.id - 1, menu: _self._menu, cont: _self._cont});
                                        } else {
                                          window.alert('NO VISITOR 0');
                                        }
                                      };
  this._gui.number.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                              if (code == 13) {
                                                if(POZVFSUtils.isNum(this.value)) {
                                                  location.href = '?t=visitorexist&m=' + MiscUtils.encode({ a: (_self._menu) ? _self._menu : 2, b: (_self._cont) ? _self._cont : 1 }) + '&opts=' + MiscUtils.encode({id: this.value, menu: _self._menu, cont: _self._cont});
                                                } else {
                                                  window.alert('Input A Number Greater Than 0');
                                                }
                                              }
                                            };
  this._gui.jump.onclick = function() { if(POZVFSUtils.isNum(_self._gui.number.value)) {
                                          location.href = '?t=visitorexist&m=' + MiscUtils.encode({ a: (_self._menu) ? _self._menu : 2, b: (_self._cont) ? _self._cont : 1 }) + '&opts=' + MiscUtils.encode({id: _self._gui.number.value, menu: _self._menu, cont: _self._cont});
                                        } else {
                                          window.alert('Input A Number Greater Than 0');
                                        }
                                      };
  
  /* 结婚日期 */
  this._gui.weddingDay.value = (this._visitor.weddingDay) ? SimpleDate.format(this._visitor.weddingDay) : '';
  this._gui.weddingDay.onclick = function() { var context = this;
                                              _self._changeDate.call(_self, this, _self._visitor.weddingDay, function(sd) { _self._visitor.weddingDay = sd; }, false);
                                            };
  /* 第一次visitor日期 */
  this._gui.firstVisitingDate.value = (this._visitor.firstVisitDate) ? SimpleDate.format(this._visitor.firstVisitDate) : '';
  this._gui.firstVisitingDate.onclick = function() { var context = this;
                                                     _self._changeDate.call(_self, this, _self._visitor.firstVisitDate, function(sd) { _self._visitor.firstVisitDate = sd; }, false);
                                                   };
  /* 显示Visitor的联系方式 */
  this._gui.brideName.value = this._visitor.brideName;
  this._gui.brideAddress.value = this._visitor.brideAddress;
  this._gui.bridePhone.value = this._visitor.bridePhone;
  this._gui.brideMobile.value = this._visitor.brideMobile;
  this._gui.brideEmail.value = this._visitor.brideEmail;
  this._gui.groomName.value = this._visitor.groomName;
  this._gui.groomAddress.value = this._visitor.groomAddress;
  this._gui.groomPhone.value = this._visitor.groomPhone;
  this._gui.groomMobile.value = this._visitor.groomMobile;
  this._gui.groomEmail.value = this._visitor.groomEmail;
  
  /* 设置Visitor的联系方式Event */
  this._gui.brideName.onchange = function() { _self._visitor.brideName = this.value; };
  this._gui.brideAddress.onchange = function() { _self._visitor.brideAddress = this.value; };
  this._gui.bridePhone.onchange = function() { _self._visitor.bridePhone = this.value; };
  this._gui.brideMobile.onchange = function() { _self._visitor.brideMobile = this.value; };
  this._gui.brideEmail.onchange = function() { _self._visitor.brideEmail = this.value; };
  this._gui.groomName.onchange = function() { _self._visitor.groomName = this.value; };
  this._gui.groomAddress.onchange = function() { _self._visitor.groomAddress = this.value; };
  this._gui.groomPhone.onchange = function() { _self._visitor.groomPhone = this.value; };
  this._gui.groomMobile.onchange = function() { _self._visitor.groomMobile = this.value; };
  this._gui.groomEmail.onchange = function() { _self._visitor.groomEmail = this.value; };
  
  /* visitor method */
  this._gui.firstVisitingMethod.options[this._gui.firstVisitingMethod.options.length] = new Option('');
  for (var i = 0, il = VisitorMethod.array().length; i < il; i++) {
    var method = VisitorMethod.array()[i];
    var option = new Option(method);
    this._gui.firstVisitingMethod.options[this._gui.firstVisitingMethod.options.length] = option;
    if (option.text == this._visitor.firstVisitMethod) {
      this._gui.firstVisitingMethod.selectedIndex = this._gui.firstVisitingMethod.options.length - 1;
    }
  }
  
  this._visitor.firstVisitMethod = this._gui.firstVisitingMethod.options[this._gui.firstVisitingMethod.selectedIndex].text;
  this._gui.firstVisitingMethod.onchange = function() { _self._visitor.firstVisitMethod = this.options[this.selectedIndex].text; };
  
  /* 显示Source等信息 */
  this._gui.source.options[this._gui.source.options.length] = new Option('');
  for (var i = 0, il = this._sources.length; i < il; i++) {
    var source = this._sources[i];
    var option = new Option(source.name);
    this._gui.source.options[this._gui.source.options.length] = option;
    if (option.text == this._visitor.source) {
      this._gui.source.selectedIndex = this._gui.source.options.length - 1;
    }
  }
  this._gui.receptionLocation.options[this._gui.receptionLocation.options.length] = new Option('');
  for (var i = 0, il = this._receptions.length; i < il; i++) {
    var reception = this._receptions[i];
    var option = new Option(reception.name);
    this._gui.receptionLocation.options[this._gui.receptionLocation.options.length] = option;
    if (option.text == this._visitor.receptionLocation){
      this._gui.receptionLocation.selectedIndex = this._gui.receptionLocation.options.length - 1;
    }
  }
  this._gui.culturalBackground.options[this._gui.culturalBackground.options.length] = new Option('');
  for (var i = 0, il = this._cultures.length; i < il; i++) {
    var culture = this._cultures[i];
    var option = new Option(culture.name);
    this._gui.culturalBackground.options[this._gui.culturalBackground.options.length] = option;
    if (option.text == this._visitor.culturalBackground){
      this._gui.culturalBackground.selectedIndex = this._gui.culturalBackground.options.length - 1;
    }
  }
  this._gui.ceremonyLocation.options[this._gui.ceremonyLocation.options.length] = new Option('');
  for (var i = 0, il = this._ceremonys.length; i < il; i++) {
    var ceremony = this._ceremonys[i];
    var option = new Option(ceremony.name);
    this._gui.ceremonyLocation.options[this._gui.ceremonyLocation.options.length] = option;
    if (option.text == this._visitor.ceremonyLocation){
      this._gui.ceremonyLocation.selectedIndex = this._gui.ceremonyLocation.options.length - 1;
    }
  }
  
  /* 设置Source等信息Event */
  if (this._sources.length > 0) {
    this._visitor.source = this._gui.source.options[this._gui.source.selectedIndex].text;
    this._gui.source.onchange = function() { _self._visitor.source = this.options[this.selectedIndex].text; };
  }
  if (this._receptions.length > 0) {
    this._visitor.receptionLocation = this._gui.receptionLocation.options[this._gui.receptionLocation.selectedIndex].text;
    this._gui.receptionLocation.onchange = function() { _self._visitor.receptionLocation = this.options[this.selectedIndex].text; };
  }
  if (this._cultures.length > 0) {
    this._visitor.culturalBackground = this._gui.culturalBackground.options[this._gui.culturalBackground.selectedIndex].text;
    this._gui.culturalBackground.onchange = function() { _self._visitor.culturalBackground = this.options[this.selectedIndex].text; };
  }
  if (this._ceremonys.length > 0) {
    this._visitor.ceremonyLocation = this._gui.ceremonyLocation.options[this._gui.ceremonyLocation.selectedIndex].text;
    this._gui.ceremonyLocation.onchange = function() { _self._visitor.ceremonyLocation = this.options[this.selectedIndex].text; };
  }

  /* 添加Source等信息 */
  this._gui.sourceAdd.onclick = function() { var object = ISource.instance(); 
                                             var func1 = function() { tmp._close();
                                                                      _self._visitor.source = object.name;
                                                                      new RequestUtils()._write('isource', [object], [], function() { _self._retrieveSources.call(_self); }, { pos: DOMUtils.findPos(_self._gui.sourceAdd) });
                                                                    };
                                             var func2 = function() { tmp._close();
                                                                    };
                                             var pos = DOMUtils.findPos(this);
                                             var tmp = new ModulePopupBoxSimple(document, document.body, null, null, _self._operator, _self._now, { pos: pos});
                                             new ModuleDialogIObject(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, { name: 'isource', title: 'Sources', item: object });
                                             MiscUtils.dialog(tmp, null, func1, func2, { ok: 'Add'});
                                           };
  this._gui.receptionLocationAdd.onclick = function() { var object = IReception.instance();
                                                        var func1 = function() { tmp._close();
                                                                                 _self._visitor.receptionLocation = object.name;
                                                                                 new RequestUtils()._write('ireception', [object], [], function() { _self._retrieveReceptions.call(_self); }, { pos: DOMUtils.findPos(_self._gui.receptionLocationAdd) });
                                                                               };
                                                        var func2 = function() { tmp._close();
                                                                               };
                                                        var pos = DOMUtils.findPos(this);
                                                        var tmp = new ModulePopupBoxSimple(document, document.body, null, null, _self._operator, _self._now, { pos: pos});
                                                        new ModuleDialogIObject(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, { name: 'ireception', title: 'Reception Location', item: object });
                                                        MiscUtils.dialog(tmp, null, func1, func2, { ok: 'Add'});
                                                      };
  this._gui.culturalBackgroundAdd.onclick = function() { var object = ICulture.instance();
                                                         var func1 = function() { tmp._close();
                                                                                  _self._visitor.culturalBackground = object.name;
                                                                                  new RequestUtils()._write('iculture', [object], [], function() { _self._retrieveCultures.call(_self); }, { pos: DOMUtils.findPos(_self._gui.culturalBackgroundAdd) });
                                                                                };
                                                         var func2 = function() { tmp._close();
                                                                                };
                                                         var pos = DOMUtils.findPos(this);
                                                         var tmp = new ModulePopupBoxSimple(document, document.body, null, null, _self._operator, _self._now, { pos: pos});
                                                         new ModuleDialogIObject(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, { name: 'iculture', title: 'Cultural Background', item: object });
                                                         MiscUtils.dialog(tmp, null, func1, func2, { ok: 'Add'});
                                                       };
  this._gui.ceremonyLocationAdd.onclick = function() { var object = ICeremony.instance();
                                                       var func1 = function() { tmp._close();
                                                                                _self._visitor.ceremonyLocation = object.name;
                                                                                new RequestUtils()._write('iceremony', [object], [], function() { _self._retrieveCeremonys.call(_self); }, { pos: DOMUtils.findPos(_self._gui.ceremonyLocationAdd) });
                                                                              };
                                                       var func2 = function() { tmp._close();
                                                                              };
                                                       var pos = DOMUtils.findPos(this);
                                                       var tmp = new ModulePopupBoxSimple(document, document.body, null, null, _self._operator, _self._now, { pos: pos});
                                                       new ModuleDialogIObject(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, { name: 'iceremony', title: 'Ceremony Location', item: object });
                                                       MiscUtils.dialog(tmp, null, func1, func2, { ok: 'Add'});
                                                     };
  /* Save */
  if (this._visitorId) {
    this._gui.update.onclick = function() { if (_self._visitor.firstVisitMethod != '') {
                                              if (!_self._visitor.weddingDay) {
                                                var r = window.confirm('NO WEDDING DAY, CONTINUE?');
                                                if (r) {
                                                  var pos = DOMUtils.findPos(this);
                                                  new RequestUtils()._write('visitor', [_self._visitor], [], function(result, params) { if (result) { _self._createElements(); }; }, { pos: pos });
                                                }
                                              } else {
                                                var pos = DOMUtils.findPos(this);
                                                new RequestUtils()._write('visitor', [_self._visitor], [], function(result, params) { if (result) { _self._createElements(); }; }, { pos: pos });
                                              }
                                            } else {
                                              window.alert('CAN NOT BE EMPTY (First Contact Method)');
                                            }
                                          };
  }
  
  /*- Operation -*/
  if (this._operations.length == 0) {
    tr = this._gui.operations.insertRow(-1);
    td = tr.insertCell(-1);
    td.colSpan = 5;
    td.style.height = '24px';
    td.style.textAlign = 'center';
    td.appendChild(document.createTextNode('None'));
  }
  
  var pNumber = 0, eNumber = 0, vNumber = 0;
  for (var i = 0, il = this._operations.length; i < il; i++) {
    var operation = this._operations[i];
    var type = (operation.operateType.substring(0, operation.operateType.indexOf('('))).toLowerCase();

    if (type == 'call') {
      if (!operation.cancelled) {
        pNumber++;
      }
    } else if (type == 'email') {
      if (!operation.cancelled) {
        eNumber++;
      }
    } else if (type == 'visit') {
      if (!operation.cancelled) {
        vNumber++;
      }
    }
    
    tr = this._gui.operations.insertRow(-1);
    tr.style.backgroundColor = (i % 2 == 0) ? '#fff' : '#f8f8f8';
    td = tr.insertCell(-1);
    if (operation.cancelled) {
      td.style.textDecoration = 'line-through';
    }
    td.style.height = '24px';
    td.style.textAlign = 'center';
    td.style.verticalAlign = 'middle';
    td.appendChild(document.createTextNode(operation.operateType));
    
    td = tr.insertCell(-1);
    if (operation.cancelled) {
      td.style.textDecoration = 'line-through';
    }
    td.style.height = '24px';
    td.style.textAlign = 'left';
    td.style.verticalAlign = 'middle';
    td.style.padding = '0 0 0 20px';
    td.appendChild(document.createTextNode(operation.operator));
    
    td = tr.insertCell(-1);
    if (operation.cancelled) {
      td.style.textDecoration = 'line-through';
    }
    td.style.height = '24px';
    td.style.textAlign = 'left';
    td.style.verticalAlign = 'middle';
    td.style.padding = '0 0 0 20px';
    td.appendChild(document.createTextNode(SimpleDate.format(operation.operatedDate)));
    
    td = tr.insertCell(-1);
    if (operation.cancelled) {
      td.style.textDecoration = 'line-through';
    }
    td.style.height = '24px';
    td.style.textAlign = 'left';
    td.style.verticalAlign = 'bottom';
    td.style.padding = '0 0 0 20px';
    var span1 = document.createElement('span');
    td.appendChild(span1);
    span1.style.lineHeight = '24px';
    span1.appendChild(document.createTextNode('(' + ((operation.content) ? ((String(operation.content).length > 100) ? operation.content.substring(0, 100) + '......' : operation.content) : 'NONE' ) + ') '));
    if (!operation.cancelled) {
      var img = document.createElement('img');
      img.src = 'image/edit.png';
      img.style.cursor = 'pointer';
      img._operation = operation;
      img.onclick = function() { var pos, func1, func2;
                                 var operation = this._operation;
                                 func1 = function() {  _self._retrieveOperations(); };
                                 pos = [window.screen.width/3, window.screen.height/3];
                                 tmp = new ModulePopupBox(document, document.body, 500, 200, _self._operator, _self._now, { pos: pos, title: 'Note'});
                                 new ModuleDialogInput(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, {item: operation, callbackFunc: func1, popupBox: tmp});
                                 return false;
                               };
      td.appendChild(img);
    }
    
    td = tr.insertCell(-1);
    td.style.height = '24px';
    td.style.textAlign = 'center';
    td.style.verticalAlign = 'middle';
    if (!operation.cancelled) {
      var img = document.createElement('img');
      img.src = 'image/delete.png';
      img.style.cursor = 'pointer';
      img._operation = operation;
      img.onclick = function() { this._operation.cancelled = 1;
                                 var type = this._operation.operateType.substring(0, this._operation.operateType.indexOf('('));
                                 if (type == 'call') {
                                   _self._pNumber -= 1;
                                 } else if (type == 'email') {
                                   _self._eNumber -= 1;
                                 } else {
                                   _self._vNumber -= 1;
                                 }
                                 new RequestUtils()._write('operation', [this._operation], [], function() { _self._retrieveOperations(); }, null);
                               };
      td.appendChild(img);
    }
  }
  
  if (this._visitor.status == 1) {
    this._gui.email.disabled = true;
    this._gui.call.disabled = true;
    this._gui.visit.disabled = true;
    this._gui.drop.disabled = true;
    this._gui.succeed.disabled = true;
    this._gui.update.disabled = false;
  } else if (this._visitor.status == -1){
    this._gui.update.disabled = true;
    this._gui.email.disabled = true;
    this._gui.call.disabled = true;
    this._gui.visit.disabled = true;
    this._gui.succeed.disabled = true;
    this._gui.drop.disabled = true;
  } else {
    this._gui.update.disabled = false;
    this._gui.email.disabled = false;
    this._gui.call.disabled = false;
    this._gui.visit.disabled = false;
    this._gui.succeed.disabled = false;
    this._gui.drop.disabled = false;
    this._gui.succeed.value = 'Succeed';
    this._gui.drop.value = 'Drop';
  }
  this._gui.email.value = 'Email(' + (eNumber+1) + ')';
  this._gui.call.value = 'Call(' + (pNumber+1) + ')';
  this._gui.visit.value = 'Visit(' + (vNumber+1) + ')';
  
  if (this._visitor.status == 1) {
    this._gui.title.appendChild(document.createTextNode(' (Succeed)'));
  } else if (this._visitor.status == -1) {
    this._gui.title.appendChild(document.createTextNode(' (Failed)'));
  } else {
    if (vNumber || this._visitor.firstVisitMethod == 'Visitor') {
      this._gui.title.appendChild(document.createTextNode(' (Visited)'));
    }
  }
  if (this._visitor.brideEmail == '' && this._visitor.groomEmail == '') {
    this._gui.email.disabled = true;
    this._gui.email.style.width = '120px';
    this._gui.email.value = 'No EmailAddress';
  } else {
    this._gui.email.style.width = '67px';
  }
  
  this._gui.email.onclick = function() { var r = window.confirm('Would you like to email via our system?');
                                         if (r) {
                                           var pos, func1, func2;
                                           var operation = Operation.instance();
                                           operation.visitId = _self._visitorId;
                                           operation.cancelled = 0;
                                           operation.operateType = this.value;
                                           operation.operator = _self._operator.account;
                                           pos = [window.screen.width/3, window.screen.height/3];
                                           tmp = new ModulePopupBox(document, document.body, 710, 500, _self._operator, _self._now, { pos: pos, title: 'Send Email'});
                                           new ModuleEmailSend(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, {operation: operation, visitor: _self._visitor, callbackFunc: function() {_self._retrieveOperations();}, popupBox: tmp, pos: DOMUtils.findPos(this)});
                                           return false;
                                         } else {
                                           var pos, func1, func2;
                                           var operation = Operation.instance();
                                           operation.visitId = _self._visitorId;
                                           operation.cancelled = 0;
                                           operation.operateType = this.value;
                                           operation.operator = _self._operator.account;
                                           func1 = function() {  _self._retrieveOperations(); };
                                           pos = [window.screen.width/3, window.screen.height/3];
                                           tmp = new ModulePopupBox(document, document.body, 500, 200, _self._operator, _self._now, { pos: pos, title: 'Note'});
                                           new ModuleDialogInput(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, {item: operation, callbackFunc: func1, popupBox: tmp, pos: DOMUtils.findPos(this)});
                                           return false;
                                         }
                                       };
  this._gui.call.onclick = function() { var pos, func1, func2;
                                        var operation = Operation.instance();
                                        operation.visitId = _self._visitorId;
                                        operation.cancelled = 0;
                                        operation.operateType = this.value;
                                        operation.operator = _self._operator.account;
                                        func1 = function() {  _self._retrieveOperations(); };
                                        pos = [window.screen.width/3, window.screen.height/3];
                                        tmp = new ModulePopupBox(document, document.body, 500, 200, _self._operator, _self._now, { pos: pos, title: 'Note'});
                                        new ModuleDialogInput(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, {item: operation, callbackFunc: func1, popupBox: tmp, pos: DOMUtils.findPos(this)});
                                        return false;
                                      };
  this._gui.visit.onclick = function() { var pos, func1;
                                         var operation = Operation.instance();
                                         operation.visitId = _self._visitorId;
                                         operation.cancelled = 0;
                                         operation.operateType = this.value;
                                         operation.operator = _self._operator.account;
                                         func1 = function() {  _self._retrieveOperations(); };
                                         pos = [window.screen.width/3, window.screen.height/3];
                                         tmp = new ModulePopupBox(document, document.body, 500, 200, _self._operator, _self._now, { pos: pos, title: 'Note'});
                                         new ModuleDialogInput(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, {item: operation, callbackFunc: func1, popupBox: tmp, pos: DOMUtils.findPos(this)});
                                         return false;
                                       };
  
  this._gui.succeed.onclick = function() { var r = window.confirm('Would you confirm to do this?');
                                           if (r) {
                                             var pos = DOMUtils.findPos(this);
                                             _self._visitor.status = 1;
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
                                             var func = function() { _self._retrieveVisitor();
                                                                     window.open('http://dlmanage.co.nz/test/dms1/?p=pageasst&t=pagecustomer&m=' + MiscUtils.encode({ a: 2, b: 2 }) + '&opts=' + MiscUtils.encode({visitor: visitor}))
                                                                   };
                                             new RequestUtils()._write('visitor', [_self._visitor], [],  function(result, params) { if (result) { func(); } }, { pos: pos });
                                             return false;
                                           }
                                         };
  this._gui.drop.onclick = function() { var pos, func1;
                                        var operation = Operation.instance();
                                        operation.visitId = _self._visitorId;
                                        operation.cancelled = 0;
                                        operation.operateType = this.value;
                                        operation.operator = _self._operator.account;
                                        func1 = function() { _self._retrieveVisitor(); _self._retrieveOperations(); };
                                        pos = [window.screen.width/3, window.screen.height/3];
                                        tmp = new ModulePopupBox(document, document.body, 500, 200, _self._operator, _self._now, { pos: pos, title: 'Failed Reason'});
                                        new ModuleDialogInput(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, {item: operation, visitor: _self._visitor, drop: true, callbackFunc: func1, popupBox: tmp, pos: DOMUtils.findPos(this) });
//                                        var r = window.confirm('Would you confirm to do this?');
//                                        if (r) {
//                                          var pos = DOMUtils.findPos(this);
//                                          _self._visitor.status = -1;
//                                          new RequestUtils()._write('visitor', [_self._visitor], [],  function(result, params) { if (result) { _self._retrieveVisitor(); } }, { pos: pos });
//                                          return false;
//                                        }
                                      };
};

/* 
 * 修改日期1Change
 */
HandleVisitorExist.prototype._changeDate = function(label, currentDate, onChangeFunc, showTime) {
  var div, _self = this;
  div = document.createElement('div');
  div.style.left = DOMUtils.findPos(label)[0] + 'px';
  div.style.top = DOMUtils.findPos(label)[1] + 'px';
  this._popupBox = new ModulePopupBoxSimple(document, document.body, null, null, null, null, { pos: DOMUtils.findPos(label)});
  this._popupBox._gui.panel.appendChild(div);
  
  var ds = new DateSelect(currentDate, null, { container: div, showTime: showTime });
  ds._selectFunc = function(sd) { _self._selectDate.call(_self, sd, label, onChangeFunc, showTime); };
};
/* 
 * 修改日期2Select
 */
HandleVisitorExist.prototype._selectDate = function(sd, label, onChangeFunc, showTime) {
  onChangeFunc(sd);
  this._showDate(sd, label, showTime);
  this._popupBox._close();
};
/* 
 * 修改日期3Show
 */
HandleVisitorExist.prototype._showDate = function(sd, label, showTime) {
  if (sd) { 
    label.value = SimpleDate.format(sd, showTime);
  } else {
    label.value = '';
  }
};
