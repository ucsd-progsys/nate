
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let next_tail = digitsOfInt (n / 10) in
     match next_tail with | x::xs -> xs @ [x :: (n mod 10)]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(6,4)-(7,60)
(6,21)-(6,41)
(7,5)-(7,59)
(7,11)-(7,20)
(7,37)-(7,39)
(7,37)-(7,59)
(7,40)-(7,41)
*)

(* type error slice
(7,5)-(7,59)
(7,5)-(7,59)
(7,37)-(7,39)
(7,37)-(7,59)
(7,40)-(7,41)
(7,42)-(7,59)
(7,42)-(7,59)
(7,43)-(7,44)
(7,43)-(7,58)
(7,43)-(7,58)
(7,43)-(7,58)
(7,48)-(7,58)
*)