function pz_operation() {
};

pz_operation.instance = function() {
  return { trackId: MiscUtils.unique(),
           visitId: '',
           cancelled: 0,
           operateType: '',
           operator: '',
           operatedDate: SimpleDate.create(),
           content: '',
           prevOperator: '',
           firstVisited: 0
         }
};
