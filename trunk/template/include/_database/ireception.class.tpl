function IReception() {
};

IReception.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
