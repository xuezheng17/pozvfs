function HandleStatistics(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._search = { dateFrom: '',
                   dateTo: ''
                 };
  this._createElements();
}

HandleStatistics.prototype._createElements = function() {
  this._loadData();
};

HandleStatistics.prototype._loadData = function() {
  this._visitor = null;
  this._dateZones = null;
  this._retrieveVisitor(1);
  this._retrieveDateZones();
};

HandleStatistics.prototype._verifyData = function() {
  if (this._visitor && this._dateZones) {
    this._updateElements();
  }
};

HandleStatistics.prototype._retrieveVisitor = function(page, condition, from, to) { 
  var _self = this;
  var args = ((condition) ? '&c=' + condition : '') + '&p=' + page + '&s=99999' + '&from=' + ((from) ? from : '' ) + '&to=' + ((to) ? to : '');
  new RequestUtils()._mysql('statistics', args, function(result, params) { _self._visitor = result.data[0];
                                                                           _self._verifyData.call(_self);
                                                                         }, null);
};

HandleStatistics.prototype._retrieveDateZones = function() {
  var _self = this;
  new RequestUtils()._read('pz_datezone', null, 'd.page=\'' + this._options.template + '\'', null, null, null, null, function(result, params) { _self._dateZones = result.data;
                                                                                                                                                _self._verifyData.call(_self);
                                                                                                                                              }, null);
};

HandleStatistics.prototype._updateElements = function() {
  var unique, _self = this;
  POZVFSUtils.clear(this._gui.mains);
  DOMUtils.removeTableRows(this._gui.dateZone.result, 1);
  
  this._gui.mains.visitors.appendChild(document.createTextNode(this._visitor.visitors));
  this._gui.mains.visit.appendChild(document.createTextNode(this._visitor.visited + ((this._visitor.visitors != 0) ? ' (' + ((this._visitor.visited / this._visitor.visitors) * 100).toFixed(0) + '%)' : ' (0%)')));
  this._gui.mains.noVisit.appendChild(document.createTextNode(this._visitor.nonvisited + ((this._visitor.visitors != 0) ? ' (' + ((this._visitor.nonvisited / this._visitor.visitors) * 100).toFixed(0) + '%)' : ' (0%)')));
  
  ChartUtils.statistics(this._gui.mains.graphy, this._visitor);
  
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

  if (this._dateZones.length == 0) {
    tr = this._gui.dateZone.result.insertRow(-1);
    td = tr.insertCell(-1);
    td.colSpan = 2;
    td.style.height = '24px';
    td.style.textAlign = 'center';
    td.appendChild(document.createTextNode('Empty'));
  }
  
  for (var i = 0, il = this._dateZones.length; i < il; i++) {
    var date = this._dateZones[i];
    tr = this._gui.dateZone.result.insertRow(-1);
    tr.style.backgroundColor = (tr.rowIndex % 2 == 0) ? '#f5f5f5' : '#ffffff';
    td = tr.insertCell(-1);
    td.style.height = '24px';
    td.style.textAlign = 'left';
    td.style.padding = '0 0 0 10px';
    var a = document.createElement('a');
    a.href = '#';
    a._date = date;
    a.appendChild(document.createTextNode(SimpleDate.format(date.start) + ' - ' + SimpleDate.format(date.end)));
    a.onclick = function() { _self._search.dateFrom = this._date.start;
                             _self._search.dateTo = this._date.end;
                             _self._retrieveVisitor.call(_self, 1, '', JSON.stringify(this._date.start), JSON.stringify(this._date.end)); 
                             return false;
                           };
    td.appendChild(a);
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    var span = document.createElement('img');
    span.src = 'image/delete.png';
    span.style.cursor = 'pointer';
    span._date = date;
    span.onclick = function() { new RequestUtils()._write('pz_datezone', [], [this._date], function(date, params) { _self._retrieveDateZones.call(_self);}, null);
                              };
    td.appendChild(span);
  }

  this._visitorSearch(this._gui, function(condition, from, to) { _self._retrieveVisitor.call(_self, 1, condition, from, to); });
};

HandleStatistics.prototype._visitorSearch = function(gui, callbackFunc) {
  var _self = this;
  this._callbackFunc = callbackFunc;
  
  gui.search.dateCreated.value = (this._search.dateFrom) ? SimpleDate.format(this._search.dateFrom) : '';
  gui.search.dateCreated.onclick = function() { var context = this;
                                                _self._changeDate.call(_self, this, _self._search.dateFrom, function(sd) { _self._search.dateFrom = sd; context.focus(); }, false);
                                                return false;
                                              };
  gui.search.dateCreated.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                                    if (code == 13) {
                                                      _self._callbackFunc.call(_self, '', (_self._search.dateFrom) ? JSON.stringify(_self._search.dateFrom) : null, (_self._search.dateTo) ? JSON.stringify(_self._search.dateTo) : null);
                                                    }
                                                  };
  gui.search.dateTo.value = (this._search.dateTo) ? SimpleDate.format(this._search.dateTo) : '';
  gui.search.dateTo.onclick = function() { var context = this;
                                           _self._changeDate.call(_self, this, _self._search.dateTo, function(sd) { _self._search.dateTo = sd; context.focus(); }, false);
                                           return false;
                                         };
  gui.search.dateTo.onkeypress = function(e) { var code = DOMUtils.getEventCode(e);
                                               if (code == 13) {
                                                 _self._callbackFunc.call(_self, '', (_self._search.dateFrom) ? JSON.stringify(_self._search.dateFrom) : null, (_self._search.dateTo) ? JSON.stringify(_self._search.dateTo) : null);
                                               }
                                             };
 gui.search.search.onclick = function() { _self._callbackFunc.call(_self, '', (_self._search.dateFrom) ? JSON.stringify(_self._search.dateFrom) : null, (_self._search.dateTo) ? JSON.stringify(_self._search.dateTo) : null); };
};

/* 
 * 修改日期1Change
 */
HandleStatistics.prototype._changeDate = function(label, currentDate, onChangeFunc, showTime) {
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
HandleStatistics.prototype._selectDate = function(sd, label, onChangeFunc, showTime) {
  onChangeFunc(sd);
  this._showDate(sd, label, showTime);
  this._popupBox._close();
};
/* 
 * 修改日期3Show
 */
HandleStatistics.prototype._showDate = function(sd, label, showTime) {
  if (sd) { 
    label.value = SimpleDate.format(sd, showTime);
  } else {
    label.value = '';
  }
};