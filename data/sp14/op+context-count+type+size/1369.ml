
let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base List.rev fs;;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,37)-(3,70)
(3,59)-(3,67)
*)

(* type error slice
(3,37)-(3,51)
(3,37)-(3,70)
(3,59)-(3,67)
*)