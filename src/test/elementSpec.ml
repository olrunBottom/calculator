open OUnit2
open Utils
module Option = Utils.XOption
module E = Element
module ER = ElementRegistance
module EC = ElementCompatibility

let fire_up_10 = ER.wrap E.Fire (Value.floatOf 0.2)
let fire_up_20 = ER.wrap E.Fire (Value.floatOf 0.3)

let extractRegistanceEffect1 _ =
  let effect = ER.extract E.Fire [fire_up_10; fire_up_20] in
  assert_equal (Some(Value.floatOf 0.5)) (Option.map ER.unwrap effect)

let extractRegistanceEffect2 _ =
  let effect = ER.extract E.Water [fire_up_10; fire_up_20] in
  assert_equal None effect

let extractCompatiEffect1 _ =
  let effect = EC.extract (E.Water, (E.Fire, E.L1)) in
  assert_equal (Value.floatOf 1.5) (EC.unwrap effect)

let tests = [
  "extractRegistanceEffect1">:: extractRegistanceEffect1
  ; "extractRegistanceEffect2">:: extractRegistanceEffect2
  ; "extractCompatiEffect1">:: extractCompatiEffect1
]
