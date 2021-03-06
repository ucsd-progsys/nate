
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper h;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper [] h;;

*)

(* changed spans
(8,6)-(8,14)
(8,13)-(8,14)
*)

(* type error slice
(3,2)-(8,14)
(4,10)-(4,12)
(6,6)-(8,14)
(7,31)-(7,37)
(7,31)-(7,66)
(8,6)-(8,12)
(8,6)-(8,14)
*)

(* all spans
(2,19)-(8,14)
(2,21)-(8,14)
(3,2)-(8,14)
(3,8)-(3,18)
(3,8)-(3,16)
(3,17)-(3,18)
(4,10)-(4,12)
(6,6)-(8,14)
(6,21)-(7,66)
(6,25)-(7,66)
(7,8)-(7,66)
(7,11)-(7,16)
(7,11)-(7,12)
(7,15)-(7,16)
(7,22)-(7,25)
(7,31)-(7,66)
(7,31)-(7,37)
(7,38)-(7,57)
(7,39)-(7,49)
(7,40)-(7,41)
(7,46)-(7,48)
(7,53)-(7,56)
(7,58)-(7,66)
(7,59)-(7,60)
(7,63)-(7,65)
(8,6)-(8,14)
(8,6)-(8,12)
(8,13)-(8,14)
*)
