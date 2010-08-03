function ModuleVisitorResult(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;

  this._item = (options && options.item) ? options.item : null;
  this._menu = (options && options.menu) ? options.menu : '';
  this._cont = (options && options.cont) ? options.cont : '';
  
  this._createElements();
}

ModuleVisitorResult.prototype._createElements = function() {
  var _self = this;
  this._gui = new VisitorResult(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;

  this._gui.title.style.fontSize = '13px';
  this._gui.title.style.fontWeight = 'bold';
  var a = this._doc.createElement('a');
  a.style.fontSize = '13px';
  a.href = '?t=visitorexist&m=' + MiscUtils.encode({a: (this._menu) ? this._menu : 2, b: (this._cont) ? this._cont : 1}) + '&opts=' + MiscUtils.encode({id: this._item.id, menu: this._menu, cont: this._cont});
  a.appendChild(this._doc.createTextNode('No. ' + POZVFSUtils.visitorId(this._item.id)));
  this._gui.title.appendChild(a);
  this._gui.title.appendChild(document.createTextNode(' - First Contact By ' + this._item.firstVisitMethod + ' On ' + ((this._item.firstVisitDate) ? SimpleDate.format(this._item.firstVisitDate) : '-')));
  var cnt = 0;
  for (var i = 0, il = this._item.operations.length; i < il; i++) {
    var operation = this._item.operations[i];
    var type = operation.operateType.substring(0, operation.operateType.indexOf('('));
    if (type == 'visit') {
      if (!operation.cancelled) {
        cnt++;
      }
    }
  }
  if (cnt || this._item.firstVisitMethod == 'Visitor') {
    this._gui.title.appendChild(document.createTextNode(', Visited'));
  } else {
    this._gui.title.appendChild(document.createTextNode(', No Visit'));
  }
  
  if (this._item.weddingDay) {
    this._gui.title.appendChild(document.createTextNode(', Wedding Day ' + SimpleDate.format(this._item.weddingDay)));
  } else {
    this._gui.title.appendChild(document.createTextNode(', Wedding Day -'));
  }
   
  if (this._item.status == 1) {
    this._gui.title.appendChild(document.createTextNode(' (Succeed)'));
  } else if (this._item.status == -1) {
    this._gui.title.appendChild(document.createTextNode(' (Failed)'));
  }
  
  this._gui.brideName.appendChild(this._doc.createTextNode(this._item.brideName));
  this._gui.groomName.appendChild(this._doc.createTextNode(this._item.groomName));
  this._gui.bridePhone.appendChild(this._doc.createTextNode(((this._item.bridePhone) ? this._item.bridePhone : ' - ') + ' / ' + ((this._item.brideMobile) ? this._item.brideMobile : ' - ')));
  this._gui.groomPhone.appendChild(this._doc.createTextNode(((this._item.groomPhone) ? this._item.groomPhone : ' - ') + ' / ' + ((this._item.groomMobile) ? this._item.groomMobile : ' - ')));
  this._gui.brideEmail.appendChild(this._doc.createTextNode(this._item.brideEmail));
  this._gui.groomEmail.appendChild(this._doc.createTextNode(this._item.groomEmail));
  this._gui.createdDate.appendChild(this._doc.createTextNode(SimpleDate.format(this._item.createdDate)));
  this._gui.author.appendChild(this._doc.createTextNode(this._item.creator));
};