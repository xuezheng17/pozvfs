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
  this._item = (options && options.item) ? options.item : null;

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
      td.style.height = '24px';
      td.style.textAlign = 'left';
      td.style.padding = '0 0 0 3px';
      td._obj = res;
      td.onmouseover = function() {this.style.backgroundColor = '#e2eaff';};
      td.onmouseout = function() {this.style.backgroundColor = '#fff';};
      td.onclick = function() { location.href = '?t=visitorexist&m=' + MiscUtils.encode({ a: 1, b: 1 }) + '&opts=' + MiscUtils.encode({id: this._obj.id});
                              };
                              
      div1 = document.createElement('div');
      div1.style.width = '10px';
      div1.appendChild(document.createTextNode(POZVFSUtils.visitorId(res.id)));
      td.appendChild(div1);
      
      if (res.brideName == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' - ,'));
        div1.appendChild(span0);
      } else {
        str0 = res.brideName.substring(0, res.brideName.indexOf(this._item.value));
        str1 = res.brideName.substring(res.brideName.indexOf(this._item.value), res.brideName.indexOf(this._item.value) + this._item.value.length);
        str2 = res.brideName.substring(res.brideName.indexOf(this._item.value) + this._item.value.length);
  
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.appendChild(document.createTextNode(str1));
        div1.appendChild(span1);
      
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div1.appendChild(span2);
      }
      
      if (res.brideAddress == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' - ,'));
        div1.appendChild(span0);
      } else {
        str0 = res.brideAddress.substring(0, res.brideAddress.indexOf(this._item.value));
        str1 = res.brideAddress.substring(res.brideAddress.indexOf(this._item.value), res.brideAddress.indexOf(this._item.value) + this._item.value.length);
        str2 = res.brideAddress.substring(res.brideAddress.indexOf(this._item.value) + this._item.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.appendChild(document.createTextNode(str1));
        div1.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div1.appendChild(span2);
      }
      
      if (res.bridePhone == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode('-'));
        div1.appendChild(span0);
      } else {
        str0 = res.bridePhone.substring(0, res.bridePhone.indexOf(this._item.value));
        str1 = res.bridePhone.substring(res.bridePhone.indexOf(this._item.value), res.bridePhone.indexOf(this._item.value) + this._item.value.length);
        str2 = res.bridePhone.substring(res.bridePhone.indexOf(this._item.value) + this._item.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.appendChild(document.createTextNode(str1));
        div1.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div1.appendChild(span2);
      }
      
      if (res.brideMobile == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode('-'));
        div1.appendChild(span0);
      } else {
        str0 = res.brideMobile.substring(0, res.brideMobile.indexOf(this._item.value));
        str1 = res.brideMobile.substring(res.brideMobile.indexOf(this._item.value), res.brideMobile.indexOf(this._item.value) + this._item.value.length);
        str2 = res.brideMobile.substring(res.brideMobile.indexOf(this._item.value) + this._item.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.appendChild(document.createTextNode(str1));
        div1.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div1.appendChild(span2);
      }
      
      if (res.brideEmail == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode('-'));
        div1.appendChild(span0);
      } else {
        str0 = res.brideEmail.substring(0, res.brideEmail.indexOf(this._item.value));
        str1 = res.brideEmail.substring(res.brideEmail.indexOf(this._item.value), res.brideEmail.indexOf(this._item.value) + this._item.value.length);
        str2 = res.brideEmail.substring(res.brideEmail.indexOf(this._item.value) + this._item.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.appendChild(document.createTextNode(str1));
        div1.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div1.appendChild(span2);
      }
      
      
      div2 = document.createElement('div');
      div2.style.width = '10px';
      div2.appendChild(document.createTextNode(''));
      td.appendChild(div2);
      
      if (res.groomName == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode('-'));
        div2.appendChild(span0);
      } else {
        str0 = res.groomName.substring(0, res.groomName.indexOf(this._item.value));
        str1 = res.groomName.substring(res.groomName.indexOf(this._item.value), res.groomName.indexOf(this._item.value) + this._item.value.length);
        str2 = res.groomName.substring(res.groomName.indexOf(this._item.value) + this._item.value.length);
  
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.appendChild(document.createTextNode(str1));
        div2.appendChild(span1);
      
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div2.appendChild(span2);
      }
      
      if (res.groomAddress == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode('-'));
        div2.appendChild(span0);
      } else {
        str0 = res.groomAddress.substring(0, res.groomAddress.indexOf(this._item.value));
        str1 = res.groomAddress.substring(res.groomAddress.indexOf(this._item.value), res.groomAddress.indexOf(this._item.value) + this._item.value.length);
        str2 = res.groomAddress.substring(res.groomAddress.indexOf(this._item.value) + this._item.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.appendChild(document.createTextNode(str1));
        div2.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div2.appendChild(span2);
      }
      
      if (res.groomPhone == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode('-'));
        div2.appendChild(span0);
      } else {
        str0 = res.groomPhone.substring(0, res.groomPhone.indexOf(this._item.value));
        str1 = res.groomPhone.substring(res.groomPhone.indexOf(this._item.value), res.groomPhone.indexOf(this._item.value) + this._item.value.length);
        str2 = res.groomPhone.substring(res.groomPhone.indexOf(this._item.value) + this._item.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.appendChild(document.createTextNode(str1));
        div2.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div2.appendChild(span2);
      }
      
      if (res.groomMobile == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode('-'));
        div2.appendChild(span0);
      } else {
        str0 = res.groomMobile.substring(0, res.groomMobile.indexOf(this._item.value));
        str1 = res.groomMobile.substring(res.groomMobile.indexOf(this._item.value), res.groomMobile.indexOf(this._item.value) + this._item.value.length);
        str2 = res.groomMobile.substring(res.groomMobile.indexOf(this._item.value) + this._item.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.appendChild(document.createTextNode(str1));
        div2.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div2.appendChild(span2);
      }
      
      if (res.groomEmail == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode('-'));
        div2.appendChild(span0);
      } else {
        str0 = res.groomEmail.substring(0, res.groomEmail.indexOf(this._item.value));
        str1 = res.groomEmail.substring(res.groomEmail.indexOf(this._item.value), res.groomEmail.indexOf(this._item.value) + this._item.value.length);
        str2 = res.groomEmail.substring(res.groomEmail.indexOf(this._item.value) + this._item.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.appendChild(document.createTextNode(str1));
        div2.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div2.appendChild(span2);
      }
    }
  }
};

