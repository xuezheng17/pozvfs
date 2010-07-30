function AbstractUsers() {
};

AbstractUsers.gui = function(unique) {
  return { addUser: document.getElementById(unique + '_addUser_link'),
           users: document.getElementById(unique + '_users_table') 
         };
};

