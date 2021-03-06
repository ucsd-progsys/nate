
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ x in
      let base x = h ^ x in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,21)
(7,15)-(7,24)
(7,19)-(7,24)
(7,21)-(7,22)
(7,23)-(7,24)
*)

(* type error slice
(6,6)-(7,64)
(6,12)-(6,25)
(6,14)-(6,25)
(6,18)-(6,25)
(6,22)-(6,23)
(7,6)-(7,64)
(7,15)-(7,24)
(7,41)-(7,55)
(7,41)-(7,64)
(7,56)-(7,57)
(7,58)-(7,62)
*)

(* all spans
(2,18)-(7,64)
(2,22)-(7,64)
(3,2)-(7,64)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,64)
(6,12)-(6,25)
(6,14)-(6,25)
(6,18)-(6,25)
(6,22)-(6,23)
(6,18)-(6,21)
(6,24)-(6,25)
(7,6)-(7,64)
(7,15)-(7,24)
(7,19)-(7,24)
(7,21)-(7,22)
(7,19)-(7,20)
(7,23)-(7,24)
(7,28)-(7,64)
(7,36)-(7,37)
(7,41)-(7,64)
(7,41)-(7,55)
(7,56)-(7,57)
(7,58)-(7,62)
(7,63)-(7,64)
*)
