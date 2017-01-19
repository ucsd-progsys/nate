
let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      sqsum
        ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i]);;



let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      [sqsum
         ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i])];;


(* changed spans
*)

(* type error slice
(3,46)-(3,70)
*)