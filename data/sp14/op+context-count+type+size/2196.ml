
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h t | [] -> (fun x  -> x) in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;

*)

(* changed spans
(4,41)-(4,42)
*)

(* type error slice
(3,2)-(5,26)
(3,8)-(3,23)
(3,10)-(3,23)
(3,18)-(3,23)
(3,19)-(3,20)
(4,13)-(4,64)
(4,13)-(4,64)
(4,37)-(4,38)
(4,37)-(4,42)
(4,41)-(4,42)
*)