function AbstractPopupBox() {
};

AbstractPopupBox.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { title: doc.getElementById(unique + '_title_img'),
           menu: doc.getElementById(unique + '_menu_div'),
           panel: doc.getElementById(unique + '_panel_div'),
           close: doc.getElementById(unique + '_close_button')
         };
};

