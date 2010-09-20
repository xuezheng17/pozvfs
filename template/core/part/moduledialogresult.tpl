function ModuleDialogResult(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._width = width;
  this._height = height;
  this._operator = operator;
  this._now = now;
  this._options = options;

  this._query = (options && options.query) ? options.query : '';
  this._popupBox = (options && options.popupBox) ? options.popupBox : null;
  
  this._createElements();
};

ModuleDialogResult.prototype._createElements = function() {
  var _self = this;
  this._gui = new DialogResult(this._doc, this._container, this._width, this._height, this._operator, this._now, this._options)._gui;
  this._loadData();
};

ModuleDialogResult.prototype._loadData = function() {
  this._results = null;
  this._retrieveUsers();
};

ModuleDialogResult.prototype._verifyData = function() {
  if (this._results) {
    this._updateElements();
  }
};

ModuleDialogResult.prototype._retrieveUsers = function() {
  var _self = this;
  var args = '&sql=' + encodeURIComponent(this._query);
  new RequestUtils()._mysql('findByRequest', args, function(result, params) { _self._results = result.data;
                                                                              _self._verifyData.call(_self);
                                                                            }, null);
};

ModuleDialogResult.prototype._updateElements = function() {
  var tr, td, div, span, _self = this;
  
  DOMUtils.removeTableRows(this._gui.mains, 0);
  
  if (this._results.length == 0) {
    this._popupBox._close();
  } else {
    for (var i = 0, il = this._results.length; i < il; i++) {
      var res = this._results[i];
      tr = this._gui.mains.insertRow(-1);
      td = tr.insertCell(-1);
      td.style.textAlign = 'left';
      td.style.padding = '0 0 0 5px';
      div1 = document.createElement('div');
      div1.appendChild(document.createTextNode(res.id));
      td.appendChild(div1);
      span1 = document.createElement('span');
      div1.appendChild(span1);
      strs = res.brideName.split(this._item.value);
      for (var i=0; i < strs.length; i++) {
        var str = strs[i];
        if (str == this._item.value) {
          span1.style.fontWeight = 'bold';
        }
        span1.appendChild(document.createTextNode(str));
      }
      span1.appendChild(document.createTextNode(','));
      
      span2 = document.createElement('span');
      span2.style.margin = '0 0 0 3px';
      div1.appendChild(span2);
      strs = res.brideAddress.split(this._item.value);
      for (var i=0; i < strs.length; i++) {
        var str = strs[i];
        if (str == this._item.value) {
          span2.style.fontWeight = 'bold';
        }
        span2.appendChild(document.createTextNode(str));
      }
      
      span3 = document.createElement('span');
      span3.style.margin = '0 0 0 3px';
      div1.appendChild(span3);
      strs = res.bridePhone.split(this._item.value);
      for (var i=0; i < strs.length; i++) {
        var str = strs[i];
        if (str == this._item.value) {
          span3.style.fontWeight = 'bold';
        }
        span3.appendChild(document.createTextNode(str));
      }
      
      span4 = document.createElement('span');
      span4.style.margin = '0 0 0 3px';
      div1.appendChild(span4);
      strs = res.brideMobile.split(this._item.value);
      for (var i=0; i < strs.length; i++) {
        var str = strs[i];
        if (str == this._item.value) {
          span4.style.fontWeight = 'bold';
        }
        span4.appendChild(document.createTextNode(str));
      }
      
      span5 = document.createElement('span');
      span5.style.margin = '0 0 0 3px';
      div1.appendChild(span5);
      strs = res.brideEmail.split(this._item.value);
      for (var i=0; i < strs.length; i++) {
        var str = strs[i];
        if (str == this._item.value) {
          span5.style.fontWeight = 'bold';
        }
        span5.appendChild(document.createTextNode(str));
      }
      
      div2 = document.createElement('div');
      div2.appendChild(document.createTextNode(''));
      td.appendChild(div2);
      
      span6 = document.createElement('span');
      div2.appendChild(span6);
      strs = res.groomName.split(this._item.value);
      for (var i=0; i < strs.length; i++) {
        var str = strs[i];
        if (str == this._item.value) {
          span6.style.fontWeight = 'bold';
        }
        span6.appendChild(document.createTextNode(str));
      }
      
      span7 = document.createElement('span');
      span7.style.margin = '0 0 0 3px';
      div2.appendChild(span7);
      strs = res.groomAddress.split(this._item.value);
      for (var i=0; i < strs.length; i++) {
        var str = strs[i];
        if (str == this._item.value) {
          span7.style.fontWeight = 'bold';
        }
        span7.appendChild(document.createTextNode(str));
      }
      
      span8 = document.createElement('span');
      span8.style.margin = '0 0 0 3px';
      div2.appendChild(span8);
      strs = res.groomPhone.split(this._item.value);
      for (var i=0; i < strs.length; i++) {
        var str = strs[i];
        if (str == this._item.value) {
          span8.style.fontWeight = 'bold';
        }
        span8.appendChild(document.createTextNode(str));
      }
      
      span9 = document.createElement('span');
      span2.style.margin = '0 0 0 9px';
      div2.appendChild(span9);
      strs = res.groomMobile.split(this._item.value);
      for (var i=0; i < strs.length; i++) {
        var str = strs[i];
        if (str == this._item.value) {
          span9.style.fontWeight = 'bold';
        }
        span9.appendChild(document.createTextNode(str));
      }
      
      span10 = document.createElement('span');
      span10.style.margin = '0 0 0 3px';
      div2.appendChild(span10);
      strs = res.groomEmail.split(this._item.value);
      for (var i=0; i < strs.length; i++) {
        var str = strs[i];
        if (str == this._item.value) {
          span10.style.fontWeight = 'bold';
        }
        span10.appendChild(document.createTextNode(str));
      }
    }
  }
};

