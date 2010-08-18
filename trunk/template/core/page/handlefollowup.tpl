function HandleFollowUp(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._cont = (options && options.follow) ? options.follow : 0;
  
  if (this._cont == 1) {
    this._con = ' AND v.isVisited = 1';
  } else if (this._cont == 2) {
    this._con = ' AND v.isVisited = 0' ;
  }
  
  this._sort = '';
  this._createElements();
}

HandleFollowUp.prototype._createElements = function() {
  this._gui.visitors.appendChild(DOMUtils.getLoadingImage());
  var _self = this;

  for (var i = 0, il = SortMethod.array().length; i < il; i++) {
    var method = SortMethod.array()[i];
    var option = new Option(method);
    this._gui.sort.options[this._gui.sort.options.length] = option;
    if (option.text == this._sort) {
      this._gui.sort.selectedIndex = this._gui.sort.options.length - 1;
    }
  }
  if (SortMethod.array().length > 0) {
    if (this._gui.sort.options[this._gui.sort.selectedIndex].text == '{{$smarty.const.Sort_Method_Last_Updated|escape:'javascript'}}') {
      _self._order = 'o.operatedDate';
    } else if (this._gui.sort.options[this._gui.sort.selectedIndex].text == '{{$smarty.const.Sort_Method_Wedding_Day|escape:'javascript'}}') {
      _self._order = 'v.weddingday';
    } else if (this._gui.sort.options[this._gui.sort.selectedIndex].text == '{{$smarty.const.Sort_Method_FollowUp_Times|escape:'javascript'}}') {
      _self._order = ' COUNT(o.e_oid) ';
      _self._con += ' Group By v.e_oid';
    }
    this._gui.sort.onchange = function() { if (this.options[this.selectedIndex].text == '{{$smarty.const.Sort_Method_Last_Updated|escape:'javascript'}}') {
                                             _self._order = 'o.operatedDate';
                                           } else if (this.options[this.selectedIndex].text == '{{$smarty.const.Sort_Method_Wedding_Day|escape:'javascript'}}') {
                                             _self._order = 'v.weddingday';
                                           } else if (this.options[this.selectedIndex].text == '{{$smarty.const.Sort_Method_FollowUp_Times|escape:'javascript'}}') {
                                             _self._order = ' COUNT(o.e_oid) ';
                                             _self._con += ' Group By v.e_oid';
                                           }
                                           _self._retrieveVisitors(1, DOMUtils.findPos(this));
                                         };
  }

  for (var i = 0, il = OrderMethod.array().length; i < il; i++) {
    var method = OrderMethod.array()[i];
    var option = new Option(method);
    this._gui.order.options[this._gui.order.options.length] = option;
    if (option.text == this._query) {
      this._gui.order.selectedIndex = this._gui.order.options.length - 1;
    }
  }
  if (OrderMethod.array().length > 0) {
    this._query =  this._gui.order.options[this._gui.order.selectedIndex].text;
    this._gui.order.onchange = function() { _self._query = this.options[this.selectedIndex].text;
                                           _self._retrieveVisitors(1, DOMUtils.findPos(this));
                                         };
  }

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

HandleFollowUp.prototype._retrieveVisitors = function(page, pos) { 
  var _self = this;
  var args = '&c=LEFT JOIN np_pz_operation AS o ON o.visitId = v.e_oid WHERE v.status = 0' + ((this._con) ? this._con : '')  + '&p=' + page + '&s={{$smarty.const.SIZE|escape:'javascript'}}' + '&o=' + ((this._order) ? this._order : '' ) + '&q=' + ((this._query) ? this._query : '');
  new RequestUtils()._mysql('followUp', args, function(result, params) { _self._visitors = result.data;
                                                                         _self._parameters = result;
                                                                         _self._verifyData.call(_self);
                                                                       }, { pos: pos });
};

HandleFollowUp.prototype._updateElements = function() {
  var unique, _self = this;
  DOMUtils.removeChildElements(this._gui.page);
  DOMUtils.removeChildElements(this._gui.visitors);
  if (this._parameters.total > this._parameters.size) {
    new ModulePagination(document, this._gui.page, 500, 50, this._operator, this._now, {page: this._parameters.page, total: this._parameters.total, limit: this._parameters.size, callbackFunc: function(page, condition) { _self._retrieveVisitors.call(_self, page, _self._parameters.condition); }, context: this});
  }
  var table = document.createElement('table');
  table.style.width = '100%';
  table.cellPadding = 0;
  table.cellSpacing = 0;
  this._gui.visitors.appendChild(table);
  
  if (this._visitors.length == 0) {
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    td.style.fontWeight = 'bold';
    td.appendChild(document.createTextNode('No Result Matches'));
  }
  
  for (var i = 0, il = this._visitors.length; i < il; i++) {
    var tmp = this._visitors[i];
    tr = table.insertRow(-1);
    td = tr.insertCell(-1);
    new ModuleVisitorResult(document, td, 980, 60, this._operator, this._now, { item: tmp, menu: 2, cont: this._cont } );
  }
};
