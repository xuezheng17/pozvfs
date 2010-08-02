function ModulePagination(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._page = (options && options.page) ? options.page : '';
  this._total = (options && options.total) ? options.total : '';
  this._limit = (options && options.limit) ? options.limit : '';
  this._callbackFunc = (options && options.callbackFunc) ? options.callbackFunc : '';
  this._context = (options && options.context) ? options.context : '';
  
  this._createElements();
}

ModulePagination.prototype._createElements = function() {
  var _self = this;

  this._gui = new Pagination(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;
  this._makePagedResults(this._gui, this._page, this._total, this._limit, this._callbackFunc, this._context, this._doc);
};

ModulePagination.prototype._makePagedResults = function(gui, page, total, limit, callbackFunc, context, doc) {
  var _self = this;
  POZVFSUtils.clear(gui);
  
  page = parseInt(page, 10);
  total = parseInt(total, 10);
  limit = parseInt(limit, 10);

  var last;
  if (total == 0) {
    last = 1;
  } else {
    last = Math.ceil(total / limit);
    if (last == 0) {
      last = 1;
    }
  }

  if (total <= limit) {
    return;
  }

  var first = 1;
  var prev = ((page - 1) > 0) ? (page - 1) : 1;
  var next = ((page + 1) < last) ? (page + 1) : last;
  var lowRange = [];
  var highRange = [];
  var numRange = 5;
  var i, il, a;

  i = prev;
  while ((i > (prev - (numRange + 1))) && (i >= 1)) {
    lowRange[lowRange.length] = i;
    i--;
  }
  lowRange.reverse();

  i = next;
  while ((i < (next + (numRange + 1))) && (i <= last)) {
    highRange[highRange.length] = i;
    i++;
  }

  if (!doc) {
    doc = document;
  }

  var _self = this
  var func = function() {
    if (isNaN(this._page)) {
      window.alert('Not A Number');
      return;
    }
    if (this._page > last || this._page < 1) {
      window.alert('Exceeded The Range');
      return;
    }
//    _self._popupBox = new ModulePopupBoxSimple(doc, doc.body, null, null, null, null, {pos: DOMUtils.findPos(this)});
//    MiscUtils.load(_self._popupBox, 'Loading...');
    callbackFunc(this._page);
    return false;
  };
  gui.items.appendChild(document.createTextNode(' ' + total));
  gui.pages.appendChild(document.createTextNode(last));
  if (prev > 0 && prev != page) {
//    gui.first._page = first;
//    gui.first.onclick = func;
    gui.previous._page = prev;
    gui.previous.onclick = func;
  }
  for (i = 0, il = lowRange.length; i < il; i++) {
    r = lowRange[i];
    if (r != page) {
      a = doc.createElement('a');
      a.setAttribute('href', '#page' + r);
      a.style.margin = '0em 1em';
      a._page = r;
      a.onclick = func;
      a.appendChild(doc.createTextNode(r));
      gui.numbers.appendChild(a);
      gui.numbers.appendChild(doc.createTextNode('|'));
    }
  }
  
  var strong = doc.createElement('span');
  strong.style.margin = '0em 1em';
  strong.style.fontSize = '12px';
  strong.style.fontWeight = 'bold';
  strong.appendChild(doc.createTextNode(page));
  gui.numbers.appendChild(strong);
  if (page != highRange[highRange.length - 1]) {
    gui.numbers.appendChild(doc.createTextNode('|'));
  }
  
  for (i = 0, il = highRange.length; i < il; i++) {
    r = highRange[i];
    if (r != page) {
      a = doc.createElement('a');
      a.setAttribute('href', '#page' + r);
      a.style.margin = '0em 0.7em';
      a._page = r;
      a.onclick = func;
      a.appendChild(doc.createTextNode(r));
      gui.numbers.appendChild(a);
      if (i != highRange.length - 1) {
        gui.numbers.appendChild(doc.createTextNode('|'));
      }
    } 
  }
  
  if (next > 0 && next != page) {
    gui.next._page = next;
    gui.next.onclick = func;
//    gui.last._page = last;
//    gui.last.onclick = func;
  }
  gui.page.onkeypress = function() { gui.jump._page = this.value; };
  gui.page.onchange = function() { gui.jump._page = this.value; };
  gui.jump._page = page;
  gui.jump.onclick = func;
};
