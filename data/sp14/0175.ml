
let stringOfList f l = "[" ^ ((List.map f l) ^ "]");;


(* fix

let stringOfList f l = "[" ^ ((List.fold_left (^) "" (List.map f l)) ^ "]");;

*)

(* changed spans
(2,30)-(2,44)
*)

(* type error slice
(2,29)-(2,51)
(2,30)-(2,44)
(2,31)-(2,39)
(2,45)-(2,46)
*)

(* all spans
(2,17)-(2,51)
(2,19)-(2,51)
(2,23)-(2,51)
(2,27)-(2,28)
(2,23)-(2,26)
(2,29)-(2,51)
(2,45)-(2,46)
(2,30)-(2,44)
(2,31)-(2,39)
(2,40)-(2,41)
(2,42)-(2,43)
(2,47)-(2,50)
*)
