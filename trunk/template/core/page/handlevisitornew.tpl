function HandleVisitorNew(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._createElements();
};

HandleVisitorNew.prototype._createElements = function() {
  var pos = [window.screen.width / 2, window.screen.height / 5];
  this._popupBox = new ModulePopupBoxSimple(document, document.body, null, null, null, null, { pos: pos});
  MiscUtils.load(this._popupBox, 'Loading data...');
  
  this._visitor = pz_visitor.instance();
  this._visitor.weddingDay = '';
  this._visitor.firstVisitDate = '';
  this._visitor.cancelledDate = '';
  this._visitor.creator = this._operator.account;
  
  this._loadData();
};

HandleVisitorNew.prototype._loadData = function() {
  this._sources = null;
  this._receptions = null;
  this._cultures = null;
  this._ceremonys = null;
  
  this._retrieveSources();
  this._retrieveReceptions();
  this._retrieveCultures();
  this._retrieveCeremonys();
};

HandleVisitorNew.prototype._verifyData = function() {
  if (this._sources && this._receptions && this._cultures && this._ceremonys) {
    this._updateElements();
  }
};

HandleVisitorNew.prototype._retrieveSources = function() {
  var _self = this;
  new RequestUtils()._read('pz_isource', null, null, null, null, null, null, function(result, params) { _self._sources = result.data;
                                                                                                        _self._verifyData.call(_self);
                                                                                                      }, null);
};

HandleVisitorNew.prototype._retrieveReceptions = function() {
  var _self = this;
  new RequestUtils()._read('pz_ireception', null, null, null, null, null, null, function(result, params) { _self._receptions = result.data;
                                                                                                           _self._verifyData.call(_self);
                                                                                                         }, null);
};

HandleVisitorNew.prototype._retrieveCultures = function() {
  var _self = this;
  new RequestUtils()._read('pz_iculture', null, null, null, null, null, null, function(result, params) { _self._cultures = result.data;
                                                                                                         _self._verifyData.call(_self);
                                                                                                       }, null);
};

HandleVisitorNew.prototype._retrieveCeremonys = function() {
  var _self = this;
  new RequestUtils()._read('pz_iceremony', null, null, null, null, null, null, function(result, params) { _self._ceremonys = result.data;
                                                                                                          _self._verifyData.call(_self);
                                                                                                        }, null);
};

HandleVisitorNew.prototype._updateElements = function() {
  var _self = this, table, tr, td;
  this._popupBox._close();
  POZVFSUtils.clear(this._gui);
  
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
  this._gui.officeNote.value = this._visitor.note;
  
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
  this._gui.officeNote.onchange = function() { _self._visitor.note = this.value; };
  
  /* 联系方式的单词下拉框 */

  this._popupSimple = new ModulePopupBoxSimple(document, document.body, null, null, null, null, { where: 1});
  this._popupSimple._close();

  this._gui.brideName.onkeyup = function() { if (_self._gui.brideName.value.length == 0) {
                                               _self._popupSimple._close();
                                             } else {
                                               var pos1 = DOMUtils.findPos(this);
                                               var pos = [pos1[0] - 1, pos1[1] + 82];
                                               _self._popupSimple._close();
                                               _self._popupSimple._position = pos;
                                               _self._popupSimple._container = document.body;
                                               _self._popupSimple._createElements();
                                               var str = _self._queryString();
                                               var query = "SELECT v.e_oid as id, v.brideName, v.brideAddress, v.bridePhone, v.brideMobile, v.brideEmail, v.groomName, v.groomAddress, v.groomPhone, v.groomMobile, v.groomEmail, v.weddingDay FROM np_pz_visitor as v WHERE " + str + " ";
                                               new ModuleDialogResult(document, _self._popupSimple._gui.panel, 311, 30, _self._operator, _self._now, { weddingDay: _self._visitor.weddingDay, brideName: _self._gui.brideName, brideAddress: _self._gui.brideAddress, bridePhone: _self._gui.bridePhone, brideMobile: _self._gui.brideMobile, brideEmail: _self._gui.brideEmail, groomName: _self._gui.groomName, groomAddress: _self._gui.groomAddress, groomPhone: _self._gui.groomPhone, groomMobile: _self._gui.groomMobile, groomEmail: _self._gui.groomEmail, query: query, popupBox: _self._popupSimple });
                                               return false;
                                             }
                                           };
  
  this._gui.groomName.onkeyup = function() { if (_self._gui.groomName.value.length == 0) {
                                               _self._popupSimple._close();
                                             } else {
                                               var pos1 = DOMUtils.findPos(this);
                                               var pos = [pos1[0] - 1, pos1[1] + 82];
                                               _self._popupSimple._close();
                                               _self._popupSimple._position = pos;
                                               _self._popupSimple._container = document.body;
                                               _self._popupSimple._createElements();
                                               var str = _self._queryString();
                                               var query = "SELECT v.e_oid as id, v.brideName, v.brideAddress, v.bridePhone, v.brideMobile, v.brideEmail, v.groomName, v.groomAddress, v.groomPhone, v.groomMobile, v.groomEmail, v.weddingDay FROM np_pz_visitor as v WHERE " + str + " ";
                                               new ModuleDialogResult(document, _self._popupSimple._gui.panel, 311, 30, _self._operator, _self._now, { weddingDay: _self._visitor.weddingDay, brideName: _self._gui.brideName, brideAddress: _self._gui.brideAddress, bridePhone: _self._gui.bridePhone, brideMobile: _self._gui.brideMobile, brideEmail: _self._gui.brideEmail, groomName: _self._gui.groomName, groomAddress: _self._gui.groomAddress, groomPhone: _self._gui.groomPhone, groomMobile: _self._gui.groomMobile, groomEmail: _self._gui.groomEmail, query: query, popupBox: _self._popupSimple });
                                               return false;
                                             }
                                           };
  
  this._gui.brideAddress.onkeyup = function() { if (_self._gui.brideAddress.value.length == 0) {
                                                  _self._popupSimple._close();
                                                } else {
                                                  var pos1 = DOMUtils.findPos(this);
                                                  var pos = [pos1[0] - 1, pos1[1] + 82];
                                                  _self._popupSimple._close();
                                                  _self._popupSimple._position = pos;
                                                  _self._popupSimple._container = document.body;
                                                  _self._popupSimple._createElements();
                                                  var str = _self._queryString();
                                                  var query = "SELECT v.e_oid as id, v.brideName, v.brideAddress, v.bridePhone, v.brideMobile, v.brideEmail, v.groomName, v.groomAddress, v.groomPhone, v.groomMobile, v.groomEmail, v.weddingDay FROM np_pz_visitor as v WHERE " + str + " ";
                                                  new ModuleDialogResult(document, _self._popupSimple._gui.panel, 311, 30, _self._operator, _self._now, { weddingDay: _self._visitor.weddingDay, brideName: _self._gui.brideName, brideAddress: _self._gui.brideAddress, bridePhone: _self._gui.bridePhone, brideMobile: _self._gui.brideMobile, brideEmail: _self._gui.brideEmail, groomName: _self._gui.groomName, groomAddress: _self._gui.groomAddress, groomPhone: _self._gui.groomPhone, groomMobile: _self._gui.groomMobile, groomEmail: _self._gui.groomEmail, query: query, popupBox: _self._popupSimple });
                                                  return false;
                                                }
                                              };
  
  this._gui.groomAddress.onkeyup = function() { if (_self._gui.groomAddress.value.length == 0) {
                                                  _self._popupSimple._close();
                                                } else {
                                                  var pos1 = DOMUtils.findPos(this);
                                                  var pos = [pos1[0] - 1, pos1[1] + 82];
                                                  _self._popupSimple._close();
                                                  _self._popupSimple._position = pos;
                                                  _self._popupSimple._container = document.body;
                                                  _self._popupSimple._createElements();
                                                  var str = _self._queryString();
                                                  var query = "SELECT v.e_oid as id, v.brideName, v.brideAddress, v.bridePhone, v.brideMobile, v.brideEmail, v.groomName, v.groomAddress, v.groomPhone, v.groomMobile, v.groomEmail, v.weddingDay FROM np_pz_visitor as v WHERE " + str + " ";
                                                  new ModuleDialogResult(document, _self._popupSimple._gui.panel, 311, 30, _self._operator, _self._now, { weddingDay: _self._visitor.weddingDay, brideName: _self._gui.brideName, brideAddress: _self._gui.brideAddress, bridePhone: _self._gui.bridePhone, brideMobile: _self._gui.brideMobile, brideEmail: _self._gui.brideEmail, groomName: _self._gui.groomName, groomAddress: _self._gui.groomAddress, groomPhone: _self._gui.groomPhone, groomMobile: _self._gui.groomMobile, groomEmail: _self._gui.groomEmail, query: query, popupBox: _self._popupSimple });
                                                  return false;
                                                }
                                              };
  
  this._gui.bridePhone.onkeyup = function() { if (_self._gui.bridePhone.value.length == 0) {
                                                _self._popupSimple._close();
                                              } else {
                                                var pos1 = DOMUtils.findPos(this);
                                                var pos = [pos1[0] - 1, pos1[1] + 82];
                                                _self._popupSimple._close();
                                                _self._popupSimple._position = pos;
                                                _self._popupSimple._container = document.body;
                                                _self._popupSimple._createElements();
                                                var str = _self._queryString();
                                                var query = "SELECT v.e_oid as id, v.brideName, v.brideAddress, v.bridePhone, v.brideMobile, v.brideEmail, v.groomName, v.groomAddress, v.groomPhone, v.groomMobile, v.groomEmail, v.weddingDay FROM np_pz_visitor as v WHERE " + str + " ";
                                                new ModuleDialogResult(document, _self._popupSimple._gui.panel, 311, 30, _self._operator, _self._now, { weddingDay: _self._visitor.weddingDay, brideName: _self._gui.brideName, brideAddress: _self._gui.brideAddress, bridePhone: _self._gui.bridePhone, brideMobile: _self._gui.brideMobile, brideEmail: _self._gui.brideEmail, groomName: _self._gui.groomName, groomAddress: _self._gui.groomAddress, groomPhone: _self._gui.groomPhone, groomMobile: _self._gui.groomMobile, groomEmail: _self._gui.groomEmail, query: query, popupBox: _self._popupSimple });
                                                return false;
                                              }
                                            };
  
  this._gui.groomPhone.onkeyup = function() { if (_self._gui.groomPhone.value.length == 0) {
                                                _self._popupSimple._close();
                                              } else {
                                                var pos1 = DOMUtils.findPos(this);
                                                var pos = [pos1[0] - 1, pos1[1] + 82];
                                                _self._popupSimple._close();
                                                _self._popupSimple._position = pos;
                                                _self._popupSimple._container = document.body;
                                                _self._popupSimple._createElements();
                                                var str = _self._queryString();
                                                var query = "SELECT v.e_oid as id, v.brideName, v.brideAddress, v.bridePhone, v.brideMobile, v.brideEmail, v.groomName, v.groomAddress, v.groomPhone, v.groomMobile, v.groomEmail, v.weddingDay FROM np_pz_visitor as v WHERE " + str + " ";
                                                new ModuleDialogResult(document, _self._popupSimple._gui.panel, 311, 30, _self._operator, _self._now, { weddingDay: _self._visitor.weddingDay, brideName: _self._gui.brideName, brideAddress: _self._gui.brideAddress, bridePhone: _self._gui.bridePhone, brideMobile: _self._gui.brideMobile, brideEmail: _self._gui.brideEmail, groomName: _self._gui.groomName, groomAddress: _self._gui.groomAddress, groomPhone: _self._gui.groomPhone, groomMobile: _self._gui.groomMobile, groomEmail: _self._gui.groomEmail, query: query, popupBox: _self._popupSimple });
                                                return false;
                                              }
                                            };
  
  this._gui.brideMobile.onkeyup = function() { if (_self._gui.brideMobile.value.length == 0) {
                                                 _self._popupSimple._close();
                                               } else {
                                                 var pos1 = DOMUtils.findPos(this);
                                                 var pos = [pos1[0] - 1, pos1[1] + 82];
                                                 _self._popupSimple._close();
                                                 _self._popupSimple._position = pos;
                                                 _self._popupSimple._container = document.body;
                                                 _self._popupSimple._createElements();
                                                 var str = _self._queryString();
                                                 var query = "SELECT v.e_oid as id, v.brideName, v.brideAddress, v.bridePhone, v.brideMobile, v.brideEmail, v.groomName, v.groomAddress, v.groomPhone, v.groomMobile, v.groomEmail, v.weddingDay FROM np_pz_visitor as v WHERE " + str + " ";
                                                 new ModuleDialogResult(document, _self._popupSimple._gui.panel, 311, 30, _self._operator, _self._now, { weddingDay: _self._visitor.weddingDay, brideName: _self._gui.brideName, brideAddress: _self._gui.brideAddress, bridePhone: _self._gui.bridePhone, brideMobile: _self._gui.brideMobile, brideEmail: _self._gui.brideEmail, groomName: _self._gui.groomName, groomAddress: _self._gui.groomAddress, groomPhone: _self._gui.groomPhone, groomMobile: _self._gui.groomMobile, groomEmail: _self._gui.groomEmail, query: query, popupBox: _self._popupSimple });
                                                 return false;
                                               }
                                             };
 
  this._gui.groomMobile.onkeyup = function() { if (_self._gui.groomMobile.value.length == 0) {
                                                 _self._popupSimple._close();
                                               } else {
                                                 var pos1 = DOMUtils.findPos(this);
                                                 var pos = [pos1[0] - 1, pos1[1] + 82];
                                                 _self._popupSimple._close();
                                                 _self._popupSimple._position = pos;
                                                 _self._popupSimple._container = document.body;
                                                 _self._popupSimple._createElements();
                                                 var str = _self._queryString();
                                                 var query = "SELECT v.e_oid as id, v.brideName, v.brideAddress, v.bridePhone, v.brideMobile, v.brideEmail, v.groomName, v.groomAddress, v.groomPhone, v.groomMobile, v.groomEmail, v.weddingDay FROM np_pz_visitor as v WHERE " + str + " ";
                                                 new ModuleDialogResult(document, _self._popupSimple._gui.panel, 311, 30, _self._operator, _self._now, { weddingDay: _self._visitor.weddingDay, brideName: _self._gui.brideName, brideAddress: _self._gui.brideAddress, bridePhone: _self._gui.bridePhone, brideMobile: _self._gui.brideMobile, brideEmail: _self._gui.brideEmail, groomName: _self._gui.groomName, groomAddress: _self._gui.groomAddress, groomPhone: _self._gui.groomPhone, groomMobile: _self._gui.groomMobile, groomEmail: _self._gui.groomEmail, query: query, popupBox: _self._popupSimple });
                                                 return false;
                                               }
                                             };
  
  this._gui.brideEmail.onkeyup = function() { if (_self._gui.brideEmail.value.length == 0) {
                                                _self._popupSimple._close();
                                              } else {
                                                var pos1 = DOMUtils.findPos(this);
                                                var pos = [pos1[0] - 1, pos1[1] + 82];
                                                _self._popupSimple._close();
                                                _self._popupSimple._position = pos;
                                                _self._popupSimple._container = document.body;
                                                _self._popupSimple._createElements();
                                                var str = _self._queryString();
                                                var query = "SELECT v.e_oid as id, v.brideName, v.brideAddress, v.bridePhone, v.brideMobile, v.brideEmail, v.groomName, v.groomAddress, v.groomPhone, v.groomMobile, v.groomEmail, v.weddingDay FROM np_pz_visitor as v WHERE " + str + " ";
                                                new ModuleDialogResult(document, _self._popupSimple._gui.panel, 311, 30, _self._operator, _self._now, { weddingDay: _self._visitor.weddingDay, brideName: _self._gui.brideName, brideAddress: _self._gui.brideAddress, bridePhone: _self._gui.bridePhone, brideMobile: _self._gui.brideMobile, brideEmail: _self._gui.brideEmail, groomName: _self._gui.groomName, groomAddress: _self._gui.groomAddress, groomPhone: _self._gui.groomPhone, groomMobile: _self._gui.groomMobile, groomEmail: _self._gui.groomEmail, query: query, popupBox: _self._popupSimple });
                                                return false;
                                              }
                                            };

this._gui.groomEmail.onkeyup = function() { if (_self._gui.groomEmail.value.length == 0) {
                                              _self._popupSimple._close();
                                            } else {
                                              var pos1 = DOMUtils.findPos(this);
                                              var pos = [pos1[0] - 1, pos1[1] + 82];
                                              _self._popupSimple._close();
                                              _self._popupSimple._position = pos;
                                              _self._popupSimple._container = document.body;
                                              _self._popupSimple._createElements();
                                              var str = _self._queryString();
                                              var query = "SELECT v.e_oid as id, v.brideName, v.brideAddress, v.bridePhone, v.brideMobile, v.brideEmail, v.groomName, v.groomAddress, v.groomPhone, v.groomMobile, v.groomEmail, v.weddingDay FROM np_pz_visitor as v WHERE " + str + " ";
                                              new ModuleDialogResult(document, _self._popupSimple._gui.panel, 311, 30, _self._operator, _self._now, { weddingDay: _self._visitor.weddingDay, brideName: _self._gui.brideName, brideAddress: _self._gui.brideAddress, bridePhone: _self._gui.bridePhone, brideMobile: _self._gui.brideMobile, brideEmail: _self._gui.brideEmail, groomName: _self._gui.groomName, groomAddress: _self._gui.groomAddress, groomPhone: _self._gui.groomPhone, groomMobile: _self._gui.groomMobile, groomEmail: _self._gui.groomEmail, query: query, popupBox: _self._popupSimple });
                                              return false;
                                            }
                                          };
  
  
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
  this._gui.sourceAdd.onclick = function() { var object = pz_isource.instance(); 
                                             var func1 = function() { tmp._close();
                                                                      _self._visitor.source = object.name;
                                                                      new RequestUtils()._write('pz_isource', [object], [], function() { _self._retrieveSources.call(_self); }, { pos: DOMUtils.findPos(_self._gui.sourceAdd) });
                                                                    };
                                             var func2 = function() { tmp._close();
                                                                    };
                                             pos = DOMUtils.findPos(this);
                                             tmp = new ModulePopupBoxSimple(document, document.body, null, null, _self._operator, _self._now, { pos: pos});
                                             var dialog = new ModuleDialogIObject(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, { name: 'pz_isource', title: 'Sources', item: object });
                                             MiscUtils.dialog(tmp, null, func1, func2, { ok: 'Add'});
                                           };
  this._gui.receptionLocationAdd.onclick = function() { var object = pz_ireception.instance();
                                                        var func1 = function() { tmp._close();
                                                                                 _self._visitor.receptionLocation = object.name;
                                                                                 new RequestUtils()._write('pz_ireception', [object], [], function() { _self._retrieveReceptions.call(_self); }, { pos: DOMUtils.findPos(_self._gui.receptionLocationAdd) });
                                                                               };
                                                        var func2 = function() { tmp._close();
                                                                               };
                                                        pos = DOMUtils.findPos(this);
                                                        tmp = new ModulePopupBoxSimple(document, document.body, null, null, _self._operator, _self._now, { pos: pos});
                                                        new ModuleDialogIObject(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, { name: 'pz_ireception', title: 'Reception Location', item: object });
                                                        MiscUtils.dialog(tmp, null, func1, func2, { ok: 'Add'});
                                                        };
  this._gui.culturalBackgroundAdd.onclick = function() { var object = pz_iculture.instance();
                                                         var func1 = function() { tmp._close();
                                                                                  _self._visitor.culturalBackground = object.name;
                                                                                  new RequestUtils()._write('pz_iculture', [object], [], function() { _self._retrieveCultures.call(_self); }, { pos: DOMUtils.findPos(_self._gui.culturalBackgroundAdd) });
                                                                                };
                                                         var func2 = function() { tmp._close();
                                                                                };
                                                         pos = DOMUtils.findPos(this);
                                                         tmp = new ModulePopupBoxSimple(document, document.body, null, null, _self._operator, _self._now, { pos: pos});
                                                         new ModuleDialogIObject(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, { name: 'pz_iculture', title: 'Cultural Background', item: object });
                                                         MiscUtils.dialog(tmp, null, func1, func2, { ok: 'Add'});
                                                       };
  this._gui.ceremonyLocationAdd.onclick = function() { var object = pz_iceremony.instance();
                                                       var func1 = function() { tmp._close();
                                                                                _self._visitor.ceremonyLocation = object.name;
                                                                                new RequestUtils()._write('pz_iceremony', [object], [], function() { _self._retrieveCeremonys.call(_self); }, { pos: DOMUtils.findPos(_self._gui.ceremonyLocationAdd) });
                                                                              };
                                                       var func2 = function() { tmp._close();
                                                                              };
                                                       pos = DOMUtils.findPos(this);
                                                       tmp = new ModulePopupBoxSimple(document, document.body, null, null, _self._operator, _self._now, { pos: pos});
                                                       new ModuleDialogIObject(document, tmp._gui.panel, 300, 30, _self._operator, _self._now, { name: 'pz_iceremony', title: 'Ceremony Location', item: object });
                                                       MiscUtils.dialog(tmp, null, func1, func2, { ok: 'Add'});
                                                     };
  /* Save */
  this._gui.save.onclick = function() { if (_self._visitor.firstVisitMethod != '') {
                                          _self._visitor.isVisited = (_self._visitor.firstVisitMethod == '{{$smarty.const.Visitor_Method_Visitor|escape:javascript}}') ? true : false;
                                          if (!_self._visitor.weddingDay || !_self._visitor.firstVisitDate) {
                                            var str = '';
                                            if (!_self._visitor.weddingDay && !_self._visitor.firstVisitDate) {
                                              str += 'Wedding Day and First Contact Date';
                                            } else if (!_self._visitor.weddingDay) {
                                              str += 'Wedding Day';
                                            } else if (!_self._visitor.firstVisitDate) {
                                              str += 'First Contact Date';
                                            }
                                            var r = window.confirm('NO ' + str + ', ' + 'CONTINUE?');
                                            if (r) {
                                              var pos = DOMUtils.findPos(this);
                                              new RequestUtils()._custom('addVisitor', {visitor: _self._visitor}, function(result, params) { if (result) { location.href = '?t=visitorexist&m=' + MiscUtils.encode({ a: 1, b: 1 }) + '&opts=' + MiscUtils.encode({id: result.id});
                                                                                                                                                         };
                                                                                                                                           }, { pos: pos });
                                            }
                                          } else {
                                            var pos = DOMUtils.findPos(this);
                                            new RequestUtils()._custom('addVisitor', {visitor: _self._visitor}, function(result, params) { if (result) { location.href = '?t=visitorexist&m=' + MiscUtils.encode({ a: 1, b: 1 }) + '&opts=' + MiscUtils.encode({id: result.id});
                                                                                                                                                       };
                                                                                                                                         }, { pos: pos });
                                          }
                                        } else {
                                          window.alert('CAN NOT BE EMPTY (First Contact Method)');
                                        }
                                      };
};

HandleVisitorNew.prototype._queryString = function() {
  var str = '';
  
  if (str != '') {
    if (this._gui.brideName.value != '') {
      str += ' OR ' + '(v.brideName LIKE \'%' + this._gui.brideName.value + '%\')';
    }
  } else {
    if (this._gui.brideName.value != '') {
      str += '(v.brideName LIKE \'%' + this._gui.brideName.value + '%\')';
    }
  }
  if (str != '') {
    if (this._gui.brideAddress.value != '') {
      str += ' OR ' + '(v.brideAddress LIKE \'%' + this._gui.brideAddress.value + '%\')';
    }
  } else {
    if (this._gui.brideAddress.value != '') {
      str += '(v.brideAddress LIKE \'%' + this._gui.brideAddress.value + '%\')';
    }
  }
  
  if (str != '') {
    if (this._gui.bridePhone.value != '') {
      str += ' OR ' + '(v.bridePhone LIKE \'%' + this._gui.bridePhone.value + '%\')';
    }
  } else {
    if (this._gui.bridePhone.value != '') {
      str += '(v.bridePhone LIKE \'%' + this._gui.bridePhone.value + '%\')';
    }
  }
  
  if (str != '') {
    if (this._gui.brideMobile.value != '') {
      str += ' OR ' + '(v.brideMobile LIKE \'%' + this._gui.brideMobile.value + '%\')';
    }
  } else {
    if (this._gui.brideMobile.value != '') {
      str += '(v.brideMobile LIKE \'%' + this._gui.brideMobile.value + '%\')';
    }
  }
  
  if (str != '') {
    if (this._gui.brideEmail.value != '') {
      str += ' OR ' + '(v.brideEmail LIKE \'%' + this._gui.brideEmail.value + '%\')';
    }
  } else {
    if (this._gui.brideEmail.value != '') {
      str += '(v.brideEmail LIKE \'%' + this._gui.brideEmail.value + '%\')';
    }
  }
  
  if (str != '') {
    if (this._gui.groomName.value != '') {
      str += ' OR ' + '(v.groomName LIKE \'%' + this._gui.groomName.value + '%\')';
    }
  } else {
    if (this._gui.groomName.value != '') {
      str += '(v.groomName LIKE \'%' + this._gui.groomName.value + '%\')';
    }
  }
  if (str != '') {
    if (this._gui.groomAddress.value != '') {
      str += ' OR ' + '(v.groomAddress LIKE \'%' + this._gui.groomAddress.value + '%\')';
    }
  } else {
    if (this._gui.groomAddress.value != '') {
      str += '(v.groomAddress LIKE \'%' + this._gui.groomAddress.value + '%\')';
    }
  }
  
  if (str != '') {
    if (this._gui.groomPhone.value != '') {
      str += ' OR ' + '(v.groomPhone LIKE \'%' + this._gui.groomPhone.value + '%\')';
    }
  } else {
    if (this._gui.groomPhone.value != '') {
      str += '(v.groomPhone LIKE \'%' + this._gui.groomPhone.value + '%\')';
    }
  }
  
  if (str != '') {
    if (this._gui.groomMobile.value != '') {
      str += ' OR ' + '(v.groomMobile LIKE \'%' + this._gui.groomMobile.value + '%\')';
    }
  } else {
    if (this._gui.groomMobile.value != '') {
      str += '(v.groomMobile LIKE \'%' + this._gui.groomMobile.value + '%\')';
    }
  }
  
  if (str != '') {
    if (this._gui.groomEmail.value != '') {
      str += ' OR ' + '(v.groomEmail LIKE \'%' + this._gui.groomEmail.value + '%\')';
    }
  } else {
    if (this._gui.groomEmail.value != '') {
      str += '(v.groomEmail LIKE \'%' + this._gui.groomEmail.value + '%\')';
    }
  }
  return str;
}

/* 
 * 修改日期1Change
 */
HandleVisitorNew.prototype._changeDate = function(label, currentDate, onChangeFunc, showTime) {
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
HandleVisitorNew.prototype._selectDate = function(sd, label, onChangeFunc, showTime) {
  onChangeFunc(sd);
  this._showDate(sd, label, showTime);
  this._popupBox._close();
};

/* 
 * 修改日期3Show
 */
HandleVisitorNew.prototype._showDate = function(sd, label, showTime) {
  if (sd) { 
    label.value = SimpleDate.format(sd, showTime);
  } else {
    label.value = '';
  }
};