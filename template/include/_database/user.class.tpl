function user() {
};

user.instance = function() {
  return { trackId: MiscUtils.unique(),
           account: '',
           password: ''
         }
};
