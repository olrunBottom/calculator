open Utils
module L = XList
module Option = XOption
open Job

let effects job : Status.StatusUpEffect.effect list =
  let open Status.StatusUpEffect in
  let up =
    Value.pairOf (0.0, 1.0) (* right for jobbonus *)
  in
  List.assoc job.jtype JobBonusTable.table
  |> L.filterMap (fun (level, effect) -> if level <= job.level then Some(wrap effect up) else None)
  |> Status.StatusUpEffect.extract
