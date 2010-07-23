function ISource() {
};

ISource.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
