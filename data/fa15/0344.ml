
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 (padLength l1 l2)) :: l1
  else (clone 0 (padLength l1 l2)) l2;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 (padLength l1 l2)) l1), l2)
  else (l1, (List.append (clone 0 (padLength l1 l2)) l2));;

*)

(* changed spans
(8,7)-(8,40)
(8,8)-(8,13)
(9,7)-(9,34)
(9,7)-(9,37)
(9,8)-(9,13)
*)

(* type error slice
(2,34)-(2,56)
(2,39)-(2,56)
(2,40)-(2,45)
(9,7)-(9,34)
(9,7)-(9,37)
(9,8)-(9,13)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,56)
(2,34)-(2,35)
(2,39)-(2,56)
(2,40)-(2,45)
(2,46)-(2,47)
(2,48)-(2,55)
(2,49)-(2,50)
(2,53)-(2,54)
(2,62)-(2,64)
(4,14)-(4,63)
(4,17)-(4,63)
(4,22)-(4,63)
(4,22)-(4,25)
(4,26)-(4,63)
(4,27)-(4,43)
(4,28)-(4,39)
(4,40)-(4,42)
(4,46)-(4,62)
(4,47)-(4,58)
(4,59)-(4,61)
(6,12)-(9,37)
(6,15)-(9,37)
(7,2)-(9,37)
(7,5)-(7,40)
(7,5)-(7,21)
(7,6)-(7,17)
(7,18)-(7,20)
(7,24)-(7,40)
(7,25)-(7,36)
(7,37)-(7,39)
(8,7)-(8,40)
(8,7)-(8,34)
(8,8)-(8,13)
(8,14)-(8,15)
(8,16)-(8,33)
(8,17)-(8,26)
(8,27)-(8,29)
(8,30)-(8,32)
(8,38)-(8,40)
(9,7)-(9,37)
(9,7)-(9,34)
(9,8)-(9,13)
(9,14)-(9,15)
(9,16)-(9,33)
(9,17)-(9,26)
(9,27)-(9,29)
(9,30)-(9,32)
(9,35)-(9,37)
*)
