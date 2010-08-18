function pz_ireception() {
};

pz_ireception.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
