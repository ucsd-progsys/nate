
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (num1,num2) = x in
      [(((num1 + num2) / 10), ((num1 + num2) mod 10)); a] in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (num1,num2) = x in
      let (carry,sum) = a in
      ((((num1 + num2) + carry) / 10), ((((num1 + num2) + carry) mod 10) ::
        sum)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(15,57)
(15,7)-(15,53)
(15,10)-(15,14)
(15,25)-(15,27)
(15,30)-(15,52)
(15,32)-(15,36)
(15,49)-(15,51)
(15,55)-(15,56)
(16,4)-(18,51)
(16,15)-(16,21)
(16,19)-(16,20)
(17,4)-(18,51)
(17,15)-(17,33)
(18,4)-(18,51)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
(19,27)-(19,29)
(19,30)-(19,32)
*)

(* type error slice
(13,4)-(18,51)
(13,10)-(15,57)
(13,12)-(15,57)
(14,6)-(15,57)
(15,6)-(15,57)
(15,6)-(15,57)
(15,55)-(15,56)
(18,18)-(18,32)
(18,18)-(18,44)
(18,33)-(18,34)
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
(4,12)-(6,59)
(4,15)-(6,59)
(5,2)-(6,59)
(5,3)-(5,57)
(5,52)-(5,53)
(5,4)-(5,51)
(5,5)-(5,10)
(5,11)-(5,12)
(5,13)-(5,50)
(5,14)-(5,30)
(5,15)-(5,26)
(5,27)-(5,29)
(5,33)-(5,49)
(5,34)-(5,45)
(5,46)-(5,48)
(5,54)-(5,56)
(6,4)-(6,58)
(6,53)-(6,54)
(6,5)-(6,52)
(6,6)-(6,11)
(6,12)-(6,13)
(6,14)-(6,51)
(6,15)-(6,31)
(6,16)-(6,27)
(6,28)-(6,30)
(6,34)-(6,50)
(6,35)-(6,46)
(6,47)-(6,49)
(6,55)-(6,57)
(8,19)-(9,74)
(9,2)-(9,74)
(9,8)-(9,9)
(9,23)-(9,25)
(9,36)-(9,74)
(9,39)-(9,44)
(9,39)-(9,40)
(9,43)-(9,44)
(9,50)-(9,62)
(9,50)-(9,60)
(9,61)-(9,62)
(9,68)-(9,74)
(9,68)-(9,69)
(9,73)-(9,74)
(11,11)-(19,34)
(11,14)-(19,34)
(12,2)-(19,34)
(12,11)-(18,51)
(13,4)-(18,51)
(13,10)-(15,57)
(13,12)-(15,57)
(14,6)-(15,57)
(14,24)-(14,25)
(15,6)-(15,57)
(15,7)-(15,53)
(15,8)-(15,28)
(15,9)-(15,22)
(15,10)-(15,14)
(15,17)-(15,21)
(15,25)-(15,27)
(15,30)-(15,52)
(15,31)-(15,44)
(15,32)-(15,36)
(15,39)-(15,43)
(15,49)-(15,51)
(15,55)-(15,56)
(16,4)-(18,51)
(16,15)-(16,21)
(16,16)-(16,17)
(16,19)-(16,20)
(17,4)-(18,51)
(17,15)-(17,33)
(17,15)-(17,27)
(17,28)-(17,30)
(17,31)-(17,33)
(18,4)-(18,51)
(18,18)-(18,44)
(18,18)-(18,32)
(18,33)-(18,34)
(18,35)-(18,39)
(18,40)-(18,44)
(18,48)-(18,51)
(19,2)-(19,34)
(19,2)-(19,12)
(19,13)-(19,34)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
(19,27)-(19,29)
(19,30)-(19,32)
*)
