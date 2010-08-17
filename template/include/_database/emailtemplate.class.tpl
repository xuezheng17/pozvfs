function emailtemplate() {
};

emailtemplate.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: '',
           subject: '',
           content: ''
         }
};
