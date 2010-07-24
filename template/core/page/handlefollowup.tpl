function HandleFollowUp(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._order = (options && options.order) ? options.order : null;
  this._query = (options && options.query) ? options.query : 'DESC';
  
  this._createElements();
}

HandleFollowUp.prototype._createElements = function() {
  this._gui.visitors.appendChild(DOMUtils.getLoadingImage());
  this._loadData();
};

HandleFollowUp.prototype._loadData = function() {
  this._visitors = null;
  this._parameters = null;
  this._retrieveVisitors(1);
};

HandleFollowUp.prototype._verifyData = function() {
  if (this._visitors) {
    this._updateElements();
  }
};

HandleFollowUp.prototype._retrieveVisitors = function(page, condition, datefrom, dateto, from, to, pos) { 
  var _self = this;
  var args = ((condition) ?  '&c=' + encodeURIComponent(condition) : '') + '&p=' + page + '&s={{$smarty.const.SIZE|escape:'javascript'}}' + ((datefrom) ?  '&datefrom=' + datefrom : '') + ((dateto) ?  '&dateto=' + dateto : '') + ((from) ?  '&from=' + from : '') + ((to) ?  '&to=' + to : '') + ((this._order) ?  '&o=' + this._order : '') + ((this._query) ?  '&q=' + this._query : '');
  new RequestUtils()._mysql('visitors', args, function(result, params) { _self._visitors = result.data; 
                                                                         _self._parameters = result;
                                                                         _self._verifyData.call(_self);
                                                                       }, { pos: (pos) ? pos : null });
};

HandleFollowUp.prototype._updateElements = function() {
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
};
