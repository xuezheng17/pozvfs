function AbstractEmailSend() {
};

AbstractEmailSend.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { visitorInfo: doc.getElementById(unique + '_visitorInfo_div'),
           templateSelect: doc.getElementById(unique + '_template_select'),
           subject: doc.getElementById(unique + '_subject_input'),
           content: doc.getElementById(unique + '_content_input'),
           send: doc.getElementById(unique + '_send_button'),
           cancel: doc.getElementById(unique + '_cancel_button')
         };
};
