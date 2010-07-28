function ModuleVisitorResult(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;

  this._item = (options && options.item) ? options.item : null;
  
  this._createElements();
}

ModuleVisitorResult.prototype._createElements = function() {
  var _self = this;
  this._gui = new VisitorResult(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;

  var a = this._doc.createElement('a');
  a.href = '?t=visitorexist&m=' + MiscUtils.encode({a: 1, b: 1}) + '&opts=' + MiscUtils.encode({id: this._item.id});
  a.appendChild(this._doc.createTextNode(this._item.firstVisitMethod + POZVFSUtils.visitorId(this._item.id)));
  if (this._item.status == 1) {
    a.appendChild(document.createTextNode('(Succeed)'));
  } else if (this._item.status == -1) {
    a.appendChild(document.createTextNode('(Dropped)'));
  } else {
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
      a.appendChild(document.createTextNode('(Visited)'));
    }
  }
  this._gui.title.appendChild(a);
  this._gui.brideName.appendChild(this._doc.createTextNode(this._item.brideName));
  this._gui.groomName.appendChild(this._doc.createTextNode(this._item.groomName));
  this._gui.bridePhone.appendChild(this._doc.createTextNode(((this._item.bridePhone) ? this._item.bridePhone : ' - ') + '/' + ((this._item.brideMobile) ? this._item.brideMobile : ' - ')));
  this._gui.groomPhone.appendChild(this._doc.createTextNode(((this._item.groomPhone) ? this._item.groomPhone : ' - ') + '/' + ((this._item.groomMobile) ? this._item.groomMobile : ' - ')));
  this._gui.brideEmail.appendChild(this._doc.createTextNode(this._item.brideEmail));
  this._gui.groomEmail.appendChild(this._doc.createTextNode(this._item.brideEmail));
  this._gui.createdDate.appendChild(this._doc.createTextNode(SimpleDate.format(this._item.createdDate)));
  this._gui.author.appendChild(this._doc.createTextNode(this._item.creator));
};