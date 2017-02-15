
let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = (reverseInt n) / 10
     and y = (reverseInt n) mod 10 in
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
(9,13)-(9,27)
(9,30)-(9,32)
(10,13)-(10,27)
(10,32)-(10,34)
*)

(* type error slice
(3,17)-(3,27)
(3,17)-(3,61)
(9,13)-(9,27)
(9,13)-(9,32)
(9,14)-(9,24)
(10,13)-(10,27)
(10,13)-(10,34)
(10,14)-(10,24)
*)