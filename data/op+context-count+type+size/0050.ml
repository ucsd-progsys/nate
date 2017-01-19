
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      [(mulByDigit m)
      ::
      t;
      ((h * i) / 10) + ((m * i) mod 10);
      (h * i) mod 10];;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;


(* changed spans
(6,7)-(6,8)
(6,21)-(6,22)
(8,8)-(8,9)
*)

(* type error slice
(3,9)-(3,19)
*)