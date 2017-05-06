open OUnit2

(* Name the test cases and group them together *)
let suite =
 "statusSpec" >::: StatusSpec.tests

let () =
  run_test_tt_main suite
