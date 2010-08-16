function SortMethod() {
};

SortMethod.array = function() {
  return [ '{{$smarty.const.Sort_Method_Last_Updated|escape:javascript}}',
           '{{$smarty.const.Sort_Method_Wedding_Day|escape:javascript}}',
           '{{$smarty.const.Sort_Method_FollowUp_Times|escape:javascript}}'
         ]
};
