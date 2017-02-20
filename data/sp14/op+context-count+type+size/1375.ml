
let rec digitsOfInt n =
  let rec integers a b =
    if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
  integers n 0;;


(* fix

let rec digitsOfInt n =
  if n = 0
  then [0]
  else
    (let rec integers a b =
       if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
     integers n []);;

*)

(* changed spans
(3,2)-(5,14)
(3,19)-(4,60)
(5,2)-(5,10)
(5,11)-(5,12)
(5,13)-(5,14)
*)

(* type error slice
(4,25)-(4,33)
(4,25)-(4,60)
(4,43)-(4,60)
(5,2)-(5,10)
(5,2)-(5,14)
(5,13)-(5,14)
*)

(* all spans
(2,20)-(5,14)
(3,2)-(5,14)
(3,19)-(4,60)
(3,21)-(4,60)
(4,4)-(4,60)
(4,7)-(4,12)
(4,7)-(4,8)
(4,11)-(4,12)
(4,18)-(4,19)
(4,25)-(4,60)
(4,25)-(4,33)
(4,34)-(4,42)
(4,35)-(4,36)
(4,39)-(4,41)
(4,43)-(4,60)
(4,44)-(4,54)
(4,45)-(4,46)
(4,51)-(4,53)
(4,58)-(4,59)
(5,2)-(5,14)
(5,2)-(5,10)
(5,11)-(5,12)
(5,13)-(5,14)
*)
