open Utils
module L = XList
module Option = XOption

type jobType = Novice
  | Swordman | Kinght | Crusader | LoadKinght | Paladin | RuneKnight
  | Magican | Wizard | Sage | HighWizard | Professor | Warlock | Sorcerer
  | Archar | Hunter | Bard | Dancer| Sniper | Clown | Gypsy | Ranger | Minstrel | Wanderer
  | Acolyte | Priest | Monk | HighPriest | Champion | Archbishop | Sura
  | Thief | Assasin | Rogue | AssasinCross | Chaser | GuillotineCross | ShasowChaser
  | Merchant | BlackSmith | Alchemist | WthiteSmith | Creater | Mechanic | Genetic
  | TechwonKid | Kwonsung | SoulLiker

type t = {
  jtype : jobType;
  level : int;
}

let jobBonusTable = let open Status in [
  (Novice, []);
  (Swordman, [2, STR;
              6, VIT;
              10, DEX;
              14, STR;
              18, VIT;
              22, DEX;
              26, LUK;
              30, AGI;
              33, STR;
              36, DEX;
              38, VIT;
              40, STR;
              42, VIT;
              44, LUK;
              46, AGI;
              47, STR;
              49, STR;
              50, STR;
              ]);
]

let jobBonus job : Status.StatusUpEffect.effect list =
  let open Status.StatusUpEffect in
  let up =
    Value.pairOf (0.0, 1.0) (* right for jobbonus *)
  in
  List.assoc job.jtype jobBonusTable
  |> L.filterMap (fun (level, effect) -> if level <= job.level then Some(wrap effect up) else None)
