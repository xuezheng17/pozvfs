function VisitorMethod() {
};

VisitorMethod.array = function() {
  return [ '{{$smarty.const.Visitor_Method_Phone|escape:javascript}}',
           '{{$smarty.const.Visitor_Method_Email|escape:javascript}}',
           '{{$smarty.const.Visitor_Method_Visitor|escape:javascript}}'
         ]
};
