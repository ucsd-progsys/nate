
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit > 10 then 1 else 0), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_right f args base in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f x a =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit > 10 then 1 else 0), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_right f args base in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(13,10)-(17,62)
(14,6)-(17,62)
*)

(* type error slice
(13,4)-(20,52)
(13,10)-(17,62)
(13,12)-(17,62)
(14,6)-(17,62)
(15,6)-(17,62)
(15,6)-(17,62)
(15,22)-(15,23)
(16,6)-(17,62)
(16,18)-(16,29)
(16,25)-(16,28)
(17,6)-(17,62)
(17,38)-(17,61)
(20,18)-(20,33)
(20,18)-(20,45)
(20,34)-(20,35)
*)