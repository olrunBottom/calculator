open OUnit2
open Utils
module Option = Utils.XOption
module J = Job
module JB = JobBonus
module S = Status.StatusUpEffect

let takeJobBonus1 _ =
  let effects = JB.effects (J.wrap J.Swordman 50) in
  let status' = S.apply effects Status.initial in
  assert_equal ~printer:Value.show (Value.pairOf (1.0, 7.0)) status'.Status.str

let tests = [
  "takeJobBonus1">:: takeJobBonus1
]
