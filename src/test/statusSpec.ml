open OUnit2
open Utils
open Status
open Status.StatusUpEffect

let status = Status.initial
let agi_up_10 = wrap AGI (Value.pairOf (0.0, 10.))
let aspd_up_20per = wrap ASPD (Value.floatOf 0.2)

let addEffect1 _ =
  let status' = apply [agi_up_10] status in
  assert_equal ~printer:Value.show (Value.pairOf (1.0, 10.0)) status'.agi

let extractEffect1 _ =
  let extracted = extract [agi_up_10; `TheOtherEffect] in
  assert_equal [agi_up_10] extracted

let mulEffect1 _ =
  let status' = apply [aspd_up_20per] status in
  assert_equal 1.2 status'.aspd.Value.left

let tests =[
  "addEffect1">:: addEffect1;
  "extractEffect1">:: extractEffect1;
  "mulEffect1">:: mulEffect1;
]
