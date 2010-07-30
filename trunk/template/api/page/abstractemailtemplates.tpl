function AbstractEmailTemplates() {
};

AbstractEmailTemplates.gui = function(unique) {
  return { addTemplate: document.getElementById(unique + '_addTemplate_button'),
           templates: document.getElementById(unique + '_templates_table')
         };
};

