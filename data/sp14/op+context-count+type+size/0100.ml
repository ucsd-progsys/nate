
let pipe fs =
  let f a x = match a with | [] -> [] | h::t -> h x in
  let base = 3 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,42)
(3,14)-(3,51)
(3,20)-(3,21)
(3,35)-(3,37)
(3,48)-(3,49)
(3,48)-(3,51)
(4,2)-(4,42)
(4,13)-(4,14)
(4,18)-(4,42)
*)

(* type error slice
(3,2)-(4,42)
(3,8)-(3,51)
(3,10)-(3,51)
(3,14)-(3,51)
(3,14)-(3,51)
(3,14)-(3,51)
(3,20)-(3,21)
(3,48)-(3,49)
(3,48)-(3,51)
(4,18)-(4,32)
(4,18)-(4,42)
(4,33)-(4,34)
*)