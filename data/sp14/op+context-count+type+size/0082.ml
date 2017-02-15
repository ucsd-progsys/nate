
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> (List.rev (List.map (fun x  -> x * 10) t)) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(4,10)-(4,11)
(5,12)-(5,54)
(5,58)-(5,59)
(5,62)-(5,63)
*)

(* type error slice
(3,2)-(5,64)
(3,2)-(5,64)
(4,10)-(4,11)
(5,12)-(5,64)
(5,55)-(5,56)
*)