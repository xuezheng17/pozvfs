function AbstractDialogSignIn() {
};

AbstractDialogSignIn.gui = function(unique, doc) {
  doc = (doc) ? doc : document;
  return { account: doc.getElementById(unique + '_account_input'),
           password: doc.getElementById(unique + '_password_input'),
           login: doc.getElementById(unique + '_login_button')
         };
};
