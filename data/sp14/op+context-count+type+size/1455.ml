
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