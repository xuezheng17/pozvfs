function AbstractUsers() {
};

AbstractUsers.gui = function(unique) {
  return { users: document.getElementById(unique + '_users_table') };
};

