function EmailTemplate() {
};

EmailTemplate.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: '',
           subject: '',
           content: ''
         }
};
