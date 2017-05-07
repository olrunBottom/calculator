
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

let wrap t l = { jtype = t; level = l }
