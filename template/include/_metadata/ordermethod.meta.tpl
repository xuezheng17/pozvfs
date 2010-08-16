function OrderMethod() {
};

OrderMethod.array = function() {
  return [ '{{$smarty.const.Order_Method_ASC|escape:javascript}}',
           '{{$smarty.const.Order_Method_DESC|escape:javascript}}'
         ]
};
