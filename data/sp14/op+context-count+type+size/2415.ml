
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = "" in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,48)-(6,49)
*)

(* type error slice
(6,6)-(6,76)
(6,12)-(6,19)
(6,14)-(6,19)
(6,18)-(6,19)
(6,23)-(6,76)
(6,34)-(6,36)
(6,40)-(6,76)
(6,48)-(6,49)
(6,53)-(6,67)
(6,53)-(6,76)
(6,68)-(6,69)
(6,70)-(6,74)
(6,75)-(6,76)
*)