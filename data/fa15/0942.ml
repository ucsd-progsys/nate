
let pipe fs =
  let f a x = x a in
  let base = match fs with | (h::t,z) -> z in List.fold_left f base fs;;


(* fix

let pipe fs z = let f a x = x a in let base = z in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,70)
(4,13)-(4,42)
(4,19)-(4,21)
*)

(* type error slice
(4,13)-(4,42)
(4,19)-(4,21)
(4,46)-(4,60)
(4,46)-(4,70)
(4,68)-(4,70)
*)

(* all spans
(2,9)-(4,70)
(3,2)-(4,70)
(3,8)-(3,17)
(3,10)-(3,17)
(3,14)-(3,17)
(3,14)-(3,15)
(3,16)-(3,17)
(4,2)-(4,70)
(4,13)-(4,42)
(4,19)-(4,21)
(4,41)-(4,42)
(4,46)-(4,70)
(4,46)-(4,60)
(4,61)-(4,62)
(4,63)-(4,67)
(4,68)-(4,70)
*)
