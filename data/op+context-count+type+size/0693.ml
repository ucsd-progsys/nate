
let palindrome w = failwith "TBD";;

let rec append xs1 xs2 =
  match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> append (listReverse tl) [hd];;

let palindrome w =
  match explode w with
  | [] -> true
  | head::[] -> true
  | head::tail ->
      if head = (List.hd (listReverse tail))
      then palindrome (List.tl (listReverse tail))
      else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | hd::[] -> true
  | hd::tl ->
      (match listReverse tl with
       | hdr::tlr -> if hdr = hd then palindrome tlr else false);;



let rec append xs1 xs2 =
  match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> append (listReverse tl) [hd];;

let palindrome w =
  let rec palHelper xs =
    match xs with
    | [] -> true
    | hd::tl ->
        (match listReverse tl with
         | [] -> true
         | hdr::tlr -> if hdr = hd then palHelper tlr else false) in
  palHelper (explode w);;


(* changed spans
(2,5)-(4,4)
(16,3)-(22,19)
(24,5)-(24,17)
(25,9)-(25,18)
(27,9)-(28,9)
(30,39)-(30,49)
*)

(* type error slice
(2,20)-(2,34)
*)