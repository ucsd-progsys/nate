
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1 * (clone 0 d)) @ l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

*)

(* changed spans
(6,52)-(6,70)
(6,52)-(6,75)
(6,53)-(6,55)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(6,17)-(6,41)
(6,36)-(6,37)
(6,38)-(6,40)
(6,52)-(6,70)
(6,52)-(6,75)
(6,53)-(6,55)
(6,58)-(6,69)
(6,59)-(6,64)
(6,71)-(6,72)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(6,75)
(4,15)-(6,75)
(5,2)-(6,75)
(5,10)-(5,45)
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(5,29)-(5,45)
(5,30)-(5,41)
(5,42)-(5,44)
(6,2)-(6,75)
(6,5)-(6,10)
(6,5)-(6,6)
(6,9)-(6,10)
(6,16)-(6,46)
(6,17)-(6,41)
(6,36)-(6,37)
(6,18)-(6,35)
(6,19)-(6,24)
(6,25)-(6,26)
(6,27)-(6,34)
(6,28)-(6,29)
(6,32)-(6,33)
(6,38)-(6,40)
(6,43)-(6,45)
(6,52)-(6,75)
(6,71)-(6,72)
(6,52)-(6,70)
(6,53)-(6,55)
(6,58)-(6,69)
(6,59)-(6,64)
(6,65)-(6,66)
(6,67)-(6,68)
(6,73)-(6,75)
*)
