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
        span0.style.color = '#ff0000';
        span0.appendChild(document.createTextNode('No Name, '));
        div1.appendChild(span0);
      } else {
        var index = -1;
        if (res.brideName.toLowerCase().indexOf(this._brideName.value.toLowerCase()) != -1) {
          index = res.brideName.toLowerCase().indexOf(this._brideName.value.toLowerCase());
        }
        
        str0 = res.brideName.substring(0, index);
        str1 = res.brideName.substring(index, index + this._brideName.value.length);
        str2 = res.brideName.substring(index + this._brideName.value.length);
      
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = (index == -1) ? 'regular' : 'bold';
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
        span0.style.color = '#ff0000';
        span0.appendChild(document.createTextNode('No Address, '));
        div1.appendChild(span0);
      } else {
        var index = -1;
        if (res.brideAddress.toLowerCase().indexOf(this._brideAddress.value.toLowerCase()) != -1) {
          index = res.brideAddress.toLowerCase().indexOf(this._brideAddress.value.toLowerCase());
        }
        
        str0 = res.brideAddress.substring(0, index);
        str1 = res.brideAddress.substring(index, index + this._brideAddress.value.length);
        str2 = res.brideAddress.substring(index + this._brideAddress.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = (index == -1) ? 'regular' : 'bold';
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
        span0.style.color = '#ff0000';
        span0.appendChild(document.createTextNode('No Phone, '));
        div1.appendChild(span0);
      } else {
        var index = -1;
        if (res.bridePhone.toLowerCase().indexOf(this._bridePhone.value.toLowerCase()) != -1) {
          index = res.bridePhone.toLowerCase().indexOf(this._bridePhone.value.toLowerCase());
        }
        str0 = res.bridePhone.substring(0, index);
        str1 = res.bridePhone.substring(index, index + this._bridePhone.value.length);
        str2 = res.bridePhone.substring(index + this._bridePhone.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = (index == -1) ? 'regular' : 'bold';
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
        span0.style.color = '#ff0000';
        span0.appendChild(document.createTextNode('No Mobile, '));
        div1.appendChild(span0);
      } else {
        var index = -1;
        if (res.brideMobile.toLowerCase().indexOf(this._brideMobile.value.toLowerCase()) != -1) {
          index = res.brideMobile.toLowerCase().indexOf(this._brideMobile.value.toLowerCase());
        }
        
        str0 = res.brideMobile.substring(0, index);
        str1 = res.brideMobile.substring(index, index + this._brideMobile.value.length);
        str2 = res.brideMobile.substring(index + this._brideMobile.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = (index == -1) ? 'regular' : 'bold';
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
        span0.style.color = '#ff0000';
        span0.appendChild(document.createTextNode('No Email'));
        div1.appendChild(span0);
      } else {
        var index = -1;
        if (res.brideEmail.toLowerCase().indexOf(this._brideEmail.value.toLowerCase()) != -1) {
          index = res.brideEmail.toLowerCase().indexOf(this._brideEmail.value.toLowerCase());
        }
        str0 = res.brideEmail.substring(0, index);
        str1 = res.brideEmail.substring(index, index + this._brideEmail.value.length);
        str2 = res.brideEmail.substring(index + this._brideEmail.value.length);
      
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div1.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = (index == -1) ? 'regular' : 'bold';
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
        span0.style.color = '#ff0000';
        span0.appendChild(document.createTextNode('No Name, '));
        div2.appendChild(span0);
      } else {
        var index = -1;
        if (res.groomName.toLowerCase().indexOf(this._groomName.value.toLowerCase()) != -1) {
          index = res.groomName.toLowerCase().indexOf(this._groomName.value.toLowerCase());
        }
        str0 = res.groomName.substring(0, index);
        str1 = res.groomName.substring(index, index + this._groomName.value.length);
        str2 = res.groomName.substring(index + this._groomName.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = (index == -1) ? 'regular' : 'bold';
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
        span0.style.color = '#ff0000';
        span0.appendChild(document.createTextNode('No Address, '));
        div2.appendChild(span0);
      } else {
        var index = -1;
        if (res.groomAddress.toLowerCase().indexOf(this._groomAddress.value.toLowerCase()) != -1) {
          index = res.groomAddress.toLowerCase().indexOf(this._groomAddress.value.toLowerCase());
        }
        str0 = res.groomAddress.substring(0, index);
        str1 = res.groomAddress.substring(index, index + this._groomAddress.value.length);
        str2 = res.groomAddress.substring(index + this._groomAddress.value.length);
        
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = (index == -1) ? 'regular' : 'bold';
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
        span0.style.color = '#ff0000';
        span0.appendChild(document.createTextNode('No Phone, '));
        div2.appendChild(span0);
      } else {
        var index = -1;
        if (res.groomPhone.toLowerCase().indexOf(this._groomPhone.value.toLowerCase()) != -1) {
          index = res.groomPhone.toLowerCase().indexOf(this._groomPhone.value.toLowerCase());
        }
        str0 = res.groomPhone.substring(0, index);
        str1 = res.groomPhone.substring(index, index + this._groomPhone.value.length);
        str2 = res.groomPhone.substring(index + this._groomPhone.value.length);
      
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = (index == -1) ? 'regular' : 'bold';
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
        span0.style.color = '#ff0000';
        span0.appendChild(document.createTextNode('No Mobile, '));
        div2.appendChild(span0);
      } else {
        var index = -1;
        if (res.groomMobile.toLowerCase().indexOf(this._groomMobile.value.toLowerCase()) != -1) {
          index = res.groomMobile.toLowerCase().indexOf(this._groomMobile.value.toLowerCase());
        }
        
        str0 = res.groomMobile.substring(0, index);
        str1 = res.groomMobile.substring(index, index + this._groomMobile.value.length);
        str2 = res.groomMobile.substring(index + this._groomMobile.value.length);
      
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = (index == -1) ? 'regular' : 'bold';
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
        span0.style.color = '#ff0000';
        span0.appendChild(document.createTextNode('No Email'));
        div2.appendChild(span0);
      } else {
        var index = -1;
        if (res.groomEmail.toLowerCase().indexOf(this._groomEmail.value.toLowerCase()) != -1) {
          index = res.groomEmail.toLowerCase().indexOf(this._groomEmail.value.toLowerCase());
        }
        str0 = res.groomEmail.substring(0, index);
        str1 = res.groomEmail.substring(index, index + this._groomEmail.value.length);
        str2 = res.groomEmail.substring(index + this._groomEmail.value.length);
      
        span0 = document.createElement('span');
        span0.style.margin = '0 0 0 8px';
        span0.appendChild(document.createTextNode(str0));
        div2.appendChild(span0);
  
        span1= document.createElement('span');
        span1.style.fontWeight = (index == -1) ? 'regular' : 'bold';
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

