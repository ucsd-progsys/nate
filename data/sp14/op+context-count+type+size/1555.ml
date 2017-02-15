
let pipe fs =
  let f a x = match x with | [] -> a | _ -> x a in
  let base = f 0 [] in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,47)
(3,8)-(3,47)
(3,14)-(3,47)
(3,20)-(3,21)
(3,35)-(3,36)
(4,2)-(4,47)
(4,13)-(4,14)
(4,13)-(4,19)
(4,15)-(4,16)
(4,17)-(4,19)
(4,23)-(4,47)
*)

(* type error slice
(3,2)-(4,47)
(3,8)-(3,47)
(3,10)-(3,47)
(3,14)-(3,47)
(3,14)-(3,47)
(3,20)-(3,21)
(3,44)-(3,45)
(3,44)-(3,47)
(4,13)-(4,14)
(4,13)-(4,19)
(4,17)-(4,19)
*)