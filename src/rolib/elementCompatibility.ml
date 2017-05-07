
open Utils
module L = XList
module Option = XOption
open Element

type effect = [`ElementCompatibility of Value.t]

let toEffect (v:[> effect]) : effect option = match v with
  | `ElementCompatibility _ as x -> Some(x)
  | _ -> None

let unwrap (`ElementCompatibility v) = v
let wrap v : effect = `ElementCompatibility v

let table =
  ElementCompatiTable.table
  |> List.map (fun (k, v) -> k, `ElementCompatibility (Value.floatOf v))

let extract (crashElements : (attack * defence)): effect =
  List.assoc crashElements table
