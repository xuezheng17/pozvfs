function ModuleDialogHistory(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._title = (options && options.title) ? options.title : '';
  this._reverses = (options && options.items) ? options.items : null;
  this._createElements();
};

ModuleDialogHistory.prototype._createElements = function() {
  var _self = this;
  this._gui = new DialogHistory(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;
  
  this._gui.title.appendChild(document.createTextNode(this._title));
  
  for (var i = 0, il = this._reverses.length; i < il; i++) {
    var reverse = this._reverses[i];
    tr = this._gui.mains.insertRow(-1);
    td = tr.insertCell(-1);
    td.style.textAlign = 'left';
    td.style.verticalAlign = 'middle';
    td.style.height = '30px';
    td.style.padding = '0 0 0 10px';
    td.appendChild(document.createTextNode(reverse.operator));
    td = tr.insertCell(-1);
    td.style.textAlign = 'left';
    td.style.verticalAlign = 'middle';
    td.style.padding = '0 0 0 10px';
    td.appendChild(document.createTextNode(SimpleDate.format(reverse.date)));
    td = tr.insertCell(-1);
    td.style.textAlign = 'left';
    td.style.padding = '0 0 0 10px';
    td.style.verticalAlign = 'middle';
    td.appendChild(document.createTextNode((reverse.content) ? ((String(reverse.content).length > 100) ? reverse.content.substring(0, 100) + '...' : reverse.content) : ''));
    if (String(reverse.content).length > 100) {
      var a = document.createElement('a');
      a.href = '#';
      a._reverse = reverse;
      a.appendChild(document.createTextNode('More'));
      a.onclick = function() { var pos, func1;
                               pos = DOMUtils.findPos(this);
                               func1 = function() { tmp._close(); };
                               tmp = new ModulePopupBoxSimple(document, document.body, 500, 200, _self._operator, _self._now, { pos: pos });
                               var span = MiscUtils.span(this._reverse.content);
                               MiscUtils.dialog(tmp, span, func1);
                             };
      td.appendChild(a);
    }
  }
};