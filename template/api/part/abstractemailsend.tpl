function AbstractEmailSend() {
};

AbstractEmailSend.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { templateSelect: doc.getElementById(unique + '_template_select'),
           templateDiv: doc.getElementById(unique + '_template_div'),
           subject: doc.getElementById(unique + '_subject_input'),
           content: doc.getElementById(unique + '_content_input'),
           send: doc.getElementById(unique + '_send_button'),
           cancel: doc.getElementById(unique + '_cancel_button')
         };
};
