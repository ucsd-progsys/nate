
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | h -> let sum = (h + z) + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) @ t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) @ t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,10)-(24,64)
(23,18)-(23,54)
(23,28)-(23,39)
(23,29)-(23,30)
*)

(* type error slice
(17,4)-(27,47)
(17,10)-(24,64)
(17,12)-(24,64)
(18,6)-(24,64)
(19,32)-(19,50)
(19,32)-(19,63)
(19,33)-(19,40)
(19,51)-(19,52)
(20,6)-(24,64)
(22,10)-(24,64)
(22,10)-(24,64)
(22,10)-(24,64)
(22,10)-(24,64)
(22,17)-(22,18)
(23,18)-(23,54)
(23,28)-(23,35)
(23,29)-(23,30)
(23,43)-(23,50)
(23,43)-(23,54)
(27,14)-(27,28)
(27,14)-(27,40)
(27,29)-(27,30)
*)

(* all spans
(2,14)-(5,62)
(2,16)-(5,62)
(3,2)-(5,62)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(5,7)-(5,62)
(5,14)-(5,15)
(5,28)-(5,30)
(5,38)-(5,61)
(5,56)-(5,57)
(5,38)-(5,55)
(5,39)-(5,44)
(5,45)-(5,46)
(5,47)-(5,54)
(5,48)-(5,49)
(5,52)-(5,53)
(5,58)-(5,61)
(5,59)-(5,60)
(7,12)-(10,48)
(7,15)-(10,48)
(8,2)-(10,48)
(8,13)-(8,48)
(8,13)-(8,29)
(8,14)-(8,25)
(8,26)-(8,28)
(8,32)-(8,48)
(8,33)-(8,44)
(8,45)-(8,47)
(9,2)-(10,48)
(9,13)-(9,48)
(9,13)-(9,29)
(9,14)-(9,25)
(9,26)-(9,28)
(9,32)-(9,48)
(9,33)-(9,44)
(9,45)-(9,47)
(10,2)-(10,48)
(10,3)-(10,24)
(10,19)-(10,20)
(10,4)-(10,18)
(10,5)-(10,10)
(10,11)-(10,12)
(10,13)-(10,17)
(10,21)-(10,23)
(10,26)-(10,47)
(10,42)-(10,43)
(10,27)-(10,41)
(10,28)-(10,33)
(10,34)-(10,35)
(10,36)-(10,40)
(10,44)-(10,46)
(12,19)-(13,69)
(13,2)-(13,69)
(13,8)-(13,9)
(13,23)-(13,25)
(13,36)-(13,69)
(13,39)-(13,44)
(13,39)-(13,40)
(13,43)-(13,44)
(13,50)-(13,62)
(13,50)-(13,60)
(13,61)-(13,62)
(13,68)-(13,69)
(15,11)-(28,34)
(15,14)-(28,34)
(16,2)-(28,34)
(16,11)-(27,47)
(17,4)-(27,47)
(17,10)-(24,64)
(17,12)-(24,64)
(18,6)-(24,64)
(18,22)-(19,63)
(19,8)-(19,63)
(19,11)-(19,17)
(19,11)-(19,12)
(19,15)-(19,17)
(19,23)-(19,26)
(19,24)-(19,25)
(19,32)-(19,63)
(19,51)-(19,52)
(19,32)-(19,50)
(19,33)-(19,40)
(19,41)-(19,49)
(19,42)-(19,43)
(19,46)-(19,48)
(19,53)-(19,63)
(19,54)-(19,62)
(19,54)-(19,55)
(19,60)-(19,62)
(20,6)-(24,64)
(20,12)-(20,13)
(22,10)-(24,64)
(22,17)-(22,18)
(23,18)-(23,54)
(23,28)-(23,39)
(23,28)-(23,35)
(23,29)-(23,30)
(23,33)-(23,34)
(23,38)-(23,39)
(23,43)-(23,54)
(23,43)-(23,50)
(23,51)-(23,54)
(24,21)-(24,63)
(24,31)-(24,42)
(24,31)-(24,38)
(24,32)-(24,33)
(24,36)-(24,37)
(24,41)-(24,42)
(24,46)-(24,63)
(24,60)-(24,61)
(24,46)-(24,59)
(24,47)-(24,54)
(24,55)-(24,58)
(24,62)-(24,63)
(25,4)-(27,47)
(25,15)-(25,17)
(26,4)-(27,47)
(26,15)-(26,33)
(26,15)-(26,27)
(26,28)-(26,30)
(26,31)-(26,33)
(27,4)-(27,47)
(27,14)-(27,40)
(27,14)-(27,28)
(27,29)-(27,30)
(27,31)-(27,35)
(27,36)-(27,40)
(27,44)-(27,47)
(28,2)-(28,34)
(28,2)-(28,12)
(28,13)-(28,34)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
*)
