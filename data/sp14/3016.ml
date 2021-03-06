
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then List.append ((List.append ((clone 0 (- diff)), len1)), len2);;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else ((List.append (clone 0 diff) l2), l1);;

*)

(* changed spans
(11,2)-(12,67)
(12,7)-(12,18)
(12,7)-(12,67)
(12,20)-(12,60)
(12,33)-(12,59)
(12,54)-(12,58)
(12,62)-(12,66)
*)

(* type error slice
(12,7)-(12,18)
(12,7)-(12,67)
(12,19)-(12,67)
(12,20)-(12,60)
(12,21)-(12,32)
(12,33)-(12,59)
*)

(* all spans
(2,14)-(5,15)
(2,16)-(5,15)
(3,2)-(5,15)
(3,19)-(4,55)
(3,23)-(4,55)
(4,4)-(4,55)
(4,7)-(4,13)
(4,7)-(4,8)
(4,12)-(4,13)
(4,19)-(4,22)
(4,28)-(4,55)
(4,28)-(4,36)
(4,37)-(4,47)
(4,38)-(4,39)
(4,43)-(4,46)
(4,48)-(4,55)
(4,49)-(4,50)
(4,53)-(4,54)
(5,2)-(5,15)
(5,2)-(5,10)
(5,11)-(5,13)
(5,14)-(5,15)
(7,12)-(12,67)
(7,15)-(12,67)
(8,2)-(12,67)
(8,13)-(8,27)
(8,13)-(8,24)
(8,25)-(8,27)
(9,2)-(12,67)
(9,13)-(9,27)
(9,13)-(9,24)
(9,25)-(9,27)
(10,2)-(12,67)
(10,13)-(10,24)
(10,13)-(10,17)
(10,20)-(10,24)
(11,2)-(12,67)
(11,5)-(11,13)
(11,5)-(11,9)
(11,12)-(11,13)
(12,7)-(12,67)
(12,7)-(12,18)
(12,19)-(12,67)
(12,20)-(12,60)
(12,21)-(12,32)
(12,33)-(12,59)
(12,34)-(12,52)
(12,35)-(12,40)
(12,41)-(12,42)
(12,43)-(12,51)
(12,46)-(12,50)
(12,54)-(12,58)
(12,62)-(12,66)
*)
