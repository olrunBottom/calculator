
module Race = struct
  type raceType = Angel | Animal | Devil | Dragon | Fish | Formless | Insect | Plant | Human | Undead
  type other = BOSS | Oak | Golem
  type t = { race: raceType; others : other list }
end

module Size = struct
  type t = Small | Middle | Large
end
