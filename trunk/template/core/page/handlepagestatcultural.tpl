function HandlePageStatCultural(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options
  this._search = { dateFrom: '',
                   dateTo: ''
                 };
  this._createElements();
};

HandlePageStatCultural.prototype._createElements = function() {
  var _self = this;
  
  tr = this._gui.detail.cultureTable.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.backgroundColor = '#fff';
  td.colSpan = 3;
  td.appendChild(DOMUtils.getLoadingImage());
  
  this._loadData();
};

HandlePageStatCultural.prototype._loadData = function() {
  this._results = null;
  this._dateZones = null;
  this._retrieveResults(1);
  this._retrieveDateZones();
};

HandlePageStatCultural.prototype._verifyData = function() {
  if (this._results && this._dateZones) {
    this._updateElements();
  }
};

HandlePageStatCultural.prototype._retrieveResults = function(page, condition, from, to) {
  var _self = this;
  var args = ((condition) ?  '&c=' + condition : '') + '&p=' + page + ((from) ?  '&from=' + from : '') + ((to) ?  '&to=' + to : '');
  new RequestUtils()._mysql('statsculture', args, function(result, params) { _self._results = result;
                                                                               _self._verifyData.call(_self);
                                                                             }, null);
};

HandlePageStatCultural.prototype._retrieveDateZones = function() {
  var _self = this;
  new RequestUtils()._read('pz_datezone', null, 'd.page=\'' + this._options.template + '\'', null, null, null, null, function(result, params) { _self._dateZones = result.data;
                                                                                                                                            _self._verifyData.call(_self);
                                                                                                                                          }, null);
};

HandlePageStatCultural.prototype._updateElements = function() {
  var _self = this;
  POZVFSUtils.clear(this._gui.dateZone);
  DOMUtils.removeChildElements(this._gui.detail.total);
  DOMUtils.removeTableRows(this._gui.detail.cultureTable, 1);
  ChartUtils.source(this._gui.detail.graph, this._results);
  
  var total = 0;
  /*--main table--*/
  if (this._results.length == 0) {
    tr = this._gui.detail.cultureTable.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    td.style.height = '24px';
    td.colSpan = 3;
    td.appendChild(document.createTextNode('N/A'));
  }
  for (var i = 0, il = this._results.length; i < il; i++) {
    var result = this._results[i];
    total += parseFloat(result.value, 10);
    tr = this._gui.detail.cultureTable.insertRow(-1);
    td = tr.insertCell(-1);
    td.className = 'elemstatsource_td16';
    td.appendChild(document.createTextNode(result.name));
    td = tr.insertCell(-1);
    td.className = 'elemstatsource_td13';
    td.appendChild(document.createTextNode(result.value));
  }
  this._gui.detail.total.appendChild(document.createTextNode(total));
  
  /*--DATE ZONE----*/
  this._dateZone = { created: '',
                     to: ''
                   };
  this._gui.dateZone.dateCreated.value = (this._dateZone.created) ? SimpleDate.format(this._dateZone.created) : '';
  this._gui.dateZone.dateCreated.onclick = function() { var context = this;
                                                        _self._changeDate.call(_self, this, _self._dateZone.created, function(sd) { _self._dateZone.created = sd; context.focus(); }, false);
                                                   return false;
                                                 };
  this._gui.dateZone.dateTo.value = (this._dateZone.to) ? SimpleDate.format(this._dateZone.to) : '';
  this._gui.dateZone.dateTo.onclick = function() { var context = this;
                                                   _self._changeDate.call(_self, this, _self._dateZone.to, function(sd) { _self._dateZone.to = sd; context.focus(); }, false);
                                                   return false;
                                                   };
  this._gui.dateZone.create.onclick = function() { if (_self._dateZone.created &&_self._dateZone.to) {
                                                     var date = pz_datezone.instance();
                                                     date.start = _self._dateZone.created;
                                                     date.end = _self._dateZone.to;
                                                     date.page = _self._options.template;
                                                     new RequestUtils()._write('pz_datezone', [date], [], function(date, params) { _self._retrieveDateZones.call(_self);}, DOMUtils.findPos(this));
                                                   } else {
                                                     window.alert('DATE CAN NOT BE EMPTY');
                                                   }
                                                 };
  var table = document.createElement('table');
  table.style.width = '166px';
  table.cellPadding = 0;
  table.cellSpacing = 0;
  this._gui.dateZone.result.appendChild(table);
  for (var i = 0, il = this._dateZones.length; i < il; i++) {
    var date = this._dateZones[i];
    tr = table.insertRow(-1);
    tr.className = (tr.rowIndex % 2 == 0) ? 'rowodd' : 'roweven';
    td = tr.insertCell(-1);
    td.style.width = '146px';
    td.style.height = '20px';
    td.style.textAlign = 'center';
    var a = document.createElement('a');
    a.href = '#';
    a._date = date;
    a.appendChild(document.createTextNode(SimpleDate.format(date.start) + ' - ' + SimpleDate.format(date.end)));
    a.onclick = function() { _self._search.dateFrom = this._date.start;
                             _self._search.dateTo = this._date.end;
                             _self._retrieveResults.call(_self, 1, '1=1', JSON.stringify(this._date.start), JSON.stringify(this._date.end));
                             return false;
                           };
    td.appendChild(a);
    td = tr.insertCell(-1);
    td.style.width = '20px';
    td.style.textAlign = 'center';
    var span = document.createElement('span');
    span.appendChild(document.createTextNode('(x)'));
    span.style.cursor = 'pointer';
    span._date = date;
    span.onclick = function() { new RequestUtils()._write('datezone', [], [this._date], function(date, params) { _self._retrieveDateZones.call(_self);}, null);
                              };
    td.appendChild(span);
  }
  
  this._customerSearch(this._gui, function(condition, from, to) { _self._retrieveResults.call(_self, 1, condition, from, to); 
                                                                });
};

HandlePageStatCultural.prototype._customerSearch = function(gui, callbackFunc) {
  var _self = this;
  this._callbackFunc = callbackFunc;

  gui.search.dateCreated.value = (this._search.dateFrom) ? SimpleDate.format(this._search.dateFrom) : '';
  gui.search.dateCreated.onclick = function() { var context = this;
                                                _self._changeDate.call(_self, this, _self._search.dateFrom, function(sd) { _self._search.dateFrom = sd; context.focus(); }, false);
                                                return false;
                                              };
  gui.search.dateCreated.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                                    if (code == 13) {
                                                      _self._callbackFunc.call(_self, '1=1', (_self._search.dateFrom) ? JSON.stringify(_self._search.dateFrom) : null, (_self._search.dateTo) ? JSON.stringify(_self._search.dateTo) : null);
                                                    }
                                                  };
  gui.search.dateTo.value = (this._search.dateTo) ? SimpleDate.format(this._search.dateTo) : '';
  gui.search.dateTo.onclick = function() { var context = this;
                                           _self._changeDate.call(_self, this, _self._search.dateTo, function(sd) { _self._search.dateTo = sd; context.focus(); }, false);
                                           return false;
                                         };
  gui.search.dateTo.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                               if (code == 13) {
                                                 _self._callbackFunc.call(_self, '1=1', (_self._search.dateFrom) ? JSON.stringify(_self._search.dateFrom) : null, (_self._search.dateTo) ? JSON.stringify(_self._search.dateTo) : null);
                                               }
                                             };
 gui.search.search.onclick = function() { _self._callbackFunc.call(_self, '1=1', (_self._search.dateFrom) ? JSON.stringify(_self._search.dateFrom) : null, (_self._search.dateTo) ? JSON.stringify(_self._search.dateTo) : null); };
};

HandlePageStatCultural.prototype._changeDate = function(label, currentDate, onChangeFunc, showTime) {
  var _self = this;
  this._wContainer = document.createElement('div');
  this._wContainer.style.left = DOMUtils.findPos(label)[0] + 'px';
  this._wContainer.style.top = DOMUtils.findPos(label)[1] + 'px';
  this._popupBox._open(this._wContainer, { pos: DOMUtils.findPos(label) });
  
  var ds = new DateSelect(currentDate, null, { container: this._wContainer, showTime: showTime });
  ds._selectFunc = function(sd) { _self._selectDate.call(_self, sd, label, onChangeFunc, showTime); };
};

HandlePageStatCultural.prototype._selectDate = function(sd, label, onChangeFunc, showTime) {
  
  onChangeFunc(sd);
  this._showDate(sd, label, showTime);
  this._popupBox._close();
};

HandlePageStatCultural.prototype._showDate = function(sd, label, showTime) {
  if (sd) { 
    label.value = SimpleDate.format(sd, showTime);
  } else {
    label.value = '';
  }
};