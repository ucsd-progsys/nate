
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";") ^ ([List.map (f l)] ^ "]"));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(7,30)-(7,32)
(9,30)-(9,45)
(9,49)-(9,65)
(9,50)-(9,64)
(9,59)-(9,64)
(9,66)-(9,67)
(9,68)-(9,71)
*)

(* type error slice
(2,3)-(7,61)
(2,18)-(7,59)
(2,22)-(7,59)
(9,29)-(9,73)
(9,30)-(9,45)
(9,31)-(9,40)
(9,46)-(9,47)
(9,48)-(9,72)
(9,49)-(9,65)
(9,66)-(9,67)
*)