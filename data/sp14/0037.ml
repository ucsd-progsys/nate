
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((h * i) mod 10) :: (((h * i) / 10) + h);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [(h * i) mod 10; ((h * i) / 10) + h];;

*)

(* changed spans
(5,12)-(5,52)
*)

(* type error slice
(5,12)-(5,52)
(5,32)-(5,52)
*)

(* all spans
(2,19)-(5,52)
(2,21)-(5,52)
(3,2)-(5,52)
(3,8)-(3,18)
(3,8)-(3,16)
(3,17)-(3,18)
(4,10)-(4,12)
(5,12)-(5,52)
(5,12)-(5,28)
(5,13)-(5,20)
(5,14)-(5,15)
(5,18)-(5,19)
(5,25)-(5,27)
(5,32)-(5,52)
(5,33)-(5,47)
(5,34)-(5,41)
(5,35)-(5,36)
(5,39)-(5,40)
(5,44)-(5,46)
(5,50)-(5,51)
*)