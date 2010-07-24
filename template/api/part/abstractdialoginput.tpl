function AbstractDialogInput() {
};

AbstractDialogInput.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { title: doc.getElementById(unique + '_title_div'),
           input: doc.getElementById(unique + '_input_text')
         };
};
