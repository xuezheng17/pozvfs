function AbstractDialogHistory() {
};

AbstractDialogHistory.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { title: doc.getElementById(unique + '_title_div'),
           mains: doc.getElementById(unique + '_mains_table')
         };
};
