function HandleTest(gui, operator, now, options) {
  this._gui = gui;
  this._operator = operator;
  this._now = now;
  this._options = options;
  
  this._createElements();
};

HandleTest.prototype._createElements = function() {
  var tmp = new VisitorResult(document, this._gui.div, 800, 600, this._operator, this._now, this._options);
  console.log(tmp._gui);
};
