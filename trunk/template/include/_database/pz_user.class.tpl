function pz_user() {
};

pz_user.instance = function() {
  return { trackId: MiscUtils.unique(),
           account: '',
           password: ''
         }
};
