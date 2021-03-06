
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNumbs n = match n with | [] -> 0 | h::t -> h + (addNumbs t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match digits n with
  | [] -> 0
  | h::t -> if (addNumbs (h :: t)) >= 10 then false else true;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNumbs n = match n with | [] -> 0 | h::t -> h + (addNumbs t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match digits n with
  | [] -> 0
  | h::t -> if (addNumbs (h :: t)) >= 10 then 1 else 2;;

*)

(* changed spans
(12,46)-(12,51)
(12,57)-(12,61)
*)

(* type error slice
(10,2)-(12,61)
(11,10)-(11,11)
(12,12)-(12,61)
(12,57)-(12,61)
*)

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,60)
(3,48)-(3,49)
(3,25)-(3,47)
(3,26)-(3,37)
(3,38)-(3,46)
(3,39)-(3,40)
(3,43)-(3,45)
(3,50)-(3,60)
(3,51)-(3,59)
(3,51)-(3,52)
(3,57)-(3,59)
(5,17)-(5,70)
(5,21)-(5,70)
(5,27)-(5,28)
(5,42)-(5,43)
(5,54)-(5,70)
(5,54)-(5,55)
(5,58)-(5,70)
(5,59)-(5,67)
(5,68)-(5,69)
(7,11)-(7,34)
(7,15)-(7,34)
(7,15)-(7,26)
(7,27)-(7,34)
(7,28)-(7,31)
(7,32)-(7,33)
(9,28)-(12,61)
(10,2)-(12,61)
(10,8)-(10,16)
(10,8)-(10,14)
(10,15)-(10,16)
(11,10)-(11,11)
(12,12)-(12,61)
(12,15)-(12,40)
(12,15)-(12,34)
(12,16)-(12,24)
(12,25)-(12,33)
(12,26)-(12,27)
(12,31)-(12,32)
(12,38)-(12,40)
(12,46)-(12,51)
(12,57)-(12,61)
*)
