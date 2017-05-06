open Utils
module L = XList
module Option = XOption

type t =
    Neutral
  | Water
  | Earth
  | Fire
  | Wind
  | Poison
  | Holy
  | Shadow
  | Ghost
  | Undead

type defenceLevel = L1 | L2 | L3 | L4
type defence = t * defenceLevel
type attack = t

module ElementRegistance = struct
  type effect = [`ElementRegistance of (t * Value.t)]

  let isEffect (t:t) (v:'a) = match v with
    | `ElementRegistance (x, _) -> t = x
    | _ -> false

  let unwrap (`ElementRegistance (_, v)) = v
  let wrap t v = `ElementRegistance (t, v)

  let extract t fs : effect option =
    L.filterMap (fun v -> if isEffect t v then Some (unwrap v) else None) fs
    |> Option.nonEmpty (fun v -> wrap t (L.reduce Value.(@+@) v))

end

module ElementCompatibility = struct
  type effect = [`ElementCompatibility of Value.t]

  let isEffect (t:t) (v:'a) = match v with
    | `ElementCompatibility (x, _) -> t = x
    | _ -> false

  let unwrap (`ElementCompatibility v) = v
  let wrap v = `ElementCompatibility v

  let _table = [
    (Neutral, (Neutral, L1)), 1.0;
    (* TODO *)
  ]
  let table = List.map (fun (k, v) -> k, `ElementCompatibility (Value.floatOf v)) _table

  let effect (crashElements : (attack * defence)): effect =
    List.assoc crashElements table

end
