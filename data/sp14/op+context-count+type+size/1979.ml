
let pipe fs =
  let f a x = match x with | [] -> (fun b  -> b) in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = a (x y) in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,48)
(3,20)-(3,21)
(3,35)-(3,48)
(4,2)-(4,42)
(4,13)-(4,14)
*)

(* type error slice
(3,2)-(4,42)
(3,8)-(3,48)
(3,10)-(3,48)
(3,14)-(3,48)
(3,35)-(3,48)
(4,2)-(4,42)
(4,13)-(4,14)
(4,18)-(4,32)
(4,18)-(4,42)
(4,33)-(4,34)
(4,35)-(4,39)
*)