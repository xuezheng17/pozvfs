function EmailSend(doc, container, width, height, operator, now, options) {
  this._doc = doc;
  this._container = container;
  this._operator = operator;
  this._now = now;
  this._options = options;
  this._unique = MiscUtils.unique();
  this._createElements();
  this._gui = AbstractEmailSend.gui(this._unique, this._doc);
}

EmailSend.prototype._createElements = function() {
  
};