
let pipe fs = let f a x = a fs in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,75)
(2,26)-(2,27)
(2,28)-(2,30)
(2,34)-(2,75)
(2,45)-(2,47)
(2,51)-(2,75)
*)

(* type error slice
(2,14)-(2,75)
(2,20)-(2,30)
(2,22)-(2,30)
(2,26)-(2,27)
(2,26)-(2,30)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
*)