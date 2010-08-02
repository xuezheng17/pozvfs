function AbstractVisitors() {
};

AbstractVisitors.gui = function(unique) {
  return { visitorNo: document.getElementById(unique + '_visitorNo_input'),
           name: document.getElementById(unique + '_name_input'),
           phone: document.getElementById(unique + '_phone_input'),
           email: document.getElementById(unique + '_email_input'),
           weddingDayFrom: document.getElementById(unique + '_weddingDayFrom_input'),
           weddingDayTo: document.getElementById(unique + '_weddingDayTo_input'),
           createdDateFrom: document.getElementById(unique + '_createdDateFrom_input'),
           createdDateTo: document.getElementById(unique + '_createdDateTo_input'),
           inProgressingOnly: document.getElementById(unique + '_inProgressingOnly_input'),
           succeeded: document.getElementById(unique + '_succeededOnly_input'),
           failed: document.getElementById(unique + '_failedOnly_input'),
           search: document.getElementById(unique + '_search_button'),
           page: document.getElementById(unique + '_page_div'),
           visitors: document.getElementById(unique + '_visitors_table')
         };
};

