
let pipe fs =
  let f a x = match a with | _ -> x a | [] -> x in
  let base = [] in List.fold_left f base fs;;



let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;


(* changed spans
(3,15)-(3,34)
(3,39)-(3,48)
(4,14)-(4,16)
*)

(* type error slice
(3,15)-(3,48)
*)