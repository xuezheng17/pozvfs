function HandlePageStatReception(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options
  this._createElements();
};

HandlePageStatReception.prototype._createElements = function() {
  var _self = this;
  this._popupBox = new PopupBox();
  
  tr = this._gui.reception.receptionTable.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.backgroundColor = '#fff';
  td.colSpan = 2;
  td.appendChild(DOMUtils.getLoadingImage());
  
  this._loadData();
};

HandlePageStatReception.prototype._loadData = function() {
  this._results = null;
  this._retrieveResults();
};

HandlePageStatReception.prototype._verifyData = function() {
  if (this._results) {
    this._updateElements();
  }
};

HandlePageStatReception.prototype._retrieveResults = function() {
  var _self = this;
  var args = '';
  new RequestUtils()._mysql('iestatsreception', args, function(result, params) { _self._results = result;
                                                                                 _self._verifyData.call(_self);
                                                                               }, null);
};

HandlePageStatReception.prototype._updateElements = function() {
  var _self = this;
  DlmanageUtils.clear(this._gui.dateZone);
  DOMUtils.removeChildElements(this._gui.reception.total);
  DOMUtils.removeTableRows(this._gui.reception.receptionTable, 1);
  
  /*--main table--*/
  if (this._results.length == 0) {
    tr = this._gui.reception.receptionTable.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    td.style.height = '24px';
    td.colSpan = 2;
    td.appendChild(document.createTextNode('N/A'));
  }

  var total = 0;
  for (var i = 0, il = this._results.length; i < il; i++) {
    var result = this._results[i];
    total += parseFloat(result.value, 10);
    tr = this._gui.reception.receptionTable.insertRow(-1);
    td = tr.insertCell(-1);
    td.className = 'elemstatreception_td11';
    td.appendChild(document.createTextNode(result.name));
    td = tr.insertCell(-1);
    td.className = 'elemstatreception_td9';
    td.appendChild(document.createTextNode(result.value));
    var a = document.createElement('a');
    a.href = '#';
    a._name = result.name;
    a.appendChild(document.createTextNode(' 详'));
    a.onclick = function() { var w = window.open('?p=pageasst&t=pagestatreceptiondetail&opts=' + JSON.stringify({ name: this._name }), 'Reception', 'width=1024,height=768,scrollbars=1,location=0', true);
                             w.focus();
                           };
    td.appendChild(a);
  }

  this._gui.reception.total.appendChild(document.createTextNode(total));
};
