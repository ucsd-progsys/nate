
let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then
    List.append [(clone 0 ((List.length l2) - (List.length l1))) @ l1] [l2]
  else
    (List.length l2) <
      ((List.length l1) List.append [l1]
         [(clone 0 ((List.length l1) - (List.length l2))) @ l2]);;


(* fix

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(10,4)-(10,15)
(10,4)-(10,75)
(10,16)-(10,70)
(10,71)-(10,75)
(12,4)-(12,20)
(12,4)-(14,64)
(12,5)-(12,16)
(12,17)-(12,19)
(13,6)-(14,64)
(13,7)-(13,23)
(13,8)-(13,19)
(13,20)-(13,22)
(13,24)-(13,35)
(13,36)-(13,40)
(14,9)-(14,63)
*)

(* type error slice
(8,2)-(14,64)
(10,4)-(10,15)
(10,4)-(10,75)
(12,4)-(14,64)
(13,6)-(14,64)
(13,7)-(13,23)
(13,8)-(13,19)
*)

(* all spans
(2,10)-(5,15)
(2,12)-(5,15)
(3,2)-(5,15)
(3,17)-(4,55)
(3,19)-(4,55)
(3,21)-(4,55)
(4,4)-(4,55)
(4,7)-(4,13)
(4,7)-(4,8)
(4,12)-(4,13)
(4,19)-(4,22)
(4,28)-(4,55)
(4,28)-(4,34)
(4,35)-(4,36)
(4,37)-(4,44)
(4,38)-(4,39)
(4,42)-(4,43)
(4,45)-(4,55)
(4,46)-(4,47)
(4,51)-(4,54)
(5,2)-(5,15)
(5,2)-(5,8)
(5,9)-(5,10)
(5,11)-(5,12)
(5,13)-(5,15)
(7,12)-(14,64)
(7,15)-(14,64)
(8,2)-(14,64)
(8,5)-(8,40)
(8,5)-(8,21)
(8,6)-(8,17)
(8,18)-(8,20)
(8,24)-(8,40)
(8,25)-(8,36)
(8,37)-(8,39)
(10,4)-(10,75)
(10,4)-(10,15)
(10,16)-(10,70)
(10,17)-(10,69)
(10,65)-(10,66)
(10,17)-(10,64)
(10,18)-(10,23)
(10,24)-(10,25)
(10,26)-(10,63)
(10,27)-(10,43)
(10,28)-(10,39)
(10,40)-(10,42)
(10,46)-(10,62)
(10,47)-(10,58)
(10,59)-(10,61)
(10,67)-(10,69)
(10,71)-(10,75)
(10,72)-(10,74)
(12,4)-(14,64)
(12,4)-(12,20)
(12,5)-(12,16)
(12,17)-(12,19)
(13,6)-(14,64)
(13,7)-(13,23)
(13,8)-(13,19)
(13,20)-(13,22)
(13,24)-(13,35)
(13,36)-(13,40)
(13,37)-(13,39)
(14,9)-(14,63)
(14,10)-(14,62)
(14,58)-(14,59)
(14,10)-(14,57)
(14,11)-(14,16)
(14,17)-(14,18)
(14,19)-(14,56)
(14,20)-(14,36)
(14,21)-(14,32)
(14,33)-(14,35)
(14,39)-(14,55)
(14,40)-(14,51)
(14,52)-(14,54)
(14,60)-(14,62)
*)
