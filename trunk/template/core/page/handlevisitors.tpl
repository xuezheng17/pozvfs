function HandleVisitors(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._search = POZVFSUtils.search();
  
  this._createElements();
}

HandleVisitors.prototype._createElements = function() {
  this._gui.visitors.appendChild(DOMUtils.getLoadingImage());
  this._loadData();
};

HandleVisitors.prototype._loadData = function() {
  this._visitors = null;
  this._parameters = null;
  this._retrieveVisitors(1);
};

HandleVisitors.prototype._verifyData = function() {
  if (this._visitors) {
    this._updateElements();
  }
};

HandleVisitors.prototype._retrieveVisitors = function(page, condition, datefrom, dateto, from, to, pos) { 
  var _self = this;
  var args = ((condition) ?  '&c=' + encodeURIComponent(condition) : '') + '&p=' + page + '&s={{$smarty.const.SIZE|escape:'javascript'}}' + ((datefrom) ?  '&datefrom=' + datefrom : '') + ((dateto) ?  '&dateto=' + dateto : '') + ((from) ?  '&from=' + from : '') + ((to) ?  '&to=' + to : '');
  new RequestUtils()._mysql('visitors', args, function(result, params) { _self._visitors = result.data; 
                                                                         _self._parameters = result;
                                                                         _self._verifyData.call(_self);
                                                                       }, { pos: (pos) ? pos : null });
};

HandleVisitors.prototype._updateElements = function() {
  var unique, _self = this;
  DOMUtils.removeChildElements(this._gui.page);
  DOMUtils.removeChildElements(this._gui.visitors);
  Pagination.makePagedResults(this._gui.page, this._parameters.page, this._parameters.total, this._parameters.size, function(page, condition) { _self._retrieveVisitors.call(_self, page, _self._parameters.condition); }, this, document);

  var table = document.createElement('table');
  this._gui.visitors.appendChild(table);
  
  if (this._visitors.length == 0) {
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    td.appendChild(document.createTextNode('Empty'));
  }

//  for (var i = 0, il = this._visitors.length; i < il; i++) {
//    var tmp = this._visitors[i];
//    tr = table.insertRow(-1);
//    td = tr.insertCell(-1);
//    new ModuleVisitorResult(document, td, 980, 60, this._operator, this._now, { item: tmp } );
//  }
  this._visitorSearch(this._gui, function(condition, datefrom, dateto, from, to, pos) { _self._retrieveVisitors.call(_self, 1, condition, datefrom, dateto, from, to, pos); });
};

HandleVisitors.prototype._visitorSearch = function(gui, callbackFunc) {
  var _self = this;
  this._callbackFunc = callbackFunc;
  
  gui.visitorNo.value = this._search.id;
  gui.visitorNo.onkeydown = function() { _self._search.id = this.value; };
  gui.visitorNo.onchange = function() { _self._search.id = this.value; };
  
  gui.name.value = this._search.name;
  gui.name.onkeydown = function() { _self._search.name = this.value; };
  gui.name.onchange = function() { _self._search.name = this.value; };
  
  gui.phone.value = this._search.phone;
  gui.phone.onkeydown = function() { _self._search.phone = this.value; };
  gui.phone.onchange = function() { _self._search.phone = this.value; };
  
  gui.email.value = this._search.phone;
  gui.email.onkeydown = function() { _self._search.email = this.value; };
  gui.email.onchange = function() { _self._search.email = this.value; };
  
  gui.weddingDayFrom.value = (this._search.weddingDayFrom) ? SimpleDate.format(this._search.weddingDayFrom) : '';
  gui.weddingDayFrom.onclick = function() { var context = this;
                                            _self._changeDate.call(_self, this, _self._search.weddingDayFrom, function(sd) { _self._search.weddingDayFrom = sd; context.focus();}, false);
                                            return false;
                                          };
  gui.weddingDayTo.value = (this._search.weddingDayTo) ? SimpleDate.format(this._search.weddingDayTo) : '';
  gui.weddingDayTo.onclick = function() { var context = this;
                                          _self._changeDate.call(_self, this, _self._search.weddingDayTo, function(sd) { _self._search.weddingDayTo = sd; context.focus();}, false);
                                          return false;
                                        };
  gui.createdDateFrom.value = (this._search.createdDateFrom) ? SimpleDate.format(this._search.createdDateFrom) : '';
  gui.createdDateFrom.onclick = function() { var context = this;
                                             _self._changeDate.call(_self, this, _self._search.createdDateFrom, function(sd) { _self._search.createdDateFrom = sd; context.focus(); }, false);
                                             return false;
                                           };
                                                      
  gui.createdDateTo.value = (this._search.createdDateTo) ? SimpleDate.format(this._search.createdDateTo) : '';
  gui.createdDateTo.onclick = function() { var context = this;
                                           _self._changeDate.call(_self, this, _self._search.createdDateTo, function(sd) { _self._search.createdDateTo = sd; context.focus(); }, false);
                                           return false;
                                         };

  gui.inProgressingOnly.defaultChecked = this._search.inProgressingOnly;
  gui.inProgressingOnly.onclick = function() { _self._search.inProgressingOnly = this.checked; };

  gui.search.onclick = function() { _self._callbackFunc.call(_self, _self._toString(_self._search), (_self._search.weddingDayFrom) ? JSON.stringify(_self._search.weddingDayFrom) : null, (_self._search.weddingDayTo) ? JSON.stringify(_self._search.weddingDayTo) : null, (_self._search.createdDateFrom) ? JSON.stringify(_self._search.createdDateFrom) : null, (_self._search.createdDateTo) ? JSON.stringify(_self._search.createdDateTo) : null, DOMUtils.findPos(this)); };
};

HandleVisitors.prototype._toString = function(search) {
  var str = 'WHERE ';
  
  str += (search.name == '') ? '1 = 1' : '((v.brideName LIKE \'%' + search.name + '%\') OR (v.groomName LIKE \'%' + search.name + '%\'))';
  str += (search.phone == '') ? '' : ' AND ((v.bridePhone LIKE \'%' + search.phone + '%\') OR (v.brideMobile LIKE \'%' + search.phone + '%\') OR (v.groomPhone LIKE \'%' + search.phone + '%\') OR (v.groomMobile LIKE \'%' + search.phone + '%\'))';
  
  str += (search.id == '') ? '' : ((isNaN(search.id)) ? ' AND 1 = 0' : ' AND (v.e_oid=\'' + search.id + '\')');
  
  if (search.inProgressingOnly) {
    str += ' AND v.status = 1';
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