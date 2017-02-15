
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a @ sep in
      let base = h in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,20)-(6,21)
(7,30)-(7,32)
*)

(* type error slice
(3,2)-(7,59)
(3,2)-(7,59)
(4,10)-(4,12)
(6,6)-(7,59)
(6,6)-(7,59)
(6,12)-(6,25)
(6,18)-(6,19)
(6,18)-(6,25)
(6,20)-(6,21)
(7,6)-(7,59)
(7,22)-(7,59)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
*)