
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else [digitsOfInt (n mod 10); digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(4,25)-(4,71)
(4,26)-(4,37)
(4,26)-(4,48)
(4,38)-(4,48)
(4,39)-(4,40)
(4,50)-(4,70)
*)

(* type error slice
(2,3)-(4,73)
(2,20)-(4,71)
(3,2)-(4,71)
(4,2)-(4,71)
(4,25)-(4,71)
(4,50)-(4,61)
(4,50)-(4,70)
*)

(* all spans
(2,20)-(4,71)
(3,2)-(4,71)
(3,15)-(3,17)
(4,2)-(4,71)
(4,5)-(4,11)
(4,5)-(4,6)
(4,10)-(4,11)
(4,17)-(4,19)
(4,25)-(4,71)
(4,26)-(4,48)
(4,26)-(4,37)
(4,38)-(4,48)
(4,39)-(4,40)
(4,45)-(4,47)
(4,50)-(4,70)
(4,50)-(4,61)
(4,62)-(4,70)
(4,63)-(4,64)
(4,67)-(4,69)
*)
