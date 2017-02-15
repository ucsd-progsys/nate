
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> [listReverse [tail]; head];;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(3,2)-(7,44)
(3,16)-(3,18)
(7,18)-(7,44)
(7,19)-(7,37)
(7,31)-(7,37)
(7,39)-(7,43)
*)

(* type error slice
(2,3)-(7,46)
(2,20)-(7,44)
(4,2)-(7,44)
(4,2)-(7,44)
(4,8)-(4,9)
(7,19)-(7,30)
(7,19)-(7,37)
(7,31)-(7,37)
(7,31)-(7,37)
(7,32)-(7,36)
*)