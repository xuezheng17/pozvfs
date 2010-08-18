function HandleVisitors(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._search = POZVFSUtils.search();
  
  this._createElements();
}

HandleVisitors.prototype._createElements = function() {
  var _self = this, tr, td;
  this._visitors = null;
  this._parameters = null;
  
  var table = document.createElement('table');
  table.cellPadding = 0;
  table.cellSpacing = 0;
  this._gui.visitors.appendChild(table);
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.width = '980px';
  td.style.height = '122px';
  td.style.textAlign = 'center';
  td.style.fontWeight = 'bold';
  td.appendChild(document.createTextNode('Show Visitors by Search or Create '));
  var a = document.createElement('a');
  a.style.fontSize = '13px';
  a.style.fontWeight = 'normal';
  a.href = '?t=visitornew&m={\"a\":1,\"b\":2}';
  a.appendChild(document.createTextNode('New Visitor'));
  td.appendChild(a);
  
  this._visitorSearch(this._gui, function(condition, datefrom, dateto, from, to, pos) { _self._retrieveVisitors.call(_self, 1, condition, datefrom, dateto, from, to, pos); });
};

HandleVisitors.prototype._verifyData = function() {
  if (this._visitors) {
    this._updateElements();
  }
};

HandleVisitors.prototype._retrieveVisitors = function(page, condition, datefrom, dateto, from, to, pos) {
  var _self = this;
  if (condition) {
    var tmp = condition.indexOf('WHERE');
    condition = condition.substr((tmp != -1) ? tmp + 6 : 0);
  }
  var args = ((condition) ?  '&c=WHERE ' + encodeURIComponent(condition) : '') + '&p=' + page + '&s={{$smarty.const.SIZE|escape:'javascript'}}' + ((datefrom) ?  '&datefrom=' + datefrom : '') + ((dateto) ?  '&dateto=' + dateto : '') + ((from) ?  '&from=' + from : '') + ((to) ?  '&to=' + to : '');
  new RequestUtils()._mysql('visitors', args, function(result, params) { _self._visitors = result.data; 
                                                                         _self._parameters = result;
                                                                         _self._verifyData.call(_self);
                                                                       }, { pos: (pos) ? pos : null });
};

HandleVisitors.prototype._updateElements = function() {
  var unique, _self = this;
  DOMUtils.removeChildElements(this._gui.page);
  DOMUtils.removeChildElements(this._gui.visitors);
  if (this._parameters.total > this._parameters.size) {
    new ModulePagination(document, this._gui.page, 500, 50, this._operator, this._now, {page: this._parameters.page, total: this._parameters.total, limit: this._parameters.size, callbackFunc: function(page, condition) { _self._retrieveVisitors.call(_self, page, _self._parameters.condition); }, context: this});
  }
  var table = document.createElement('table');
  table.cellPadding = 0;
  table.cellSpacing = 0;
  this._gui.visitors.appendChild(table);
  if (this._visitors.length == 0) {
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.width = '980px';
    td.style.height = '122px';
    td.style.textAlign = 'center';
    td.style.fontWeight = 'bold';
    td.appendChild(document.createTextNode('No Result Matches'));
  }
  for (var i = 0, il = this._visitors.length; i < il; i++) {
    var tmp = this._visitors[i];
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    new ModuleVisitorResult(document, td, 980, 122, this._operator, this._now, { item: tmp } );
  }
};

HandleVisitors.prototype._visitorSearch = function(gui, callbackFunc) {
  var _self = this;
  this._callbackFunc = callbackFunc;
  
  gui.visitorNo.value = this._search.id;
  gui.visitorNo.onkeydown = function() { _self._search.id = this.value; };
  gui.visitorNo.onchange = function() { _self._search.id = this.value; };
  gui.visitorNo.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                           if (code == 13) {
                                             _self._callbackFunc.call(_self, _self._toString(_self._search), (_self._search.weddingDayFrom) ? JSON.stringify(_self._search.weddingDayFrom) : null, (_self._search.weddingDayTo) ? JSON.stringify(_self._search.weddingDayTo) : null, (_self._search.createdDateFrom) ? JSON.stringify(_self._search.createdDateFrom) : null, (_self._search.createdDateTo) ? JSON.stringify(_self._search.createdDateTo) : null, DOMUtils.findPos(this));
                                           }
                                         };
  
  gui.name.value = this._search.name;
  gui.name.onkeydown = function() { _self._search.name = this.value; };
  gui.name.onchange = function() { _self._search.name = this.value; };
  gui.name.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                      if (code == 13) {
                                        _self._callbackFunc.call(_self, _self._toString(_self._search), (_self._search.weddingDayFrom) ? JSON.stringify(_self._search.weddingDayFrom) : null, (_self._search.weddingDayTo) ? JSON.stringify(_self._search.weddingDayTo) : null, (_self._search.createdDateFrom) ? JSON.stringify(_self._search.createdDateFrom) : null, (_self._search.createdDateTo) ? JSON.stringify(_self._search.createdDateTo) : null, DOMUtils.findPos(this));
                                      }
                                    };
  
  gui.phone.value = this._search.phone;
  gui.phone.onkeydown = function() { _self._search.phone = this.value; };
  gui.phone.onchange = function() { _self._search.phone = this.value; };
  gui.phone.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                       if (code == 13) {
                                         _self._callbackFunc.call(_self, _self._toString(_self._search), (_self._search.weddingDayFrom) ? JSON.stringify(_self._search.weddingDayFrom) : null, (_self._search.weddingDayTo) ? JSON.stringify(_self._search.weddingDayTo) : null, (_self._search.createdDateFrom) ? JSON.stringify(_self._search.createdDateFrom) : null, (_self._search.createdDateTo) ? JSON.stringify(_self._search.createdDateTo) : null, DOMUtils.findPos(this));
                                       }
                                     };
  
  gui.email.value = this._search.email;
  gui.email.onkeydown = function() { _self._search.email = this.value; };
  gui.email.onchange = function() { _self._search.email = this.value; };
  gui.email.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                       if (code == 13) {
                                         _self._callbackFunc.call(_self, _self._toString(_self._search), (_self._search.weddingDayFrom) ? JSON.stringify(_self._search.weddingDayFrom) : null, (_self._search.weddingDayTo) ? JSON.stringify(_self._search.weddingDayTo) : null, (_self._search.createdDateFrom) ? JSON.stringify(_self._search.createdDateFrom) : null, (_self._search.createdDateTo) ? JSON.stringify(_self._search.createdDateTo) : null, DOMUtils.findPos(this));
                                       }
                                     };
  
  gui.weddingDayFrom.value = (this._search.weddingDayFrom) ? SimpleDate.format(this._search.weddingDayFrom) : '';
  gui.weddingDayFrom.onclick = function() { var context = this;
                                            _self._changeDate.call(_self, this, _self._search.weddingDayFrom, function(sd) { _self._search.weddingDayFrom = sd; context.focus();}, false);
                                            return false;
                                          };
  gui.weddingDayFrom.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                                if (code == 13) {
                                                  _self._callbackFunc.call(_self, _self._toString(_self._search), (_self._search.weddingDayFrom) ? JSON.stringify(_self._search.weddingDayFrom) : null, (_self._search.weddingDayTo) ? JSON.stringify(_self._search.weddingDayTo) : null, (_self._search.createdDateFrom) ? JSON.stringify(_self._search.createdDateFrom) : null, (_self._search.createdDateTo) ? JSON.stringify(_self._search.createdDateTo) : null, DOMUtils.findPos(this));
                                                }
                                              };
  gui.weddingDayTo.value = (this._search.weddingDayTo) ? SimpleDate.format(this._search.weddingDayTo) : '';
  gui.weddingDayTo.onclick = function() { var context = this;
                                          _self._changeDate.call(_self, this, _self._search.weddingDayTo, function(sd) { _self._search.weddingDayTo = sd; context.focus();}, false);
                                          return false;
                                        };
  gui.weddingDayTo.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                              if (code == 13) {
                                                _self._callbackFunc.call(_self, _self._toString(_self._search), (_self._search.weddingDayFrom) ? JSON.stringify(_self._search.weddingDayFrom) : null, (_self._search.weddingDayTo) ? JSON.stringify(_self._search.weddingDayTo) : null, (_self._search.createdDateFrom) ? JSON.stringify(_self._search.createdDateFrom) : null, (_self._search.createdDateTo) ? JSON.stringify(_self._search.createdDateTo) : null, DOMUtils.findPos(this));
                                              }
                                            };
  gui.createdDateFrom.value = (this._search.createdDateFrom) ? SimpleDate.format(this._search.createdDateFrom) : '';
  gui.createdDateFrom.onclick = function() { var context = this;
                                             _self._changeDate.call(_self, this, _self._search.createdDateFrom, function(sd) { _self._search.createdDateFrom = sd; context.focus(); }, false);
                                             return false;
                                           };
  gui.createdDateFrom.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                                 if (code == 13) {
                                                   _self._callbackFunc.call(_self, _self._toString(_self._search), (_self._search.weddingDayFrom) ? JSON.stringify(_self._search.weddingDayFrom) : null, (_self._search.weddingDayTo) ? JSON.stringify(_self._search.weddingDayTo) : null, (_self._search.createdDateFrom) ? JSON.stringify(_self._search.createdDateFrom) : null, (_self._search.createdDateTo) ? JSON.stringify(_self._search.createdDateTo) : null, DOMUtils.findPos(this));
                                                 }
                                               };
  gui.createdDateTo.value = (this._search.createdDateTo) ? SimpleDate.format(this._search.createdDateTo) : '';
  gui.createdDateTo.onclick = function() { var context = this;
                                           _self._changeDate.call(_self, this, _self._search.createdDateTo, function(sd) { _self._search.createdDateTo = sd; context.focus(); }, false);
                                           return false;
                                         };
  gui.createdDateTo.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                               if (code == 13) {
                                                 _self._callbackFunc.call(_self, _self._toString(_self._search), (_self._search.weddingDayFrom) ? JSON.stringify(_self._search.weddingDayFrom) : null, (_self._search.weddingDayTo) ? JSON.stringify(_self._search.weddingDayTo) : null, (_self._search.createdDateFrom) ? JSON.stringify(_self._search.createdDateFrom) : null, (_self._search.createdDateTo) ? JSON.stringify(_self._search.createdDateTo) : null, DOMUtils.findPos(this));
                                               }
                                             };
  gui.inProgressingOnly.defaultChecked = this._search.inProgressingOnly;
  gui.inProgressingOnly.onclick = function() { _self._search.inProgressingOnly = this.checked;
                                             };
  gui.succeeded.defaultChecked = this._search.succeeded;
  gui.succeeded.onclick = function() { _self._search.succeeded = this.checked;
                                     };
  gui.failed.defaultChecked = this._search.failed;
  gui.failed.onclick = function() { _self._search.failed = this.checked;
                                  };
  gui.deleted.defaultChecked = this._search.deleted;
  gui.deleted.onclick = function() { _self._search.deleted = this.checked;
                                   };

  gui.search.onclick = function() { _self._callbackFunc.call(_self, _self._toString(_self._search), (_self._search.weddingDayFrom) ? JSON.stringify(_self._search.weddingDayFrom) : null, (_self._search.weddingDayTo) ? JSON.stringify(_self._search.weddingDayTo) : null, (_self._search.createdDateFrom) ? JSON.stringify(_self._search.createdDateFrom) : null, (_self._search.createdDateTo) ? JSON.stringify(_self._search.createdDateTo) : null, DOMUtils.findPos(this)); };
};

HandleVisitors.prototype._toString = function(search) {
  var str = '';
  
  if (search.id != '') {
    str +=  '(v.e_oid=\'' + search.id + '\')';
  }
  if (str != '') {
    if (search.name != '') {
      str += ' OR ' + '((v.brideName LIKE \'%' + search.name + '%\') OR (v.groomName LIKE \'%' + search.name + '%\'))';
    }
  } else {
    if (search.name != '') {
      str += '((v.brideName LIKE \'%' + search.name + '%\') OR (v.groomName LIKE \'%' + search.name + '%\'))';
    }
  }
  if (str != '') {
    if (search.phone != '') {
      str += ' OR ' + '((v.bridePhone LIKE \'%' + search.phone + '%\') OR (v.brideMobile LIKE \'%' + search.phone + '%\') OR (v.groomPhone LIKE \'%' + search.phone + '%\') OR (v.groomMobile LIKE \'%' + search.phone + '%\'))';
    }
  } else {
    if (search.phone != '') {
      str += '((v.bridePhone LIKE \'%' + search.phone + '%\') OR (v.brideMobile LIKE \'%' + search.phone + '%\') OR (v.groomPhone LIKE \'%' + search.phone + '%\') OR (v.groomMobile LIKE \'%' + search.phone + '%\'))';
    }
  }
  if (str != '') {
    if (search.email != '') {
      str += ' OR ' + '((v.brideEmail LIKE \'%' + search.email + '%\') OR (v.groomEmail LIKE \'%' + search.email + '%\'))';
    }
  } else {
    if (search.email != '') {
      str += '((v.brideEmail LIKE \'%' + search.email + '%\') OR (v.groomEmail LIKE \'%' + search.email + '%\'))';
    }
  }
  
//  var str = 'WHERE ';
//  if (search.id == '' && search.phone == '' && search.name == '' && search.email == '') {
//    str += '1=0';
//  } else if (search.phone == '' && search.name == '' && search.email == '') {
//    str +=  '((v.e_oid=\'' + search.id + '\'))';
//  } else if (search.id == '' && search.name == '' && search.email == '') {
//    str += '((v.bridePhone LIKE \'%' + search.phone + '%\') OR (v.brideMobile LIKE \'%' + search.phone + '%\') OR (v.groomPhone LIKE \'%' + search.phone + '%\') OR (v.groomMobile LIKE \'%' + search.phone + '%\'))';
//  } else if (search.id == '' && search.phone == '' && search.email == '') {
//    str += '((v.brideName LIKE \'%' + search.name + '%\') OR (v.groomName LIKE \'%' + search.name + '%\'))';
//  } else if (search.id == '' && search.phone == '' && search.name == '') {
//    str += '((v.brideEmail LIKE \'%' + search.email + '%\') OR (v.groomEmail LIKE \'%' + search.email + '%\'))';
//  } else if (search.name == '' && search.email == '') {
//    str +=  '((v.e_oid=\'' + search.id + '\'))' + ' OR ' + '((v.bridePhone LIKE \'%' + search.phone + '%\') OR (v.brideMobile LIKE \'%' + search.phone + '%\') OR (v.groomPhone LIKE \'%' + search.phone + '%\') OR (v.groomMobile LIKE \'%' + search.phone + '%\'))';
//  } else if (search.phone == '' && search.email == '') {
//    str +=  '((v.e_oid=\'' + search.id + '\'))' + ' OR ' + '((v.brideName LIKE \'%' + search.name + '%\') OR (v.groomName LIKE \'%' + search.name + '%\'))';
//  } else if (search.phone == '' && search.name == '') {
//    str +=  '((v.e_oid=\'' + search.id + '\'))' + ' OR ' + '((v.brideEmail LIKE \'%' + search.email + '%\') OR (v.groomEmail LIKE \'%' + search.email + '%\'))';
//  } else if (search.id == '' && search.email == '') {
//    str +=  '((v.brideName LIKE \'%' + search.name + '%\') OR (v.groomName LIKE \'%' + search.name + '%\'))' + ' OR ' + '((v.bridePhone LIKE \'%' + search.phone + '%\') OR (v.brideMobile LIKE \'%' + search.phone + '%\') OR (v.groomPhone LIKE \'%' + search.phone + '%\') OR (v.groomMobile LIKE \'%' + search.phone + '%\'))';
//  } else if (search.id == '' && search.name == '') {
//    str +=  '((v.brideEmail LIKE \'%' + search.email + '%\') OR (v.groomEmail LIKE \'%' + search.email + '%\'))' + ' OR ' + '((v.bridePhone LIKE \'%' + search.phone + '%\') OR (v.brideMobile LIKE \'%' + search.phone + '%\') OR (v.groomPhone LIKE \'%' + search.phone + '%\') OR (v.groomMobile LIKE \'%' + search.phone + '%\'))';
//  } else if (search.id == '' && search.phone == '') {
//    str +=  '((v.brideName LIKE \'%' + search.name + '%\') OR (v.groomName LIKE \'%' + search.name + '%\'))' + ' OR ' + '((v.brideEmail LIKE \'%' + search.email + '%\') OR (v.groomEmail LIKE \'%' + search.email + '%\'))';
//  } else if (search.id == '') {
//    str +=  '((v.brideName LIKE \'%' + search.name + '%\') OR (v.groomName LIKE \'%' + search.name + '%\'))' + ' OR ' + '((v.bridePhone LIKE \'%' + search.phone + '%\') OR (v.brideMobile LIKE \'%' + search.phone + '%\') OR (v.groomPhone LIKE \'%' + search.phone + '%\') OR (v.groomMobile LIKE \'%' + search.phone + '%\'))' + ' OR ' + '((v.brideEmail LIKE \'%' + search.email + '%\') OR (v.groomEmail LIKE \'%' + search.email + '%\'))';
//  } else if (search.phone == '') {
//    str +=  '((v.e_oid=\'' + search.id + '\'))' + ' OR ' + '((v.brideName LIKE \'%' + search.name + '%\') OR (v.groomName LIKE \'%' + search.name + '%\'))' + ' OR ' + '((v.brideEmail LIKE \'%' + search.email + '%\') OR (v.groomEmail LIKE \'%' + search.email + '%\'))';
//  } else if (search.name == '') {
//    str +=  '((v.e_oid=\'' + search.id + '\'))' + ' OR ' + '((v.brideEmail LIKE \'%' + search.email + '%\') OR (v.groomEmail LIKE \'%' + search.email + '%\'))' + ' OR ' + '((v.bridePhone LIKE \'%' + search.phone + '%\') OR (v.brideMobile LIKE \'%' + search.phone + '%\') OR (v.groomPhone LIKE \'%' + search.phone + '%\') OR (v.groomMobile LIKE \'%' + search.phone + '%\'))';
//  } else if (search.email == '') {
//    str +=  '((v.e_oid=\'' + search.id + '\'))' + ' OR ' + '((v.brideName LIKE \'%' + search.name + '%\') OR (v.groomName LIKE \'%' + search.name + '%\'))' + ' OR ' + '((v.bridePhone LIKE \'%' + search.phone + '%\') OR (v.brideMobile LIKE \'%' + search.phone + '%\') OR (v.groomPhone LIKE \'%' + search.phone + '%\') OR (v.groomMobile LIKE \'%' + search.phone + '%\'))';
//  } else {
//    str +=  '((v.e_oid=\'' + search.id + '\'))' + ' OR ' + '((v.brideName LIKE \'%' + search.name + '%\') OR (v.groomName LIKE \'%' + search.name + '%\'))' + ' OR ' + '((v.bridePhone LIKE \'%' + search.phone + '%\') OR (v.brideMobile LIKE \'%' + search.phone + '%\') OR (v.groomPhone LIKE \'%' + search.phone + '%\') OR (v.groomMobile LIKE \'%' + search.phone + '%\'))' + ' OR ' + '((v.brideEmail LIKE \'%' + search.email + '%\') OR (v.groomEmail LIKE \'%' + search.email + '%\'))';
//  }
  
  if (str != '') {
    str += ' AND ';
  } else {
    if (!search.createdDateTo && !search.createdDateFrom && !search.weddingDayTo && !search.weddingDayFrom) {
      str += '';
    } else {
      str += '1 = 0 AND ';
    }
  }
  
  if (search.inProgressingOnly && search.succeeded && search.failed && search.deleted) {
    str += '((v.status = 0) OR (v.status = 1) OR (v.status = -1) OR (v.status = -2))';
  } else if (search.inProgressingOnly && search.succeeded && search.failed) {
    str += '((v.status = 0) OR (v.status = 1) OR (v.status = -1))';
  } else if (search.inProgressingOnly && search.succeeded && search.deleted) {
    str += '((v.status = 0) OR (v.status = 1) OR (v.status = -2))';
  } else if (search.inProgressingOnly && search.failed && search.deleted) {
    str += '((v.status = 0) OR (v.status = -1) OR (v.status = -2))';
  } else if (search.succeeded && search.failed && search.deleted) {
    str += '((v.status = 1) OR (v.status = -1) OR (v.status = -2))';
  } else if (search.inProgressingOnly && search.succeeded) {
    str += '((v.status = 0) OR (v.status = 1))';
  } else if (search.inProgressingOnly && search.failed) {
    str += '((v.status = 0) OR (v.status = -1))';
  } else if (search.inProgressingOnly && search.deleted) {
    str += '((v.status = 0) OR (v.status = -2))';
  } else if (search.succeeded && search.failed) {
    str += '((v.status = 1) OR (v.status = -1))';
  } else if (search.succeeded && search.deleted) {
    str += '((v.status = 1) OR (v.status = -2))';
  } else if (search.failed && search.deleted) {
    str += '((v.status = -1) OR (v.status = -2))';
  } else if (search.inProgressingOnly) {
    str += '(v.status = 0)';
  }  else if (search.succeeded) {
    str += '(v.status = 1)';
  } else if (search.failed) {
    str += '(v.status = -1)';
  } else if (search.deleted) {
    str += '(v.status = -2)';
  } else {
    str += '1=0';
  }
  
  return str;
};

HandleVisitors.prototype._changeDate = function(label, currentDate, onChangeFunc, showTime) {
  var _self = this;
  this._wContainer = document.createElement('div');
  this._wContainer.style.left = DOMUtils.findPos(label)[0] + 'px';
  this._wContainer.style.top = DOMUtils.findPos(label)[1] + 'px';
  this._popupBox = new ModulePopupBoxSimple(document, document.body, null, null, null, null, { pos: DOMUtils.findPos(label)});
  this._popupBox._gui.panel.appendChild(this._wContainer);
  
  var ds = new DateSelect(currentDate, null, { container: this._wContainer, showTime: showTime });
  ds._selectFunc = function(sd) { _self._selectDate.call(_self, sd, label, onChangeFunc, showTime); };
};

HandleVisitors.prototype._selectDate = function(sd, label, onChangeFunc, showTime) {
  
  onChangeFunc(sd);
  this._showDate(sd, label, showTime);
  this._popupBox._close();
};

HandleVisitors.prototype._showDate = function(sd, label, showTime) {
  if (sd) { 
    label.value = SimpleDate.format(sd, showTime);
  } else {
    label.value = '';
  }
};