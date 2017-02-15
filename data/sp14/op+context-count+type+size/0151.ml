
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else if n > 0 then myAppend [digitsOfInt (n / 10)] (n mod 10) else [];;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

*)

(* changed spans
(5,2)-(7,71)
(5,5)-(5,6)
(5,5)-(5,10)
(5,9)-(5,10)
(6,7)-(6,10)
(6,8)-(6,9)
(7,7)-(7,71)
(7,10)-(7,15)
(7,14)-(7,15)
(7,30)-(7,52)
(7,31)-(7,42)
(7,69)-(7,71)
*)

(* type error slice
(2,23)-(2,77)
(2,23)-(2,77)
(2,23)-(2,77)
(2,23)-(2,77)
(2,44)-(2,47)
(2,44)-(2,47)
(2,45)-(2,46)
(2,58)-(2,59)
(2,58)-(2,77)
(2,58)-(2,77)
(2,63)-(2,77)
(2,64)-(2,72)
(2,73)-(2,74)
(2,75)-(2,76)
(4,3)-(7,73)
(4,20)-(7,71)
(5,2)-(7,71)
(6,7)-(6,10)
(7,21)-(7,29)
(7,21)-(7,63)
(7,30)-(7,52)
(7,30)-(7,52)
(7,31)-(7,42)
(7,31)-(7,51)
(7,53)-(7,63)
*)