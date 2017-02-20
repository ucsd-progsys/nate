
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f, b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

*)

(* changed spans
(4,9)-(4,15)
*)

(* type error slice
(3,45)-(3,51)
(3,45)-(3,58)
(3,52)-(3,58)
(3,53)-(3,54)
(4,2)-(4,8)
(4,2)-(4,15)
(4,9)-(4,15)
(4,10)-(4,11)
*)

(* all spans
(2,16)-(4,15)
(3,2)-(4,15)
(3,18)-(3,66)
(3,27)-(3,66)
(3,30)-(3,39)
(3,30)-(3,32)
(3,35)-(3,39)
(3,45)-(3,58)
(3,45)-(3,51)
(3,52)-(3,58)
(3,53)-(3,54)
(3,55)-(3,57)
(3,64)-(3,66)
(4,2)-(4,15)
(4,2)-(4,8)
(4,9)-(4,15)
(4,10)-(4,11)
(4,13)-(4,14)
*)
