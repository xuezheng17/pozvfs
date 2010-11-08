function AbstractDialogRecpCus() {
};

AbstractDialogRecpCus.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { title: document.getElementById(unique + '_title_div'),
           mains: document.getElementById(unique + '_main_table')
         };
};
