
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n acc =
       if n = 0 then acc else loop (n / 10) ((n mod 10) :: acc) in
     match n with | 0 -> [0] | _ -> loop n []);;

*)

(* changed spans
(2,24)-(2,40)
*)

(* type error slice
(2,24)-(2,40)
(2,38)-(2,40)
*)

(* all spans
(2,20)-(2,40)
(2,24)-(2,40)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,40)
*)
