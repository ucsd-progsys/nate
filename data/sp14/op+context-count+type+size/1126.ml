
let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 length1
    then ((List.append (clone 0 (length1 - length2)) l1), l2)
    else (l1, l2);;


(* fix

let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length1 - length2)) l1), l2)
    else (l1, l2);;

*)

(* changed spans
(13,7)-(13,22)
*)

(* type error slice
(9,2)-(15,17)
(9,16)-(9,27)
(9,16)-(9,30)
(13,7)-(13,14)
(13,7)-(13,22)
*)