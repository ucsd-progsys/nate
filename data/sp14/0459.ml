
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f b') else c';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else c';;

*)

(* changed spans
(3,48)-(3,54)
*)

(* type error slice
(2,3)-(3,64)
(2,16)-(3,62)
(3,41)-(3,47)
(3,41)-(3,54)
(3,48)-(3,54)
(3,49)-(3,50)
*)

(* all spans
(2,16)-(3,62)
(3,2)-(3,62)
(3,16)-(3,19)
(3,16)-(3,17)
(3,18)-(3,19)
(3,23)-(3,62)
(3,26)-(3,35)
(3,26)-(3,28)
(3,31)-(3,35)
(3,41)-(3,54)
(3,41)-(3,47)
(3,48)-(3,54)
(3,49)-(3,50)
(3,51)-(3,53)
(3,60)-(3,62)
*)
