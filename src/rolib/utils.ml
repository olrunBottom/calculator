

module Value : sig
  type vunit = Point| Ratio
  type t = { left: float; right: float; vunit: vunit }
  val ( @+@ ) : t -> t -> t
  val ( @-@ ) : t -> t -> t
  val ( @*@ ) : t -> t -> t
  val ( @/@ ) : t -> t -> t
  val ( +@ ) : t -> t -> t
  val ( -@ ) : t -> t -> t
  val ( *@ ) : t -> t -> t
  val ( /@ ) : t -> t -> t
  val ( @+ ) : t -> t -> t
  val ( @- ) : t -> t -> t
  val ( @* ) : t -> t -> t
  val ( @/ ) : t -> t -> t
  val floor : t -> t
  val floatOf : float -> t
  val pairOf : (float * float) -> t
  val toPair : t -> (float * float)
  val ratio : t -> t
  val zero: t
  val one : t
end = struct
  type vunit = Point| Ratio
  type t = { left: float; right: float; vunit: vunit }
  let ( @+@ ) a b = { a with left = a.left +. b.left; right = a.right +. b.right }
  let ( @-@ ) a b = { a with left = a.left -. b.left; right = a.right -. b.right }
  let ( @*@ ) a b = { a with left = a.left *. b.left; right = a.right *. b.right }
  let ( @/@ ) a b = { a with left = a.left /. b.left; right = a.right /. b.right }

  let ( +@ ) a b = { a with left = a.left ; right = a.right +. b.right }
  let ( -@ ) a b = { a with left = a.left ; right = a.right -. b.right }
  let ( *@ ) a b = { a with left = a.left ; right = a.right *. b.right }
  let ( /@ ) a b = { a with left = a.left ; right = a.right /. b.right }

  let ( @+ ) a b = { a with left = a.left +. b.left; right = a.right }
  let ( @- ) a b = { a with left = a.left -. b.left; right = a.right }
  let ( @* ) a b = { a with left = a.left *. b.left; right = a.right }
  let ( @/ ) a b = { a with left = a.left /. b.left; right = a.right }

  let floor v = { left = Pervasives.floor v.left; right = Pervasives.floor v.right; vunit = Point }
  let floatOf x = { left = x; right = x; vunit = Point }
  let pairOf (x, y) = { left = x; right = y; vunit = Point }
  let toPair v = (v.left, v.right)
  let ratio v = { v with vunit = Ratio }
  let zero = pairOf ( 0.0, 0.0)
  let one = pairOf ( 1.0, 1.0)
end

module XList = struct
  let rec span : ('a -> bool) -> 'a list -> 'a list * 'a list =
    fun p -> function
        [] -> [],[]
      | x::xs when p x ->
          let ys,zs = span p xs in
          (x::ys,zs)
      | xs -> [],xs

  let rec groupBy : ('a -> 'a -> bool) -> 'a list -> 'a list list =
    fun p -> function
        [] -> []
      | x::xs ->
          let ys,zs = span (p x) xs in
          (x::ys) :: groupBy p zs

  let reduce f l =
    match l with
      [] -> raise (Invalid_argument "XList.reduce got empty list.")
    | hd :: tl ->
        List.fold_left f hd tl

  let filterMap f l =
    let rec loop s = function
      | [] -> List.rev s
      | hd :: tl ->
          match f hd with
          | None -> loop s tl
          | Some v -> loop (v :: s) tl
    in
    loop [] l

end

module XOption = struct
  let map f = function None -> None | Some v -> Some (f v)
  let nonEmpty f = function | [] -> None | xs -> Some (f xs)
end
