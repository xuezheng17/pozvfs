function User() {
};

User.instance = function() {
  return { trackId: MiscUtils.unique(),
           account: '',
           password: ''
         }
};
