
let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> [h * i] @ (0 * (mulByDigit i t));;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> [h * i] @ (mulByDigit i t);;

*)

(* changed spans
(3,46)-(3,68)
(3,47)-(3,48)
*)

(* type error slice
(2,3)-(3,70)
(2,19)-(3,68)
(2,21)-(3,68)
(3,2)-(3,68)
(3,23)-(3,25)
(3,36)-(3,68)
(3,44)-(3,45)
(3,46)-(3,68)
(3,46)-(3,68)
(3,51)-(3,67)
(3,52)-(3,62)
*)