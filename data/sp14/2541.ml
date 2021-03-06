
let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let m = reverseInt n in
     let x = m / 10
     and y = m mod 10 in
     if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;


(* fix

let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = (reverseInt n 0) / 10
     and y = (reverseInt n 0) mod 10 in
     if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;

*)

(* changed spans
(9,4)-(12,61)
(9,13)-(9,23)
(9,13)-(9,25)
(9,24)-(9,25)
(10,13)-(10,14)
(10,17)-(10,19)
(11,13)-(11,14)
(11,19)-(11,21)
*)

(* type error slice
(3,17)-(3,27)
(3,17)-(3,61)
(9,4)-(12,61)
(9,13)-(9,23)
(9,13)-(9,25)
(10,13)-(10,14)
(10,13)-(10,19)
(11,13)-(11,14)
(11,13)-(11,21)
*)

(* all spans
(2,19)-(3,68)
(2,21)-(3,68)
(3,2)-(3,68)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,61)
(3,17)-(3,27)
(3,28)-(3,36)
(3,29)-(3,30)
(3,33)-(3,35)
(3,37)-(3,61)
(3,38)-(3,46)
(3,39)-(3,40)
(3,43)-(3,45)
(3,49)-(3,60)
(3,50)-(3,52)
(3,57)-(3,59)
(3,67)-(3,68)
(5,20)-(12,61)
(6,2)-(12,61)
(6,5)-(6,10)
(6,5)-(6,6)
(6,9)-(6,10)
(7,7)-(7,9)
(9,4)-(12,61)
(9,13)-(9,25)
(9,13)-(9,23)
(9,24)-(9,25)
(10,5)-(12,60)
(10,13)-(10,19)
(10,13)-(10,14)
(10,17)-(10,19)
(11,13)-(11,21)
(11,13)-(11,14)
(11,19)-(11,21)
(12,5)-(12,60)
(12,8)-(12,26)
(12,8)-(12,15)
(12,9)-(12,10)
(12,13)-(12,14)
(12,19)-(12,26)
(12,20)-(12,21)
(12,24)-(12,25)
(12,32)-(12,34)
(12,40)-(12,60)
(12,40)-(12,41)
(12,45)-(12,60)
(12,46)-(12,57)
(12,58)-(12,59)
*)
