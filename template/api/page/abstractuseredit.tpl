function AbstractUserEdit() {
};

AbstractUserEdit.gui = function(unique) {
  return { account: document.getElementById(unique + '_account_input'),
           password: document.getElementById(unique + '_password_input'),
           save: document.getElementById(unique + '_save_button')
         };
};

