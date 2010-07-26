Pagination = function() {
};

Pagination.makePagedResults = function(container, page, total, limit, callbackFunc, context, doc) {
  if (!this._popupBox) {
    this._popupBox = null;
  } else {
    this._popupBox._close();
  }

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
      _self._popupBox = new ModulePopupBoxSimple(doc, doc.body, null, null, null, null, {pos: DOMUtils.findPos(this)});
      MiscUtils.load(_self._popupBox, 'Loading...');
      callbackFunc(this._page);
      return false;
    };
  var r;
  var tr, td;
  var ltable = document.createElement('table');

  container.appendChild(ltable);
  ltr = ltable.insertRow(-1);
  ltd = ltr.insertCell(-1);
  ltd.style.width = '120px';
  ltd.style.textAlign = 'center';
  var itable = document.createElement('table');
  var itr = itable.insertRow(-1);
  var itd = itr.insertCell(-1);
  itd.align = 'left';
  itd.style.width = '35px';
  var items = document.createElement('img');
  items.src = 'image/pagination/items.png';
  itd.appendChild(items);
  itd = itr.insertCell(-1);
  itd.style.width = '15px';
  itd.align = 'center';
  itd.style.fontFamily = 'Tahoma';
  itd.style.fontSize = '12px';
  itd.style.fontWeight = 'bold';
  itd.appendChild(document.createTextNode(' ' + total));
  itd = itr.insertCell(-1);
  itd.align = 'left';
  itd.style.width = '40px';
  var pages = document.createElement('img');
  pages.src = 'image/pagination/pages.png';
  pages.style.margin = '5px 5px 0 10px';
  itd.appendChild(pages);
  itd = itr.insertCell(-1);
  itd.style.width = '15px';
  itd.align = 'center';
  itd.style.fontFamily = 'Tahoma';
  itd.style.fontSize = '12px';
  itd.style.fontWeight = 'bold';
  itd.appendChild(document.createTextNode(last));
  ltd.appendChild(itable);
  
  ltd = ltr.insertCell(-1);
  ltd.style.width = '469px';
  ltd.style.textAlign = 'right';
  var contentTable = document.createElement('table');
  ltd.appendChild(contentTable);
  tr = contentTable.insertRow(-1);
  td = tr.insertCell(-1);
  td.style.verticalAlign = 'bottom';
  var itable = document.createElement('table');
  itable.style.height = '28px';
  itable.cellPadding = 0;
  itable.cellSpacing = 0;
  td.appendChild(itable);
  var itr = itable.insertRow(-1);
  var itd = itr.insertCell(-1);
  itd.style.width = '52px';
  var left = document.createElement('table');
  left.cellPadding = 0;
  left.cellSpacing = 0;
  itd.appendChild(left);
  if (prev > 0 && prev != page) {
    left.style.backgroundImage = 'url(image/pagination/leftbg.png)';
    left.style.backgroundRepeat = 'no-repeat';
    left.style.width = '52px';
    left.style.height = '28px';
    
    lftr = left.insertRow(-1);
    lftd = lftr.insertCell(-1);
    lftd.style.width = '26px';
    lftd.align = 'center';
    a = doc.createElement('img');
    a.setAttribute('href', '#first');
    a.src = 'image/pagination/first.png';
    lftd.style.cursor = 'pointer';
    lftd._page = first;
    lftd.onclick = func;
    lftd.appendChild(a);
  
    lftd = lftr.insertCell(-1);
    lftd.style.width = '26px';
    lftd.align = 'center';
    lftd.style.verticalAlign = 'middle';
    a = doc.createElement('img');
    a.setAttribute('href', '#prev');
    a.src = 'image/pagination/prev.png';
    lftd.style.cursor = 'pointer';
    lftd._page = prev;
    lftd.onclick = func;
    lftd.appendChild(a);
  } else {
    left.style.backgroundImage = 'url(image/pagination/noleft.png)';
    left.style.backgroundRepeat = 'no-repeat';
    left.style.width = '52px';
    left.style.height = '28px';
  }
  itd = itr.insertCell(-1);
  itd.align = 'center';
  var middle = document.createElement('table');
  middle.style.backgroundImage = 'url(image/pagination/middlebg.png)';
  middle.style.backgroundRepeat = 'repeat-x';
  middle.style.width = '40px';
  middle.style.height = '28px';
  middle.cellPadding = 0;
  middle.cellSpacing = 0;
  itd.appendChild(middle);
  mtr = middle.insertRow(-1);
  mtd = mtr.insertCell(-1);
  mtd.style.width = '20px';
  for (i = 0, il = lowRange.length; i < il; i++) {
    r = lowRange[i];
    if (r != page) {
      a = doc.createElement('a');
      a.setAttribute('href', '#page' + r);
      a.style.margin = '0em 0.7em';
      a._page = r;
      a.onclick = func;
      a.appendChild(doc.createTextNode(r));
      mtd.appendChild(a);
    }
  }

  var strong = doc.createElement('strong');
  strong.style.margin = '0em 0.7em';
  strong.style.fontSize = '12px';
  strong.style.fontFamily = 'Tahoma';
  strong.appendChild(doc.createTextNode(page));
  mtd.appendChild(strong);
  
  for (i = 0, il = highRange.length; i < il; i++) {
    r = highRange[i];
    if (r != page) {
      a = doc.createElement('a');
      a.setAttribute('href', '#page' + r);
      a.style.margin = '0em 0.7em';
      a._page = r;
      a.onclick = func;
      a.appendChild(doc.createTextNode(r));
      mtd.appendChild(a);
    }
  }
  
  itd = itr.insertCell(-1);
  itd.style.width = '118px';
  itd.align = 'center';
  itd.style.verticalAlign = 'middle';
  var right = document.createElement('table');
  right.cellPadding = 0;
  right.cellSpacing = 0;
  itd.appendChild(right);
  
  if (next > 0 && next != page) {
    right.style.backgroundImage = 'url(image/pagination/rightbg.png)';
    right.style.backgroundRepeat = 'no-repeat';
    right.style.width = '118px';
    right.style.height = '28px';
    
    rtr = right.insertRow(-1);
    rtd = rtr.insertCell(-1);
    rtd.style.width = '88px';
    rtd.align = 'center';
    rtd.style.verticalAlign = 'middle';
    a = doc.createElement('img');
    a.setAttribute('href', '#next');
    a.src = 'image/pagination/nextpage.png';
    rtd.style.cursor = 'pointer';
    rtd._page = next;
    rtd.onclick = func;
    rtd.appendChild(a);
    
    rtd = rtr.insertCell(-1);
    rtd.style.width = '32px';
    rtd.align = 'center';
    rtd.style.verticalAlign = 'middle';
    a = doc.createElement('img');
    a.setAttribute('href', '#last');
    a.src = 'image/pagination/last.png';
    rtd.style.cursor = 'pointer';
    rtd._page = last;
    rtd.onclick = func;
    rtd.appendChild(a);
  } else {
    right.style.backgroundImage = 'url(image/pagination/noright.png)';
    right.style.backgroundRepeat = 'no-repeat';
    right.style.width = '118px';
    right.style.height = '28px';
  }
  
  td = tr.insertCell(-1);
  var itable = document.createElement('table');
  itable.style.backgroundImage = 'url(image/pagination/jumpbg.png)';
  itable.style.backgroundRepeat = 'no-repeat';
  itable.style.width = '122px';
  itable.style.height = '28px';
  td.appendChild(itable);
  itr = itable.insertRow(-1);
  itd = itr.insertCell(-1);
  itd.align = 'center';
  itd.style.width = '55px';
  var pTxt = DOMUtils.createInput(null, null, 'text', page, null);
  pTxt.className = 'text';
  pTxt.style.width = '40px';
  pTxt.style.textAlign = 'center';
  pTxt.style.border = 'solid 1px #cccccc';
  pTxt.onkeypress = function() { pBtn._page = this.value; };
  pTxt.onchange = function() { pBtn._page = this.value; };
  itd.appendChild(pTxt);
  itd = itr.insertCell(-1);
  itd.align = 'center';
  itd.style.width = '55px';
  var pBtn = document.createElement('img');
  pBtn.src = 'image/pagination/jumpto.png';
  pBtn.style.cursor = 'pointer';
  pBtn.style.margin = '3px 0 0 0';
  pBtn._page = page;
  pBtn.onclick = func;
  itd.appendChild(pBtn);

};
