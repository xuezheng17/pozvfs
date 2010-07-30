function AbstractUsers() {
};

AbstractUsers.gui = function(unique) {
  return { addUser: document.getElementById(unique + '_addUser_button'),
           users: document.getElementById(unique + '_users_table') 
         };
};

