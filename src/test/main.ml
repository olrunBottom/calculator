open OUnit2

(* Name the test cases and group them together *)
let suite =
  "suite" >::: [
    "statusSpec" >::: StatusSpec.tests
  ; "elementSpec" >::: ElementSpec.tests
  ]

let () =
  run_test_tt_main suite
