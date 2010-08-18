function AbstractDialogInput() {
};

AbstractDialogInput.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { opponent: doc.getElementById(unique + '_opponent_select'),
           category: doc.getElementById(unique + '_category_select'),
           add: doc.getElementById(unique + '_add_button'),
           input: doc.getElementById(unique + '_input_text'),
           save: doc.getElementById(unique + '_save_button'),
           cancel: doc.getElementById(unique + '_cancel_button')
         };
};
