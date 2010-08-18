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
  a.href = '?t=visitorexist&m=' + MiscUtils.encode({a: (this._menu) ? this._menu : 1, b: (this._cont) ? this._cont : 1}) + '&opts=' + MiscUtils.encode({id: this._item.id, menu: this._menu, cont: this._cont});
  a.appendChild(this._doc.createTextNode('No. ' + POZVFSUtils.visitorId(this._item.id)));
  this._gui.title.appendChild(a);
  
  this._gui.title.appendChild(document.createTextNode(' - '));
  var span = document.createElement('span');
  span.style.color = '#891234';
  var visit = 0; noVisit = 0;
  for (var i = 0, il = this._item.operations.length; i < il; i++) {
    var operation = this._item.operations[i];
    var type = operation.operateType.substring(0, operation.operateType.indexOf(' (')).toLowerCase();
    if (type == 'visit') {
      visit++;
    }
  }
  
  for (var i = 0, il = this._item.operations.length; i < il; i++) {
    var operation = this._item.operations[i];
    var type = operation.operateType.substring(0, operation.operateType.indexOf(' (')).toLowerCase();
    if (type != 'visit') {
      noVisit++;
    } else {
      break;
    }
  }
  
  if (this._item.isVisited) {
    span.style.color = '#123489';
    span.appendChild(document.createTextNode('Visited'));
  } else {
    span.appendChild(document.createTextNode('No Visit'));
  }
  this._gui.title.appendChild(span);
  
  this._gui.title.appendChild(document.createTextNode(' | '));
  span = document.createElement('span');
  span.style.color = '#DD8012';
  if (this._item.weddingDay) {
    span.appendChild(document.createTextNode('Wedding Day ' + SimpleDate.format(this._item.weddingDay)));
  } else {
    span.style.color = '#FFBB00';
    span.appendChild(document.createTextNode('No Wedding Day'));
  }
  this._gui.title.appendChild(span);
  
  this._gui.title.appendChild(document.createTextNode(' | '));
  span = document.createElement('span');
  span.style.color = '#778899';
  span.appendChild(document.createTextNode('First Contact By ' + this._item.firstVisitMethod + ((this._item.firstVisitDate) ? ' On ' + SimpleDate.format(this._item.firstVisitDate) : '')));
  this._gui.title.appendChild(span);
  
  this._gui.title.appendChild(document.createTextNode(' | '));
  span = document.createElement('span');
  span.style.color = '#123476';
  if (this._item.operations.length == 0) {
    span.appendChild(document.createTextNode('Last Updated at ' + SimpleDate.format(this._item.createdDate)));
  } else {
    span.appendChild(document.createTextNode('Last Updated at ' + SimpleDate.format(this._item.operations[0].operatedDate)));
  }
  this._gui.title.appendChild(span);
  
  this._gui.title.appendChild(document.createTextNode(' | '));
  span = document.createElement('span');
  span.style.color = '#123476';
  if (this._item.firstVisitMethod == '{{$smarty.const.Visitor_Method_Visitor|escape:'javascript'}}') {
    span.style.color = '#009900';
    span.appendChild(document.createTextNode((this._item.operations.length)));
    this._gui.title.appendChild(span);
    span = document.createElement('span');
    span.style.color = '#66cc66';
    span.appendChild(document.createTextNode(' ( 0 ) '));
    this._gui.title.appendChild(span);
    span = document.createElement('span');
    span.style.color = '#009900';
    span.appendChild(document.createTextNode('Follow up actions'));
    this._gui.title.appendChild(span);
  } else {
    if (this._item.operations.length == 0) {
      span = document.createElement('span');
      span.style.color = '#FF0000';
      span.appendChild(document.createTextNode('No Follow up actions'));
      this._gui.title.appendChild(span);
    } else {
      if (visit == 0 && noVisit == 0) {
        span = document.createElement('span');
        span.style.color = '#009900';
        span.appendChild(document.createTextNode(this._item.operations.length + ' Follow up actions'));
        this._gui.title.appendChild(span);
      } else if (visit != 0 && noVisit == 0) {
        span.style.color = '#009900';
        span.appendChild(document.createTextNode((this._item.operations.length - noVisit - 1)));
        this._gui.title.appendChild(span);
        span = document.createElement('span');
        span.style.color = '#66cc66';
        span.appendChild(document.createTextNode(' ( ' + noVisit + ' ) '));
        this._gui.title.appendChild(span);
        span = document.createElement('span');
        span.style.color = '#009900';
        span.appendChild(document.createTextNode('Follow up actions'));
        this._gui.title.appendChild(span);
      } else if (visit == 0 && noVisit != 0) {
        span = document.createElement('span');
        span.style.color = '#009900';
        span.appendChild(document.createTextNode( this._item.operations.length + ' Follow up actions'));
        this._gui.title.appendChild(span);
      } else {
        span.style.color = '#009900';
        span.appendChild(document.createTextNode((this._item.operations.length - noVisit - 1)));
        this._gui.title.appendChild(span);
        span = document.createElement('span');
        span.style.color = '#66cc66';
        span.appendChild(document.createTextNode(' ( ' + noVisit + ' ) '));
        this._gui.title.appendChild(span);
        span = document.createElement('span');
        span.style.color = '#009900';
        span.appendChild(document.createTextNode('Follow up actions'));
        this._gui.title.appendChild(span);
      }
    }
  }
  this._gui.title.appendChild(span);

  if (this._item.status == 1) {
    this._gui.title.appendChild(document.createTextNode(' (Succeed)'));
  } else if (this._item.status == -1) {
    this._gui.title.appendChild(document.createTextNode(' (Failed)'));
  } else if (this._item.status == -2) {
    this._gui.title.appendChild(document.createTextNode(' (Deleted)'));
  }
  
  this._gui.brideName.appendChild(this._doc.createTextNode(this._item.brideName));
  this._gui.groomName.appendChild(this._doc.createTextNode(this._item.groomName));
  this._gui.bridePhone.appendChild(this._doc.createTextNode(((this._item.bridePhone) ? this._item.bridePhone : ' - ') + ' / ' + ((this._item.brideMobile) ? this._item.brideMobile : ' - ')));
  this._gui.groomPhone.appendChild(this._doc.createTextNode(((this._item.groomPhone) ? this._item.groomPhone : ' - ') + ' / ' + ((this._item.groomMobile) ? this._item.groomMobile : ' - ')));
  this._gui.brideEmail.appendChild(this._doc.createTextNode(this._item.brideEmail));
  this._gui.groomEmail.appendChild(this._doc.createTextNode(this._item.groomEmail));
  this._gui.createdDate.appendChild(this._doc.createTextNode(SimpleDate.format(this._item.createdDate)));
  this._gui.author.appendChild(this._doc.createTextNode(this._item.creator));
  
  this._gui.cultureBackground.style.margin = '0 10px 0 0';
  this._gui.ceremonyLocation.style.margin = '0 10px 0 0';
  this._gui.receptionLocation.style.margin = '0 10px 0 0';
  this._gui.source.style.margin = '0 10px 0 0';
  this._gui.cultureBackground.appendChild(document.createTextNode(((this._item.culturalBackground) ? this._item.culturalBackground : ' - ') + ', '));
  this._gui.ceremonyLocation.appendChild(document.createTextNode(((this._item.ceremonyLocation) ? this._item.ceremonyLocation : ' - ') + ', '));
  this._gui.receptionLocation.appendChild(document.createTextNode(((this._item.receptionLocation) ? this._item.receptionLocation : ' - ') + ', '));
  this._gui.source.appendChild(document.createTextNode((this._item.source) ? this._item.source : ' - '));
};