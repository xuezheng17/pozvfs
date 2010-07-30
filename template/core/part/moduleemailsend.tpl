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
  this._email = (options && options.email) ? options.email : null;
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

  var table = document.createElement('table');
  this._gui.visitorInfo.appendChild(table);
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.appendChild(this._doc.createTextNode(this._visitor.brideName + ' - ' + this._visitor.brideEmail));
  tr = table.insertRow(-1);
  td = tr.insertCell(-1);
  td.appendChild(this._doc.createTextNode(this._visitor.groomName + ' - ' + this._visitor.groomEmail));

  this._gui.templateSelect.options[this._gui.templateSelect.options.length] = new Option('');
  for (var i = 0, il = this._templates.length; i < il; i++) {
    var template = this._templates[i];
    var option = new Option(template.name);
    option._template = template;
    this._gui.templateSelect.options[this._gui.templateSelect.options.length] = option;
    if (option.text == this._email.subject) {
      this._gui.templateSelect.selectedIndex = this._gui.templateSelect.options.length - 1;
    }
  }
  
  if (this._templates.length > 0) {
    this._gui.templateSelect.onchange = function() { _self._email.subject = (this.options[this.selectedIndex]._template) ? this.options[this.selectedIndex]._template.name : '';
                                                     _self._email.content = (this.options[this.selectedIndex]._template) ? this.options[this.selectedIndex]._template.content : '';
                                                     _self._updateElements();
                                                   };
  }
  this._gui.subject.value = this._email.subject;
  this._gui.content.value = this._email.content;
  this._gui.subject.onchange = function() { _self._email.subject = this.value };
  this._gui.content.onchange = function() { _self._email.content = this.value };
};
