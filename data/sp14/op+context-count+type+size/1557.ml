
let pipe fs =
  let f a x = match x with | [] -> 0 | _ -> 1 in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,43)
(3,8)-(3,45)
(3,14)-(3,45)
(3,35)-(3,36)
(3,44)-(3,45)
(4,2)-(4,43)
(4,13)-(4,15)
(4,19)-(4,43)
*)

(* type error slice
(3,2)-(4,43)
(3,8)-(3,45)
(3,10)-(3,45)
(3,14)-(3,45)
(3,35)-(3,36)
(4,2)-(4,43)
(4,13)-(4,15)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
(4,36)-(4,40)
*)