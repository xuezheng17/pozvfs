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
  this._brideName = (options && options.brideName) ? options.brideName : null;
  this._brideAddress = (options && options.brideAddress) ? options.brideAddress : null;
  this._bridePhone = (options && options.bridePhone) ? options.bridePhone : null;
  this._brideMobile = (options && options.brideMobile) ? options.brideMobile : null;
  this._brideEmail = (options && options.brideEmail) ? options.brideEmail : null;
  this._groomName = (options && options.groomName) ? options.groomName : null;
  this._groomAddress = (options && options.groomAddress) ? options.groomAddress : null;
  this._groomPhone = (options && options.groomPhone) ? options.groomPhone : null;
  this._groomMobile = (options && options.groomMobile) ? options.groomMobile : null;
  this._groomEmail = (options && options.groomEmail) ? options.groomEmail : null;
  
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
      td.style.height = '30px';
      td.style.textAlign = 'left';
      td.style.cursor = 'default';
      td.style.verticalAlign = 'middle';
      td.style.padding = '6px 3px';
      td._obj = res;
      td.onmouseover = function() {this.style.backgroundColor = '#e2eaff';};
      td.onmouseout = function() {this.style.backgroundColor = '#fff';};
      td.onclick = function() { location.href = '?t=visitorexist&m=' + MiscUtils.encode({ a: 1, b: 2}) + '&opts=' + MiscUtils.encode({id: this._obj.id});
                              };
                              
      var tmp = document.createElement('span');
      tmp.style.color = '#0000CC';
      tmp.style.fontWeight = 'bold';
      tmp.appendChild(document.createTextNode(POZVFSUtils.visitorId(res.id)));
      
      div1 = document.createElement('div');
      div1.appendChild(tmp);
      td.appendChild(div1);
      
      if (res.brideName == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' -,'));
        div1.appendChild(span0);
      } else {
        str0 = res.brideName.substring(0, res.brideName.indexOf(this._brideName.value));
        str1 = res.brideName.substring(res.brideName.indexOf(this._brideName.value), res.brideName.indexOf(this._brideName.value) + this._brideName.value.length);
        str2 = res.brideName.substring(res.brideName.indexOf(this._brideName.value) + this._brideName.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.style.color = '';
        span1.appendChild(document.createTextNode(str1));
        div1.appendChild(span1);
      
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div1.appendChild(span2);
      }
      
      if (res.brideAddress == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' -,'));
        div1.appendChild(span0);
      } else {
        str0 = res.brideAddress.substring(0, res.brideAddress.indexOf(this._brideAddress.value));
        str1 = res.brideAddress.substring(res.brideAddress.indexOf(this._brideAddress.value), res.brideAddress.indexOf(this._brideAddress.value) + this._brideAddress.value.length);
        str2 = res.brideAddress.substring(res.brideAddress.indexOf(this._brideAddress.value) + this._brideAddress.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.style.color = '';
        span1.appendChild(document.createTextNode(str1));
        div1.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div1.appendChild(span2);
      }
      
      if (res.bridePhone == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' -,'));
        div1.appendChild(span0);
      } else {
        str0 = res.bridePhone.substring(0, res.bridePhone.indexOf(this._bridePhone.value));
        str1 = res.bridePhone.substring(res.bridePhone.indexOf(this._bridePhone.value), res.bridePhone.indexOf(this._bridePhone.value) + this._bridePhone.value.length);
        str2 = res.bridePhone.substring(res.bridePhone.indexOf(this._bridePhone.value) + this._bridePhone.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.style.color = '';
        span1.appendChild(document.createTextNode(str1));
        div1.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div1.appendChild(span2);
      }
      
      if (res.brideMobile == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' -, '));
        div1.appendChild(span0);
      } else {
        str0 = res.brideMobile.substring(0, res.brideMobile.indexOf(this._brideMobile.value));
        str1 = res.brideMobile.substring(res.brideMobile.indexOf(this._brideMobile.value), res.brideMobile.indexOf(this._brideMobile.value) + this._brideMobile.value.length);
        str2 = res.brideMobile.substring(res.brideMobile.indexOf(this._brideMobile.value) + this._brideMobile.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.style.color = '';
        span1.appendChild(document.createTextNode(str1));
        div1.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div1.appendChild(span2);
      }
      
      if (res.brideEmail == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' - '));
        div1.appendChild(span0);
      } else {
        str0 = res.brideEmail.substring(0, res.brideEmail.indexOf(this._brideEmail.value));
        str1 = res.brideEmail.substring(res.brideEmail.indexOf(this._brideEmail.value), res.brideEmail.indexOf(this._brideEmail.value) + this._brideEmail.value.length);
        str2 = res.brideEmail.substring(res.brideEmail.indexOf(this._brideEmail.value) + this._brideEmail.value.length);
      
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.style.color = '';
        span1.appendChild(document.createTextNode(str1));
        div1.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2));
        div1.appendChild(span2);
      }
      
      
      div2 = document.createElement('div');
      div2.style.margin = '3px 0 0 0';
      var span = document.createElement('span');
      span.style.margin = '0 0 0 31px';
      span.appendChild(document.createTextNode(' '));
      div2.appendChild(span);
      td.appendChild(div2);
      
      if (res.groomName == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' -, '));
        div2.appendChild(span0);
      } else {
        str0 = res.groomName.substring(0, res.groomName.indexOf(this._groomName.value));
        str1 = res.groomName.substring(res.groomName.indexOf(this._groomName.value), res.groomName.indexOf(this._groomName.value) + this._groomName.value.length);
        str2 = res.groomName.substring(res.groomName.indexOf(this._groomName.value) + this._groomName.value.length);
      
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.style.color = '';
        span1.appendChild(document.createTextNode(str1));
        div2.appendChild(span1);
      
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div2.appendChild(span2);
      }
      
      if (res.groomAddress == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' -, '));
        div2.appendChild(span0);
      } else {
        str0 = res.groomAddress.substring(0, res.groomAddress.indexOf(this._groomAddress.value));
        str1 = res.groomAddress.substring(res.groomAddress.indexOf(this._groomAddress.value), res.groomAddress.indexOf(this._groomAddress.value) + this._groomAddress.value.length);
        str2 = res.groomAddress.substring(res.groomAddress.indexOf(this._groomAddress.value) + this._groomAddress.value.length);
      
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.style.color = '';
        span1.appendChild(document.createTextNode(str1));
        div2.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div2.appendChild(span2);
      }
      
      if (res.groomPhone == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' -, '));
        div2.appendChild(span0);
      } else {
        str0 = res.groomPhone.substring(0, res.groomPhone.indexOf(this._groomPhone.value));
        str1 = res.groomPhone.substring(res.groomPhone.indexOf(this._groomPhone.value), res.groomPhone.indexOf(this._groomPhone.value) + this._groomPhone.value.length);
        str2 = res.groomPhone.substring(res.groomPhone.indexOf(this._groomPhone.value) + this._groomPhone.value.length);
      
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.style.color = '';
        span1.appendChild(document.createTextNode(str1));
        div2.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div2.appendChild(span2);
      }
      
      if (res.groomMobile == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' -, '));
        div2.appendChild(span0);
      } else {
        str0 = res.groomMobile.substring(0, res.groomMobile.indexOf(this._groomMobile.value));
        str1 = res.groomMobile.substring(res.groomMobile.indexOf(this._groomMobile.value), res.groomMobile.indexOf(this._groomMobile.value) + this._groomMobile.value.length);
        str2 = res.groomMobile.substring(res.groomMobile.indexOf(this._groomMobile.value) + this._groomMobile.value.length);
      
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.style.color = '';
        span1.appendChild(document.createTextNode(str1));
        div2.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2 + ', '));
        div2.appendChild(span2);
      }
      
      if (res.groomEmail == '') {
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(' - '));
        div2.appendChild(span0);
      } else {
        str0 = res.groomEmail.substring(0, res.groomEmail.indexOf(this._groomEmail.value));
        str1 = res.groomEmail.substring(res.groomEmail.indexOf(this._groomEmail.value), res.groomEmail.indexOf(this._groomEmail.value) + this._groomEmail.value.length);
        str2 = res.groomEmail.substring(res.groomEmail.indexOf(this._groomEmail.value) + this._groomEmail.value.length);
      
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = 'bold';
        span1.style.color = '';
        span1.appendChild(document.createTextNode(str1));
        div2.appendChild(span1);
        
        span2= document.createElement('span');
        span2.appendChild(document.createTextNode(str2));
        div2.appendChild(span2);
      }
    }
  }
};

