function HandleEmailTemplateEdit(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._createElements();
};

HandleEmailTemplateEdit.prototype._createElements = function() {
  this._loadData();
};

HandleEmailTemplateEdit.prototype._loadData = function() {
  this._template = null;
  this._retrieveTemplate();
};

HandleEmailTemplateEdit.prototype._verifyData = function() {
  if (this._template) {
    this._updateElements();
  }
};

HandleEmailTemplateEdit.prototype._retrieveTemplate = function() {
  var _self = this;
  if (this._options.id) {
    new RequestUtils()._read('emailtemplate', null, 'd.oid = ' + this._options.id, null, null, null, null, function(result, params) { _self._template = (result.data.length == 1) ? result.data[0] : null;
                                                                                                                                      _self._verifyData.call(_self);
                                                                                                                                    }, null);
  } else {
    this._template = emailtemplate.instance();
    this._verifyData();
  }
};

HandleEmailTemplateEdit.prototype._updateElements = function() {
  var table, tr, td, _self = this;
  
  this._gui.name.value = this._template.name;
  this._gui.subject.value = this._template.subject;
  this._gui.content.value = this._template.content;

  this._gui.name.onchange = function() { _self._template.name = this.value; };
  this._gui.subject.onchange = function() { _self._template.subject = this.value; };
  this._gui.content.onchange = function() { _self._template.content = this.value; };
  
  
  this._gui.save.value = (this._options.id) ? 'Update' : 'Add';
  this._gui.save.onclick = function() { var str = '';
                                        if (_self._template.name == '') {
                                          str += 'name, ';
                                        }
                                        if (_self._template.subject == '') {
                                          str += 'subject, ';
                                        }
                                        if (_self._template.content == '') {
                                          str += 'content, ';
                                        }
                                        if (_self._template.name == '' || _self._template.subject == '' || _self._template.content == '') {
                                          window.alert(str.substring(0, str.length-2) + ' can not be empty');
                                        } else {
                                          new RequestUtils()._write('emailtemplate', [_self._template], [], function() { location.href = '?t=emailtemplates&m=' + JSON.stringify({ a: 4, b: 2 }); }, null); 
                                        }
                                      };
  this._gui.back.onclick = function() { history.back(); };
};
