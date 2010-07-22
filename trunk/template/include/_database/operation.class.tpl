function Operation() {
};

Operation.instance = function() {
  return { trackId: MiscUtils.unique(),
           visitId: '',
           operateType: '',
           operator: '',
           operatedDate: SimpleDate.create(),
           content: ''
         }
};
