
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0 then l1 * (clone 0 a) else "bye";;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0 then (l1, (clone 0 a)) else (l1, l2);;

*)

(* changed spans
(6,16)-(6,32)
(6,38)-(6,43)
*)

(* type error slice
(2,42)-(2,64)
(2,47)-(2,64)
(2,48)-(2,53)
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(6,2)-(6,43)
(6,2)-(6,43)
(6,16)-(6,18)
(6,16)-(6,32)
(6,16)-(6,32)
(6,16)-(6,32)
(6,21)-(6,32)
(6,22)-(6,27)
(6,38)-(6,43)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,36)
(2,42)-(2,64)
(2,42)-(2,43)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(2,56)-(2,63)
(2,57)-(2,58)
(2,61)-(2,62)
(4,12)-(6,43)
(4,15)-(6,43)
(5,2)-(6,43)
(5,10)-(5,45)
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(5,29)-(5,45)
(5,30)-(5,41)
(5,42)-(5,44)
(6,2)-(6,43)
(6,5)-(6,10)
(6,5)-(6,6)
(6,9)-(6,10)
(6,16)-(6,32)
(6,16)-(6,18)
(6,21)-(6,32)
(6,22)-(6,27)
(6,28)-(6,29)
(6,30)-(6,31)
(6,38)-(6,43)
*)
