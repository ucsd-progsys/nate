
let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = [] in List.fold_left f base xs;;



let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = f 4 xs in List.fold_left f base xs;;


(* changed spans
(4,14)-(4,16)
*)

(* type error slice
(4,20)-(4,44)
*)