function SortMethod() {
};

SortMethod.array = function() {
  return [ '{{$smarty.const.Sort_Method_ASC|escape:javascript}}',
           '{{$smarty.const.Sort_Method_DESC|escape:javascript}}'
         ]
};
