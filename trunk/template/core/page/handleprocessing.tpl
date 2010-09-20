function HandleProcessing(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._cont = (options && options.follow) ? options.follow : 0;
  if (this._cont == 1) {
    this._conc = ' AND v.isVisited = 1';
  } else if (this._cont == 2) {
    this._conc = ' AND v.isVisited = 0' ;
  }
  
  this._popupBox = new ModulePopupBoxSimple(document, document.body, null, null, null, null, null);
  this._popupBox._close();
  
  this._createElements();
}

HandleProcessing.prototype._createElements = function() {
  var _self = this;
  
  tr = this._gui.mains.insertRow(-1);
  td = tr.insertCell(-1);
  td.colSpan = 7;
  td.appendChild(DOMUtils.getLoadingImage());
 
  this._loadData();
};

HandleProcessing.prototype._loadData = function() {
  this._visitors = null;
  this._parameters = null;
  this._retrieveVisitors(1);
};

HandleProcessing.prototype._verifyData = function() {
  if (this._visitors) {
    this._updateElements();
  }
};

HandleProcessing.prototype._retrieveVisitors = function(page, order, queue, condition, cond, pos) { 
  var _self = this;
  if (condition) {
    var tmp = condition.indexOf('WHERE');
    condition = condition.substr((tmp != -1) ? tmp + 6 : 0);
  }
  var args = 'c=LEFT JOIN np_pz_operation AS o ON o.visitId = v.e_oid WHERE v.status = 0' + this._conc + ((condition) ? ' AND ' + condition : '') + '&p=' + page + '&s=20' + '&o=' + ((order) ? order : 'v.e_oid' ) + '&q=' + ((queue) ? queue : 'DESC') + '&con=' + ((cond) ? cond : '');
  new RequestUtils()._mysql('processing', args, function(result, params) { _self._visitors = result.data;
                                                                           _self._parameters = result;
                                                                           _self._verifyData.call(_self);
                                                                         }, { pos: pos });
};

HandleProcessing.prototype._updateElements = function() {
  var unique, _self = this;
  DOMUtils.removeChildElements(this._gui.page);
  DOMUtils.removeTableRows(this._gui.mains, 1);
  
  if (this._parameters.total > this._parameters.size) {
    new ModulePagination(document, this._gui.page, 500, 50, this._operator, this._now, {page: this._parameters.page, total: this._parameters.total, limit: this._parameters.size, callbackFunc: function(page, order, queue, condition) { _self._retrieveVisitors.call(_self, page, _self._parameters.order, _self._parameters.queue, _self._parameters.condition); }, context: this});
  }
  
  this._queue = !this._queue;
  this._gui.visitNo.onclick = function() { _self._retrieveVisitors.call(_self, _self._parameters.page, 'v.e_oid', (_self._queue) ? 'ASC' : 'DESC', _self._parameters.condition); };
  this._gui.brideName.onclick = function() { _self._retrieveVisitors.call(_self, _self._parameters.page, 'v.brideName', (_self._queue) ? 'ASC' : 'DESC', _self._parameters.condition); };
  this._gui.groomName.onclick = function() { _self._retrieveVisitors.call(_self, _self._parameters.page, 'v.groomName', (_self._queue) ? 'ASC' : 'DESC', _self._parameters.condition); };
  this._gui.visited.onclick = function() { _self._retrieveVisitors.call(_self, _self._parameters.page, 'v.isVisited', (_self._queue) ? 'ASC' : 'DESC', _self._parameters.condition); };
  this._gui.weddingDay.onclick = function() { _self._retrieveVisitors.call(_self, _self._parameters.page, 'v.weddingDay', (_self._queue) ? 'ASC' : 'DESC', _self._parameters.condition); };
  this._gui.lastUpdated.onclick = function() { _self._retrieveVisitors.call(_self, _self._parameters.page, 'o.operatedDate', (_self._queue) ? 'ASC' : 'DESC', _self._parameters.condition); };
  this._gui.number.onclick = function() { _self._retrieveVisitors.call(_self, _self._parameters.page, ' COUNT(o.e_oid) ', (_self._queue) ? 'ASC' : 'DESC', _self._parameters.condition, ' AND o.cancelled = 0 Group By v.e_oid' ); };
  
  if (this._visitors.length == 0) {
    tr = this._gui.mains.insertRow(-1);
    td = tr.insertCell(-1);
    td.colSpan = 7;
    td.style.textAlign = 'center';
    td.style.fontWeight = 'bold';
    td.appendChild(document.createTextNode('No Result Matches'));
  }

  for (var i = 0, il = this._visitors.length; i < il; i++) {
    var tmp = this._visitors[i];
    
    var visit = 0; noVisit = 0; noExist = 0;
    var id = 0;
    for (var k = 0, kl = tmp.operations.length; k < kl; k++) {
      var operation = tmp.operations[k];
      if (operation.cancelled) {
        continue;
      }
      var type = (operation.operateType.substring(0, operation.operateType.indexOf(' ('))).toLowerCase();
      if (type == 'visit' || operation.operateType == 'Custom Note') {
        noExist++;
      }
      if (operation.firstVisited) {
        id = operation.id;
      }
    }
    var before = []; after = [];
    for (var j = 0, jl = tmp.operations.length; j < jl; j++) {
      var operation = tmp.operations[j];
      var type = (operation.operateType.substring(0, operation.operateType.indexOf(' ('))).toLowerCase();
      if (operation.cancelled || type == 'visit') {
        continue;
      }
      if (id != 0) {
        if (parseInt(operation.id) < parseInt(id)) {
          before[before.length] = operation;
        } else if (parseInt(operation.id) > parseInt(id)){
          after[after.length] = operation;
        }
      }
    }
    
    tr = this._gui.mains.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.height = '24px';
    td.style.textAlign = 'center';
    td.style.verticalAlign = 'middle';
    var a = document.createElement('a');
    a.href = '?t=visitorexist&m=' + MiscUtils.encode({a: 2, b: this._cont}) + '&opts=' + MiscUtils.encode({id: tmp.id, menu: 2, cont: this._cont});
    a.appendChild(document.createTextNode(POZVFSUtils.visitorId(tmp.id)));
    td.appendChild(a);
    
    td = tr.insertCell(-1);
    td.style.padding = '0 0 0 5px';
    td.style.textAlign = 'left';
    td.style.verticalAlign = 'middle';
    td.style.whiteSpace = 'nowrap';
    td.appendChild(document.createTextNode(tmp.brideName));
    td = tr.insertCell(-1);
    td.style.whiteSpace = 'nowrap';
    td.style.padding = '0 0 0 5px';
    td.style.textAlign = 'left';
    td.style.whiteSpace = 'nowrap';
    td.appendChild(document.createTextNode(tmp.brideName));
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    td.appendChild(document.createTextNode((tmp.isVisited) ? 'YES' : 'NO'));
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    td.appendChild(document.createTextNode((tmp.weddingDay) ? SimpleDate.format(tmp.weddingDay) : 'Unknow'));
    
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    td.appendChild(document.createTextNode((tmp.operations.length == 0) ? SimpleDate.format(tmp.createdDate) : SimpleDate.format(tmp.operations[0].operatedDate)));
    
    
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    td.style.whiteSpace = 'nowrap';
    var span = document.createElement('span');
    if (tmp.firstVisitMethod == '{{$smarty.const.Visitor_Method_Visitor|escape:'javascript'}}') {
      if (tmp.operations.length - noExist == 0) {
        span.style.color = '#ff0000';
        span.appendChild(document.createTextNode((tmp.operations.length - noExist)));
        td.appendChild(span);
        span = document.createElement('span');
        span.style.color = '#cc66cc';
        span.appendChild(document.createTextNode(' ( 0 ) '));
        td.appendChild(span);
      } else {
        span.style.color = '#009900';
        span.appendChild(document.createTextNode((tmp.operations.length - noExist)));
        td.appendChild(span);
        span = document.createElement('span');
        span.style.color = '#66cc66';
        span.appendChild(document.createTextNode(' ( 0 ) '));
        td.appendChild(span);
      }
    } else {
      if (tmp.operations.length == 0) {
        span = document.createElement('span');
        span.style.color = '#FF0000';
        span.appendChild(document.createTextNode('None'));
        td.appendChild(span);
      } else {
        if (tmp.isVisited) {
          span.style.color = (after.length == 0) ? '#ff0000' : '#009900';
          span.appendChild(document.createTextNode(after.length));
          td.appendChild(span);
          span = document.createElement('span');
          span.style.color = (after.length == 0) ? '#cc66cc' : '#66cc66';
          span.appendChild(document.createTextNode(' ( ' + before.length + ' ) '));
          td.appendChild(span);
        } else {
          span.style.color = '#009900';
          span.appendChild(document.createTextNode((tmp.operations.length)));
          td.appendChild(span);
        }
      }
    }
    td = tr.insertCell(-1);
    td.style.padding = '0 0 0 5px';
    td.style.whiteSpace = 'nowrap';
    td.style.textAlign = 'left';
    td.appendChild(document.createTextNode(((tmp.note && tmp.note.length > 75) ? tmp.note.substring(0,75) + '...' : tmp.note)));
    if (tmp.note && tmp.note.length > 75) {
      var a = document.createElement('a');
      a.href = '#';
      a.appendChild(document.createTextNode('more'));
      a._note = tmp.note;
      a.onclick = function() { var pos, func1;
                               pos = DOMUtils.findPos(this);
                               func1 = function() { _self._popupBox._close(); };
                               _self._popupBox._position = pos;
                               _self._popupBox._container = document.body;
                               _self._popupBox._createElements();
                               var span = MiscUtils.span(this._note);
                               MiscUtils.dialog(_self._popupBox, span, func1);
                             };
      td.appendChild(a);
    }
  }
};
