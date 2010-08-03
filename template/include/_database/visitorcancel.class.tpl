function VisitorCancel() {
};

VisitorCancel.instance = function() {
  return { trackId: MiscUtils.unique(),
           date: SimpleDate.create(),
           userAccount: '',
           message: ''
         }
};
