
let rec sumList xs =
  match xs with | _ -> (List.hd xs) + (sumList List.tl) | [] -> [];;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,2)-(3,66)
(3,23)-(3,55)
(3,47)-(3,54)
(3,64)-(3,66)
*)

(* type error slice
(2,3)-(3,68)
(2,16)-(3,66)
(3,2)-(3,66)
(3,23)-(3,35)
(3,23)-(3,55)
(3,24)-(3,31)
(3,32)-(3,34)
(3,38)-(3,55)
(3,39)-(3,46)
(3,47)-(3,54)
(3,64)-(3,66)
*)

(* all spans
(2,16)-(3,66)
(3,2)-(3,66)
(3,8)-(3,10)
(3,23)-(3,55)
(3,23)-(3,35)
(3,24)-(3,31)
(3,32)-(3,34)
(3,38)-(3,55)
(3,39)-(3,46)
(3,47)-(3,54)
(3,64)-(3,66)
*)
