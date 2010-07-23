function AbstractPopupBoxSimple() {
};

AbstractPopupBoxSimple.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { panel: doc.getElementById(unique + '_panel_div')
         };
};