function Customer() {
};

Customer.instance = function() {
  return { trackId: MiscUtils.unique(),
           account: '',
           password: ''
         }
};
