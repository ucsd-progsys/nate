
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec additivePersistence n =
  match n with | [] -> [] | h::t -> t + (digitsOfInt (additivePersistence h));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else 1 + (additivePersistence (sumList (digitsOfInt n)));;

*)

(* changed spans
(5,28)-(6,77)
(6,8)-(6,9)
(6,23)-(6,25)
(6,36)-(6,37)
(6,36)-(6,77)
(6,40)-(6,77)
(6,41)-(6,52)
(6,53)-(6,76)
(6,54)-(6,73)
*)

(* type error slice
(3,16)-(3,38)
(3,16)-(3,51)
(3,17)-(3,28)
(3,39)-(3,40)
(5,3)-(6,79)
(5,28)-(6,77)
(6,2)-(6,77)
(6,2)-(6,77)
(6,2)-(6,77)
(6,2)-(6,77)
(6,2)-(6,77)
(6,8)-(6,9)
(6,23)-(6,25)
(6,36)-(6,37)
(6,36)-(6,77)
(6,36)-(6,77)
(6,36)-(6,77)
(6,40)-(6,77)
(6,41)-(6,52)
(6,53)-(6,76)
(6,54)-(6,73)
(6,74)-(6,75)
*)