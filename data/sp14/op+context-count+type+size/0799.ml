
let pipe fs =
  let rec iter acc curr =
    match curr with | [] -> acc | h::tl -> iter (h curr) tl in
  iter (fun y  -> y) fs;;


(* fix

let id y = y;;

let pipe fs =
  let rec iter acc curr =
    match curr with | [] -> acc | h::tl -> iter (fun x  -> h (acc x)) tl in
  iter id fs;;

*)

(* changed spans
(2,9)-(5,23)
(3,2)-(5,23)
(4,48)-(4,56)
(4,51)-(4,55)
(4,57)-(4,59)
(5,2)-(5,6)
(5,7)-(5,20)
(5,18)-(5,19)
(5,21)-(5,23)
*)

(* type error slice
(4,4)-(4,59)
(4,4)-(4,59)
(4,10)-(4,14)
(4,48)-(4,56)
(4,49)-(4,50)
(4,51)-(4,55)
*)