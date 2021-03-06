
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let palindrome w = (explode w) = (explode (listReverse w));;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(12,34)-(12,41)
(12,42)-(12,57)
(12,55)-(12,56)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(7,3)-(10,26)
(7,20)-(10,24)
(9,4)-(9,71)
(9,41)-(9,58)
(9,41)-(9,71)
(9,59)-(9,60)
(10,2)-(10,19)
(10,2)-(10,24)
(10,20)-(10,21)
(12,19)-(12,30)
(12,20)-(12,27)
(12,28)-(12,29)
(12,42)-(12,57)
(12,43)-(12,54)
(12,55)-(12,56)
*)

(* all spans
(2,12)-(5,6)
(3,2)-(5,6)
(3,13)-(4,66)
(4,4)-(4,66)
(4,7)-(4,29)
(4,7)-(4,8)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(4,35)-(4,37)
(4,43)-(4,66)
(4,43)-(4,50)
(4,44)-(4,49)
(4,44)-(4,45)
(4,47)-(4,48)
(4,54)-(4,66)
(4,55)-(4,57)
(4,58)-(4,65)
(4,59)-(4,60)
(4,63)-(4,64)
(5,2)-(5,6)
(5,2)-(5,4)
(5,5)-(5,6)
(7,20)-(10,24)
(8,2)-(10,24)
(8,28)-(9,71)
(8,32)-(9,71)
(9,4)-(9,71)
(9,10)-(9,13)
(9,27)-(9,30)
(9,41)-(9,71)
(9,41)-(9,58)
(9,59)-(9,60)
(9,61)-(9,71)
(9,62)-(9,63)
(9,67)-(9,70)
(10,2)-(10,24)
(10,2)-(10,19)
(10,20)-(10,21)
(10,22)-(10,24)
(12,15)-(12,58)
(12,19)-(12,58)
(12,19)-(12,30)
(12,20)-(12,27)
(12,28)-(12,29)
(12,33)-(12,58)
(12,34)-(12,41)
(12,42)-(12,57)
(12,43)-(12,54)
(12,55)-(12,56)
*)
