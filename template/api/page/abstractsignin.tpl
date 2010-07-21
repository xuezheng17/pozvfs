function AbstractSignIn() {
};

AbstractSignIn.gui = function(unique) {
  return { account: document.getElementById(unique + '_account_input'),
           password: document.getElementById(unique + '_password_input'),
           login: document.getElementById(unique + '_login_button')
         };
};

