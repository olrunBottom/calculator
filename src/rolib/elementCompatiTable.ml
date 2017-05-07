
open Element

let table = [
  (Neutral, (Neutral, L1)), 1.0;
  (Neutral, (Water, L1)), 1.0;
  (Neutral, (Earth, L1)), 1.0;
  (Neutral, (Fire, L1)), 1.0;
  (Neutral, (Wind, L1)), 1.0;
  (Neutral, (Poison, L1)), 1.0;
  (Neutral, (Holy, L1)), 1.0;
  (Neutral, (Shadow, L1)), 1.0;
  (Neutral, (Ghost, L1)), 0.25;
  (Neutral, (Undead, L1)), 1.0;

  (Water, (Neutral, L1)), 1.0;
  (Water, (Water, L1)), 0.25;
  (Water, (Earth, L1)), 1.0;
  (Water, (Fire, L1)), 1.5;
  (Water, (Wind, L1)), 0.5;
  (Water, (Poison, L1)), 1.0;
  (Water, (Holy, L1)), 0.75;
  (Water, (Shadow, L1)), 1.0;
  (Water, (Ghost, L1)), 1.0;
  (Water, (Undead, L1)), 1.0;

  (Earth, (Neutral, L1)), 1.0;
  (Earth, (Water, L1)), 1.0;
  (Earth, (Earth, L1)), 0.25;
  (Earth, (Fire, L1)), 0.5;
  (Earth, (Wind, L1)), 1.5;
  (Earth, (Poison, L1)), 1.0;
  (Earth, (Holy, L1)), 0.75;
  (Earth, (Shadow, L1)), 1.0;
  (Earth, (Ghost, L1)), 1.0;
  (Earth, (Undead, L1)), 1.0;

  (Fire, (Neutral, L1)), 1.0;
  (Fire, (Water, L1)), 0.5;
  (Fire, (Earth, L1)), 1.5;
  (Fire, (Fire, L1)), 0.25;
  (Fire, (Wind, L1)), 1.0;
  (Fire, (Poison, L1)), 1.0;
  (Fire, (Holy, L1)), 0.75;
  (Fire, (Shadow, L1)), 1.0;
  (Fire, (Ghost, L1)), 1.0;
  (Fire, (Undead, L1)), 1.25;

  (Wind, (Neutral, L1)), 1.0;
  (Wind, (Water, L1)), 1.75;
  (Wind, (Earth, L1)), 0.5;
  (Wind, (Fire, L1)), 1.0;
  (Wind, (Wind, L1)), 0.25;
  (Wind, (Poison, L1)), 1.0;
  (Wind, (Holy, L1)), 0.75;
  (Wind, (Shadow, L1)), 1.0;
  (Wind, (Ghost, L1)), 1.0;
  (Wind, (Undead, L1)), 1.0;
  (* TODO *)
]
