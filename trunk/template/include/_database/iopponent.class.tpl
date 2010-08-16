function IOpponent() {
};

IOpponent.instance = function() {
  return { trackId: MiscUtils.unique(),
           name: ''
         }
};
