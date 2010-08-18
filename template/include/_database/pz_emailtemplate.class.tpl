function pz_emailtemplate() {
};

pz_emailtemplate.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: '',
           subject: '',
           content: ''
         }
};
