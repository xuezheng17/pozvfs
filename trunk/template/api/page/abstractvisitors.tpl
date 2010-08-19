function AbstractVisitors() {
};

AbstractVisitors.gui = function(unique) {
  return { visitorNo: document.getElementById(unique + '_visitorNo_input'),
           visitorNo1: document.getElementById(unique + '_visitorNo1_input'),
           visitorNo2: document.getElementById(unique + '_visitorNo2_input'),
           name: document.getElementById(unique + '_name_input'),
           name1: document.getElementById(unique + '_name1_input'),
           name2: document.getElementById(unique + '_name2_input'),
           phone: document.getElementById(unique + '_phone_input'),
           phone1: document.getElementById(unique + '_phone1_input'),
           phone2: document.getElementById(unique + '_phone2_input'),
           email: document.getElementById(unique + '_email_input'),
           email1: document.getElementById(unique + '_email1_input'),
           email2: document.getElementById(unique + '_email2_input'),
           weddingDayFrom: document.getElementById(unique + '_weddingDayFrom_input'),
           weddingDayTo: document.getElementById(unique + '_weddingDayTo_input'),
           createdDateFrom: document.getElementById(unique + '_createdDateFrom_input'),
           createdDateTo: document.getElementById(unique + '_createdDateTo_input'),
           inProgressingOnly: document.getElementById(unique + '_inProgressingOnly_input'),
           succeeded: document.getElementById(unique + '_succeededOnly_input'),
           failed: document.getElementById(unique + '_failedOnly_input'),
           deleted: document.getElementById(unique + '_deletedOnly_input'),
           search: document.getElementById(unique + '_search_button'),
           page: document.getElementById(unique + '_page_div'),
           visitors: document.getElementById(unique + '_visitors_table')
         };
};

