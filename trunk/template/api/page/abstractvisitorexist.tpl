function AbstractVisitorExist() {
};

AbstractVisitorExist.gui = function(unique) {
  return { title: document.getElementById(unique + '_title_label'),
           next: document.getElementById(unique + '_next_button'),
           back: document.getElementById(unique + '_back_button'),
           jump: document.getElementById(unique + '_jump_button'),
           number: document.getElementById(unique + '_number_input'),
           weddingDay: document.getElementById(unique + '_weddingDay_input'),
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
           sourceAdd: document.getElementById(unique + '_sourceAdd_button'),
           firstVisitingMethod: document.getElementById(unique + '_fristVisitingMethod_button'),
           firstVisitingDate: document.getElementById(unique + '_fristVisitingDate_button'),
           update: document.getElementById(unique + '_update_button'),
           operations: document.getElementById(unique + '_operations_table'),
           succeed: document.getElementById(unique + '_succeed_button'),
           drop: document.getElementById(unique + '_drop_button'),
           email: document.getElementById(unique + '_email_button'),
           call: document.getElementById(unique + '_call_button'),
           visit:document.getElementById(unique + '_visit_button')
         };
};