
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = t in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,34)-(6,35)
*)

(* type error slice
(3,2)-(6,75)
(6,6)-(6,75)
(6,12)-(6,19)
(6,14)-(6,19)
(6,18)-(6,19)
(6,23)-(6,75)
(6,34)-(6,35)
(6,52)-(6,66)
(6,52)-(6,75)
(6,67)-(6,68)
(6,69)-(6,73)
*)

(* all spans
(2,18)-(6,75)
(2,22)-(6,75)
(3,2)-(6,75)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(6,75)
(6,12)-(6,19)
(6,14)-(6,19)
(6,18)-(6,19)
(6,23)-(6,75)
(6,34)-(6,35)
(6,39)-(6,75)
(6,47)-(6,48)
(6,52)-(6,75)
(6,52)-(6,66)
(6,67)-(6,68)
(6,69)-(6,73)
(6,74)-(6,75)
*)
