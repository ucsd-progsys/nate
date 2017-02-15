
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a @ x in
      let base = h in let l = sep in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,20)-(6,21)
(6,22)-(6,23)
(7,30)-(7,33)
*)

(* type error slice
(3,2)-(7,60)
(3,2)-(7,60)
(4,10)-(4,12)
(6,6)-(7,60)
(6,6)-(7,60)
(6,12)-(6,23)
(6,18)-(6,19)
(6,18)-(6,23)
(6,20)-(6,21)
(7,6)-(7,60)
(7,22)-(7,60)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
*)