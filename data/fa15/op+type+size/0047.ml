
let rec digitsOfInt n =
  let return = [] in
  if n < 0 then return else (n mod 10) :: ((return digitsOfInt n) /. 10);;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt 1;;

*)

(* changed spans
(4,28)-(4,38)
(4,28)-(4,72)
(4,29)-(4,30)
(4,35)-(4,37)
(4,42)-(4,72)
(4,43)-(4,65)
*)

(* type error slice
(3,2)-(4,72)
(3,15)-(3,17)
(4,28)-(4,72)
(4,42)-(4,72)
(4,42)-(4,72)
(4,43)-(4,65)
(4,44)-(4,50)
(4,69)-(4,71)
*)

(* all spans
(2,20)-(4,72)
(3,2)-(4,72)
(3,15)-(3,17)
(4,2)-(4,72)
(4,5)-(4,10)
(4,5)-(4,6)
(4,9)-(4,10)
(4,16)-(4,22)
(4,28)-(4,72)
(4,28)-(4,38)
(4,29)-(4,30)
(4,35)-(4,37)
(4,42)-(4,72)
(4,43)-(4,65)
(4,44)-(4,50)
(4,51)-(4,62)
(4,63)-(4,64)
(4,69)-(4,71)
*)