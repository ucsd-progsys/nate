
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else (n mod 10) :: ((myList n) mod 100) :: myList;;


(* fix

let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else (n mod 10) :: myList;;

*)

(* changed spans
(4,39)-(4,59)
(4,39)-(4,69)
(4,40)-(4,50)
(4,48)-(4,49)
(4,55)-(4,58)
(4,63)-(4,69)
*)

(* type error slice
(3,2)-(4,69)
(3,15)-(3,17)
(4,40)-(4,50)
(4,41)-(4,47)
*)

(* all spans
(2,20)-(4,69)
(3,2)-(4,69)
(3,15)-(3,17)
(4,2)-(4,69)
(4,5)-(4,11)
(4,5)-(4,6)
(4,10)-(4,11)
(4,17)-(4,19)
(4,25)-(4,69)
(4,25)-(4,35)
(4,26)-(4,27)
(4,32)-(4,34)
(4,39)-(4,69)
(4,39)-(4,59)
(4,40)-(4,50)
(4,41)-(4,47)
(4,48)-(4,49)
(4,55)-(4,58)
(4,63)-(4,69)
*)
