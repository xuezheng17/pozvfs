function AbstractVisitorNew() {
};

AbstractVisitorNew.gui = function(unique) {
  return { weddingDay: document.getElementById(unique + '_weddingDay_input'),
           brideName: document.getElementById(unique + '_brideName_input'),
           brideAddress: document.getElementById(unique + '_brideAddress_input'),
           bridePhone: document.getElementById(unique + '_bridePhone_input'),
           brideMobile: document.getElementById(unique + '_brideMobile_input'),
           brideEmail: document.getElementById(unique + '_brideEmail_input'),
           groomName: document.getElementById(unique + '_groomName_input'),
           groomAddress: document.getElementById(unique + '_groomAddress_input'),
           groomPhone: document.getElementById(unique + '_groomPhone_input'),
           groomMobile: document.getElementById(unique + '_groomMobile_input'),
           groomEmail: document.getElementById(unique + '_groomEmail_input'),
           culturalBackground: document.getElementById(unique + '_culturalBackground_select'),
           culturalBackgroundAdd: document.getElementById(unique + '_culturalBackgroundAdd_button'),
           ceremonyLocation: document.getElementById(unique + '_ceremoneyLocation_select'),
           ceremonyLocationAdd: document.getElementById(unique + '_ceremoneyLocationAdd_button'),
           receptionLocation: document.getElementById(unique + '_receptionLocation_select'),
           receptionLocationAdd: document.getElementById(unique + '_receptionLocationAdd_button'),
           source: document.getElementById(unique + '_source_select'),
           officerNote: document.getElementById(unique + '_officerNote_input'),
           sourceAdd: document.getElementById(unique + '_sourceAdd_button'),
           firstVisitingMethod: document.getElementById(unique + '_fristVisitingMethod_select'),
           firstVisitingDate: document.getElementById(unique + '_fristVisitingDate_input'),
           save: document.getElementById(unique + '_save_button')
         };
};
