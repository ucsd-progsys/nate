
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = "" in let l = (^) sep in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = "" in
      let l = [(fun x  -> x ^ sep)] in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,34)
(7,31)-(7,38)
(7,35)-(7,38)
*)

(* type error slice
(7,23)-(7,65)
(7,31)-(7,34)
(7,31)-(7,38)
(7,42)-(7,56)
(7,42)-(7,65)
(7,64)-(7,65)
*)

(* all spans
(2,18)-(7,65)
(2,22)-(7,65)
(3,2)-(7,65)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,65)
(6,12)-(6,21)
(6,14)-(6,21)
(6,18)-(6,21)
(6,18)-(6,19)
(6,20)-(6,21)
(7,6)-(7,65)
(7,17)-(7,19)
(7,23)-(7,65)
(7,31)-(7,38)
(7,31)-(7,34)
(7,35)-(7,38)
(7,42)-(7,65)
(7,42)-(7,56)
(7,57)-(7,58)
(7,59)-(7,63)
(7,64)-(7,65)
*)
