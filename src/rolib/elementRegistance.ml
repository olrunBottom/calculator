open Utils
module L = XList
module Option = XOption
open Element

type effect = [`ElementRegistance of (t * Value.t)]

let toEffect (t:t) (v: [> effect]) : effect option = match v with
  | `ElementRegistance (t', _) as x when t' = t -> Some(x)
  | _ -> None

let unwrap (`ElementRegistance (_, v)) = v
let wrap t v : effect= `ElementRegistance (t, v)

let extract t (fs: [> effect] list): effect option =
  fs
  |> L.filterMap (fun v -> toEffect t v |> Option.map unwrap)
  |> Option.nonEmpty (fun v -> wrap t (L.reduce Value.(@+@) v))
