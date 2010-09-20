function AbstractDialogResult() {
};

AbstractDialogResult.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { mains: doc.getElementById(unique + '_mains_table')
         };
};
