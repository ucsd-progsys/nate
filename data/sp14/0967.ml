
let rec clone x n =
  let aux acc n = if n <= 0 then acc else clone (List.append [x] acc) (n - 1) in
  aux [] n;;


(* fix

let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

*)

(* changed spans
(3,2)-(4,10)
(3,42)-(3,47)
*)

(* type error slice
(2,3)-(4,12)
(2,14)-(4,10)
(3,42)-(3,47)
(3,42)-(3,77)
(3,48)-(3,69)
(3,49)-(3,60)
(3,61)-(3,64)
(3,62)-(3,63)
*)

(* all spans
(2,14)-(4,10)
(2,16)-(4,10)
(3,2)-(4,10)
(3,10)-(3,77)
(3,14)-(3,77)
(3,18)-(3,77)
(3,21)-(3,27)
(3,21)-(3,22)
(3,26)-(3,27)
(3,33)-(3,36)
(3,42)-(3,77)
(3,42)-(3,47)
(3,48)-(3,69)
(3,49)-(3,60)
(3,61)-(3,64)
(3,62)-(3,63)
(3,65)-(3,68)
(3,70)-(3,77)
(3,71)-(3,72)
(3,75)-(3,76)
(4,2)-(4,10)
(4,2)-(4,5)
(4,6)-(4,8)
(4,9)-(4,10)
*)
