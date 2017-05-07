
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
type attack = t (* MOBの攻撃である"属性なし"は対象外. *)
