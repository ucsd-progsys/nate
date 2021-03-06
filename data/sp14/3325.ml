
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) * 10) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev t)) @ [h * i];;

*)

(* changed spans
(5,12)-(5,46)
(5,43)-(5,45)
*)

(* type error slice
(2,3)-(5,58)
(2,19)-(5,56)
(2,21)-(5,56)
(3,2)-(5,56)
(4,10)-(4,12)
(5,12)-(5,46)
(5,12)-(5,56)
(5,13)-(5,40)
(5,14)-(5,24)
(5,47)-(5,48)
*)

(* all spans
(2,19)-(5,56)
(2,21)-(5,56)
(3,2)-(5,56)
(3,8)-(3,18)
(3,8)-(3,16)
(3,17)-(3,18)
(4,10)-(4,12)
(5,12)-(5,56)
(5,47)-(5,48)
(5,12)-(5,46)
(5,13)-(5,40)
(5,14)-(5,24)
(5,25)-(5,26)
(5,27)-(5,39)
(5,28)-(5,36)
(5,37)-(5,38)
(5,43)-(5,45)
(5,49)-(5,56)
(5,50)-(5,55)
(5,50)-(5,51)
(5,54)-(5,55)
*)
