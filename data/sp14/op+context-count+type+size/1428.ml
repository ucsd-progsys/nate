
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = if (sumList (digitsOfInt n)) > 9 then 20;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9 then 0 else 1;;

*)

(* changed spans
(12,32)-(12,72)
(12,70)-(12,72)
*)

(* type error slice
(12,32)-(12,72)
(12,32)-(12,72)
(12,32)-(12,72)
(12,70)-(12,72)
*)