open Utils
module L = XList
module Option = XOption

type t = {
  str: Value.t;
  agi: Value.t;
  vit: Value.t;
  int: Value.t;
  dex: Value.t;
  luk: Value.t;
  atk: Value.t;
  matk: Value.t;
  hit: Value.t;
  crytical: Value.t;
  def: Value.t;
  mdef: Value.t;
  flee: Value.t;
  aspd: Value.t;
}

type statusType = STR | AGI | VIT | INT | DEX | LUK | ATK | MATK | HIT | CRYTICAL | DEF | MDEF | FLEE | ASPD

let initial = {
  str = Value.one;
  agi = Value.one;
  vit = Value.one;
  int = Value.one;
  dex = Value.one;
  luk = Value.one;
  atk = Value.one;
  matk = Value.one;
  hit = Value.one;
  crytical = Value.one;
  def = Value.one;
  mdef = Value.one;
  flee = Value.one;
  aspd = Value.one;
 }

module StatusUpEffect = struct
  type elem = {
    stype: statusType;
    value: Value.t;
  }
  type effect = [`StatusUp of elem]

  let toEffect (v: [> effect]) : effect option = match v with
    | `StatusUp _ as x -> Some (x)
    | _ -> None

  let unwrap (`StatusUp v) = v
  let wrap t v = `StatusUp { stype = t; value = v}
  let sameGroup a b = a.stype = b.stype && a.value.Value.vunit = b.value.Value.vunit

  let extract (fs: [> effect] list) : effect list =
    L.filterMap (fun v -> toEffect v |> Option.map unwrap) fs
    |> L.groupBy sameGroup
    |> List.map (fun xs ->
      let t = (List.hd xs).stype in
      wrap t (L.reduce Value.(@+@) (List.map (fun v -> v.value) xs))
    )

  let apply fs status =
    let apply s v =
      if v.Value.vunit = Value.Point then
        Value.(@+@) s v
      else
        Value.(@*@) s (Value.(@+@) v Value.one)
    in
    let local status e = match e.stype with
      | STR -> { status with str = apply status.str e.value }
      | AGI -> { status with agi = apply status.agi e.value }
      | VIT -> { status with vit = apply status.vit e.value }
      | INT -> { status with int = apply status.int e.value }
      | DEX -> { status with dex = apply status.dex e.value }
      | LUK -> { status with luk = apply status.luk e.value }
      | ATK -> { status with atk = apply status.atk e.value }
      | MATK -> { status with matk = apply status.matk e.value }
      | HIT -> { status with hit = apply status.hit e.value }
      | CRYTICAL -> { status with crytical = apply status.crytical e.value }
      | DEF -> { status with def = apply status.def e.value }
      | MDEF -> { status with mdef = apply status.mdef e.value }
      | FLEE -> { status with flee = apply status.flee e.value }
      | ASPD -> { status with aspd = apply status.aspd e.value }
    in
    let compare a b = match a.value.Value.vunit, b.value.Value.vunit with
      | Value.Point, Value.Ratio -> 1
      | Value.Ratio, Value.Point -> ~-1
      | _ -> 0
    in
    List.map unwrap fs
    |> List.sort compare (* Ratio first. *)
    |> List.fold_left local status

end
