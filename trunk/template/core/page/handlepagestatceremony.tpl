function HandlePageStatCeremony(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options

  this._createElements();
};

HandlePageStatCeremony.prototype._createElements = function() {
  
  tr = this._gui.ceremony.ceremonyTable.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.backgroundColor = '#fff';
  td.colSpan = 2;
  td.appendChild(DOMUtils.getLoadingImage());
  
  this._loadData();
};

HandlePageStatCeremony.prototype._loadData = function() {
  this._results = null;
  this._retrieveResults(1);
};

HandlePageStatCeremony.prototype._verifyData = function() {
  if (this._results) {
    this._updateElements();
  }
};

HandlePageStatCeremony.prototype._retrieveResults = function(page, condition, from, to) {
  var _self = this;
  var args = '';
  new RequestUtils()._mysql('statsceremony', args, function(result, params) { _self._results = result;
                                                                                _self._verifyData.call(_self);
                                                                              }, null);
};

HandlePageStatCeremony.prototype._updateElements = function() {
  var _self = this;
  POZVFSUtils.clear(this._gui.dateZone);
  DOMUtils.removeChildElements(this._gui.ceremony.total);
  DOMUtils.removeTableRows(this._gui.ceremony.ceremonyTable, 1);

  var total = 0;
  /*--main table--*/
  if (this._results.length == 0) {
    tr = this._gui.ceremony.ceremonyTable.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    td.style.height = '24px';
    td.colSpan = 2;
    td.appendChild(document.createTextNode('N/A'));
  }
  for (var i = 0, il = this._results.length; i < il; i++) {
    var result = this._results[i];
    total += parseFloat(result.value, 10);
    tr = this._gui.ceremony.ceremonyTable.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.paddingLeft= '15px';
    td.style.height= '24px';
    td.appendChild(document.createTextNode(result.name));
    td = tr.insertCell(-1);
    td.style.textAlign = 'center';
    td.appendChild(document.createTextNode(result.value));
    var a = document.createElement('a');
    a.href = '#';
    a._name = result.name;
    a.appendChild(document.createTextNode(' 详'));
    a.onclick = function() { var w = window.open('?t=pagestatceremonydetail&opts=' + JSON.stringify({ name: this._name }), 'Ceremony', 'width=1024,height=768,scrollbars=1,location=0', true);
                             w.focus();
                           };
    td.appendChild(a);
  }
  this._gui.ceremony.total.appendChild(document.createTextNode(total));
};
