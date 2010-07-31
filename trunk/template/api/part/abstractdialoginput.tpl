function AbstractDialogInput() {
};

AbstractDialogInput.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { input: doc.getElementById(unique + '_input_text'),
           save: doc.getElementById(unique + '_save_button'),
           cancel: doc.getElementById(unique + '_cancel_button')
         };
};
