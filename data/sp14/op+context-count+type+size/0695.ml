
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = "" in
      let base = "" in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,20)
(7,6)-(7,60)
(7,17)-(7,19)
(7,23)-(7,60)
(7,31)-(7,33)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
(7,54)-(7,58)
(7,59)-(7,60)
*)

(* type error slice
(7,23)-(7,60)
(7,31)-(7,33)
(7,37)-(7,51)
(7,37)-(7,60)
(7,59)-(7,60)
*)