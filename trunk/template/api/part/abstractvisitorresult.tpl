function AbstractVisitorResult() {
};

AbstractVisitorResult.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { title: doc.getElementById(unique + '_title_div'),
           brideName: doc.getElementById(unique + '_brideName_div'),
           bridePhone: doc.getElementById(unique + '_bridePhone_div'),
           brideEmail: doc.getElementById(unique + '_brideEmail_div'),
           groomName: doc.getElementById(unique + '_groomName_div'),
           groomPhone: doc.getElementById(unique + '_groomPhone_div'),
           groomEmail: doc.getElementById(unique + '_groomEmail_div'),
           cultureBackground: doc.getElementById(unique + '_cultureback_div'),
           ceremonyLocation: doc.getElementById(unique + '_cerelocation_div'),
           receptionLocation: doc.getElementById(unique + '_receplocation_div'),
           source: doc.getElementById(unique + '_source_div'),
           createdDate: doc.getElementById(unique + '_createdDate_div'),
           author: doc.getElementById(unique + '_author_div')
         };
};
