function AbstractEmailTemplateEdit() {
};

AbstractEmailTemplateEdit.gui = function(unique) {
  return { name: document.getElementById(unique + '_name_input'),
           content: document.getElementById(unique + '_content_input'),
           save: document.getElementById(unique + '_save_button')
         };
};