function ModuleEmailSend(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;

  this._operation = (options && options.operation) ? options.operation : null;
  this._visitor = (options && options.visitor) ? options.visitor : null;
  this._popupBox = (options && options.popupBox) ? options.popupBox : null;
  this._callbackFunc = (options && options.callbackFunc) ? options.callbackFunc : null;
  this._pos = (options && options.pos) ? options.pos : null;
  this._email = { name: '',
                  subject: '',
                  content: ''
                };
  this._createElements();
};

ModuleEmailSend.prototype._createElements = function() {
  this._gui = new EmailSend(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;
  this._loadData();
};

ModuleEmailSend.prototype._loadData = function() {
  this._templates = null;
  this._retrieveTemplates();
};

ModuleEmailSend.prototype._verifyData = function() {
  if (this._templates) {
    this._updateElements();
  }
};

ModuleEmailSend.prototype._retrieveTemplates = function() {
  var _self = this;
  new RequestUtils()._read('emailtemplate', null, null, null, null, null, null, function(result, params) { _self._templates = result.data;
                                                                                                           _self._verifyData.call(_self);
                                                                                                         }, { php: this._php });
};

ModuleEmailSend.prototype._updateElements = function() {
  var table, tr, td, input, _self = this;

  POZVFSUtils.clear(this._gui);
  
  if (this._templates.length == 0) {
    this._gui.templateSelect.disabled = true;
    this._gui.templateDiv.style.padding = '0 0 0 5px';
    this._gui.templateDiv.appendChild(document.createTextNode(' No eTemplate available?'));
    var a = document.createElement('a');
    a.href = '?t=emailtemplateedit&m={\"a\":5,\"b\":2}';
    a.appendChild(document.createTextNode('add eTemplate'));
    this._gui.templateDiv.appendChild(a);
  }
  
  this._gui.templateSelect.options[this._gui.templateSelect.options.length] = new Option('');
  for (var i = 0, il = this._templates.length; i < il; i++) {
    var template = this._templates[i];
    var option = new Option(template.name);
    option._template = template;
    this._gui.templateSelect.options[this._gui.templateSelect.options.length] = option;
    if (option.text == this._email.name) {
      this._gui.templateSelect.selectedIndex = this._gui.templateSelect.options.length - 1;
    }
  }
  
  if (this._templates.length > 0) {
    this._gui.templateSelect.onchange = function() { _self._email.name = (this.options[this.selectedIndex]._template) ? this.options[this.selectedIndex]._template.name : ''; 
                                                     _self._email.subject = (this.options[this.selectedIndex]._template) ? this.options[this.selectedIndex]._template.subject : '';
                                                     _self._email.content = (this.options[this.selectedIndex]._template) ? this.options[this.selectedIndex]._template.content : '';
                                                     _self._updateElements();
                                                   };
  }
  this._gui.subject.value = this._email.subject;
  this._gui.content.value = this._email.content;
  this._gui.subject.onchange = function() { _self._email.subject = this.value };
  this._gui.content.onchange = function() { _self._email.content = this.value };
  
  this._gui.send.onclick = function() { if(_self._email.subject && _self._email.content) {
                                          _self._operation.content = _self._email.content;
                                          new RequestUtils()._custom('sendEmail', {operation: _self._operation, visitor: _self._visitor, email: _self._email}, function() { _self._callbackFunc(); }, { pos: _self._pos });
                                          _self._popupBox._close();
                                       } else {
                                         window.alert('Subject/Content is Empty');
                                       }
                                      };
                                      
  this._gui.cancel.onclick = function() {_self._popupBox._close();};
};
