function HandleEmailTemplates(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options
  
  this._createElements();
};

HandleEmailTemplates.prototype._createElements = function() {
  var tr, td;
  this._gui.addTemplate.onclick = function() { location.href = '?t=emailtemplateedit&m=' + JSON.stringify({ a: 4, b: 2 }); };
  tr = this._gui.templates.insertRow(-1);
  td = tr.insertCell(-1);
  td.appendChild(DOMUtils.getLoadingImage());
  
  this._loadData();
};

HandleEmailTemplates.prototype._loadData = function() {
  this._templates = null;
  this._retrieveTemplates();
};

HandleEmailTemplates.prototype._verifyData = function() {
  if (this._templates) {
    this._updateElements();
  }
};

HandleEmailTemplates.prototype._retrieveTemplates = function() {
  var _self = this;
  new RequestUtils()._read('emailtemplate', null, null, null, null, 'd.name', null, function(result, params) { _self._templates = result.data;
                                                                                                               _self._verifyData.call(_self);
                                                                                                             }, null);
};

HandleEmailTemplates.prototype._updateElements = function() {
  var tr, td, _self = this;
  DOMUtils.removeTableRows(this._gui.templates, 1);
  
  if (this._templates.length == 0) {
    tr = this._gui.templates.insertRow(-1);
    td = tr.insertCell(-1);
    td.colSpan = 3;
    td.style.height = '24px';
    td.style.textAlign = 'center';
    td.appendChild(document.createTextNode('Empty'));
  }

  MiscUtils.sort(this._templates, ['name']);
  for(var i = 0, il = this._templates.length; i < il; i++) {
    var u = this._templates[i];
    
    tr = this._gui.templates.insertRow(-1);
    tr.style.backgroundColor = (i % 2 == 0) ? '#fff' : '#f8f8f8';
    td = tr.insertCell(-1);
    td.align = 'left';
    td.style.height = '24px';
    td.style.padding = '0 0 0 20px';
    var a = document.createElement('a');
    a.href = '?t=emailtemplateedit&m=' + MiscUtils.encode({a: 4, b: 2}) + '&opts=' + MiscUtils.encode({id: u.id})
    a.appendChild(document.createTextNode((u.name.length > 20) ? u.name.substring(0, 20) + '...' : u.name));
    td.appendChild(a);
    
    td = tr.insertCell(-1);
    td.align = 'left';
    td.style.height = '24px';
    td.style.padding = '0 0 0 20px';
    td.appendChild(document.createTextNode((u.content.length > 60) ? u.content.substring(0, 60) + '...' : u.content));
    
    td = tr.insertCell(-1);
    td.align = 'center';
    td.style.height = '24px';
    img = document.createElement('img');
    img.src = 'image/delete.png';
    img.style.cursor = 'pointer';
    img._template = u;
    img.onclick = function() { new RequestUtils()._write('emailtemplate', [], [this._template], function() { _self._createElements(); }, null); };
    td.appendChild(img);
  }
};
