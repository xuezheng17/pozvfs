function AbstractEmailTemplate() {
};

AbstractEmailTemplate.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { subject: doc.getElementById(unique + '_subject_input'),
           content: doc.getElementById(unique + '_content_input')
         };
};