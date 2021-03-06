
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | ([],[]) ->
          let (carry,num) = x in
          (0, (if carry > 0 then carry :: num else num))
      | (l1,l2) ->
          (match x with
           | (carry,num) ->
               let addit = ((List.hd l1) + (List.hd l2)) + carry in
               ((if addit > 10 then addit mod 10 else 0), ((addit / 10) ::
                 x))) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
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
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,6)-(23,21)
(14,12)-(14,13)
(16,28)-(16,29)
(17,10)-(17,56)
(17,11)-(17,12)
(17,14)-(17,55)
(17,18)-(17,23)
(17,18)-(17,27)
(17,26)-(17,27)
(17,33)-(17,38)
(17,33)-(17,45)
(17,42)-(17,45)
(17,51)-(17,54)
(19,10)-(23,21)
(19,17)-(19,18)
(21,28)-(21,40)
(21,29)-(21,36)
(21,37)-(21,39)
(21,43)-(21,55)
(21,44)-(21,51)
(21,52)-(21,54)
(21,59)-(21,64)
(23,17)-(23,18)
(24,19)-(24,20)
*)

(* type error slice
(13,4)-(26,51)
(13,10)-(23,21)
(13,12)-(23,21)
(14,6)-(23,21)
(14,12)-(14,13)
(16,10)-(17,56)
(16,28)-(16,29)
(17,10)-(17,56)
(17,11)-(17,12)
(21,28)-(21,40)
(21,29)-(21,36)
(21,37)-(21,39)
(22,58)-(23,19)
(23,17)-(23,18)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(6,52)
(4,15)-(6,52)
(5,2)-(6,52)
(5,13)-(5,48)
(5,13)-(5,29)
(5,14)-(5,25)
(5,26)-(5,28)
(5,32)-(5,48)
(5,33)-(5,44)
(5,45)-(5,47)
(6,2)-(6,52)
(6,3)-(6,24)
(6,19)-(6,20)
(6,4)-(6,18)
(6,5)-(6,10)
(6,11)-(6,12)
(6,13)-(6,17)
(6,21)-(6,23)
(6,26)-(6,51)
(6,46)-(6,47)
(6,27)-(6,45)
(6,28)-(6,33)
(6,34)-(6,35)
(6,36)-(6,44)
(6,39)-(6,43)
(6,48)-(6,50)
(8,19)-(9,68)
(9,2)-(9,68)
(9,8)-(9,9)
(9,23)-(9,24)
(9,35)-(9,68)
(9,38)-(9,43)
(9,38)-(9,39)
(9,42)-(9,43)
(9,49)-(9,61)
(9,49)-(9,59)
(9,60)-(9,61)
(9,67)-(9,68)
(11,11)-(27,34)
(11,14)-(27,34)
(12,2)-(27,34)
(12,11)-(26,51)
(13,4)-(26,51)
(13,10)-(23,21)
(13,12)-(23,21)
(14,6)-(23,21)
(14,12)-(14,13)
(16,10)-(17,56)
(16,28)-(16,29)
(17,10)-(17,56)
(17,11)-(17,12)
(17,14)-(17,55)
(17,18)-(17,27)
(17,18)-(17,23)
(17,26)-(17,27)
(17,33)-(17,45)
(17,33)-(17,38)
(17,42)-(17,45)
(17,51)-(17,54)
(19,10)-(23,21)
(19,17)-(19,18)
(21,15)-(23,20)
(21,27)-(21,64)
(21,27)-(21,56)
(21,28)-(21,40)
(21,29)-(21,36)
(21,37)-(21,39)
(21,43)-(21,55)
(21,44)-(21,51)
(21,52)-(21,54)
(21,59)-(21,64)
(22,15)-(23,20)
(22,16)-(22,56)
(22,20)-(22,30)
(22,20)-(22,25)
(22,28)-(22,30)
(22,36)-(22,48)
(22,36)-(22,41)
(22,46)-(22,48)
(22,54)-(22,55)
(22,58)-(23,19)
(22,59)-(22,71)
(22,60)-(22,65)
(22,68)-(22,70)
(23,17)-(23,18)
(24,4)-(26,51)
(24,15)-(24,21)
(24,16)-(24,17)
(24,19)-(24,20)
(25,4)-(26,51)
(25,15)-(25,33)
(25,15)-(25,27)
(25,28)-(25,30)
(25,31)-(25,33)
(26,4)-(26,51)
(26,18)-(26,44)
(26,18)-(26,32)
(26,33)-(26,34)
(26,35)-(26,39)
(26,40)-(26,44)
(26,48)-(26,51)
(27,2)-(27,34)
(27,2)-(27,12)
(27,13)-(27,34)
(27,14)-(27,17)
(27,18)-(27,33)
(27,19)-(27,26)
(27,27)-(27,29)
(27,30)-(27,32)
*)
