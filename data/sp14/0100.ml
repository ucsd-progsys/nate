
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then ((clone 0 l1), l2)
  else if s2 < s1 then (l1, (clone 0 l2)) else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

*)

(* changed spans
(8,9)-(8,14)
(8,17)-(8,19)
(9,29)-(9,34)
(9,37)-(9,39)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(2,57)-(2,64)
(5,11)-(5,22)
(5,11)-(5,25)
(5,23)-(5,25)
(6,11)-(6,22)
(6,11)-(6,25)
(6,23)-(6,25)
(8,8)-(8,20)
(8,9)-(8,14)
(8,17)-(8,19)
(9,28)-(9,40)
(9,29)-(9,34)
(9,37)-(9,39)
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
(4,12)-(9,55)
(4,15)-(9,55)
(5,2)-(9,55)
(5,11)-(5,25)
(5,11)-(5,22)
(5,23)-(5,25)
(6,2)-(9,55)
(6,11)-(6,25)
(6,11)-(6,22)
(6,23)-(6,25)
(7,2)-(9,55)
(7,5)-(7,12)
(7,5)-(7,7)
(7,10)-(7,12)
(8,7)-(8,25)
(8,8)-(8,20)
(8,9)-(8,14)
(8,15)-(8,16)
(8,17)-(8,19)
(8,22)-(8,24)
(9,7)-(9,55)
(9,10)-(9,17)
(9,10)-(9,12)
(9,15)-(9,17)
(9,23)-(9,41)
(9,24)-(9,26)
(9,28)-(9,40)
(9,29)-(9,34)
(9,35)-(9,36)
(9,37)-(9,39)
(9,47)-(9,55)
(9,48)-(9,50)
(9,52)-(9,54)
*)
