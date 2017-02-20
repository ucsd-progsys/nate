
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          (match a with
           | (carry,sum) ->
               (match sum with
                | [] ->
                    if ((carry + b) + c) < 10
                    then (0, [carry; (carry + b) + c])
                    else ((carry + 1), [carry + 1; ((carry + b) + c) mod 10])
                | h::t ->
                    if ((b + c) + h) < 10
                    then (0, ([0] @ ([(b + c) + h] @ t)))
                    else
                      ((carry + 1), ([((h + b) + c) / 10] ::
                        [((h + b) + c) mod 10] :: t)))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          (match a with
           | (carry,sum) ->
               (match sum with
                | [] ->
                    if ((carry + b) + c) < 10
                    then (0, [carry; (carry + b) + c])
                    else ((carry + 1), [carry + 1; ((carry + b) + c) mod 10])
                | h::t ->
                    if ((b + c) + h) < 10
                    then (0, ([0] @ ([(b + c) + h] @ t)))
                    else
                      ((carry + 1),
                        ([((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(31,36)-(32,52)
(31,37)-(31,57)
(32,24)-(32,46)
(32,24)-(32,51)
*)

(* type error slice
(22,15)-(32,54)
(22,15)-(32,54)
(28,20)-(32,53)
(28,20)-(32,53)
(28,23)-(28,36)
(28,34)-(28,35)
(29,25)-(29,57)
(29,29)-(29,56)
(29,30)-(29,33)
(29,30)-(29,33)
(29,31)-(29,32)
(29,34)-(29,35)
(31,22)-(32,53)
(31,36)-(32,52)
(31,36)-(32,52)
(31,37)-(31,57)
(32,24)-(32,46)
(32,24)-(32,51)
(32,24)-(32,51)
(32,50)-(32,51)
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
(4,12)-(10,69)
(4,15)-(10,69)
(5,2)-(10,69)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,15)
(6,8)-(6,10)
(6,12)-(6,14)
(8,4)-(10,69)
(8,7)-(8,42)
(8,7)-(8,23)
(8,8)-(8,19)
(8,20)-(8,22)
(8,26)-(8,42)
(8,27)-(8,38)
(8,39)-(8,41)
(9,9)-(9,69)
(9,10)-(9,64)
(9,59)-(9,60)
(9,11)-(9,58)
(9,12)-(9,17)
(9,18)-(9,19)
(9,20)-(9,57)
(9,21)-(9,37)
(9,22)-(9,33)
(9,34)-(9,36)
(9,40)-(9,56)
(9,41)-(9,52)
(9,53)-(9,55)
(9,61)-(9,63)
(9,66)-(9,68)
(10,9)-(10,69)
(10,10)-(10,12)
(10,14)-(10,68)
(10,63)-(10,64)
(10,15)-(10,62)
(10,16)-(10,21)
(10,22)-(10,23)
(10,24)-(10,61)
(10,25)-(10,41)
(10,26)-(10,37)
(10,38)-(10,40)
(10,44)-(10,60)
(10,45)-(10,56)
(10,57)-(10,59)
(10,65)-(10,67)
(12,19)-(13,75)
(13,2)-(13,75)
(13,8)-(13,9)
(13,23)-(13,25)
(13,36)-(13,75)
(13,39)-(13,50)
(13,39)-(13,42)
(13,43)-(13,50)
(13,44)-(13,45)
(13,48)-(13,49)
(13,56)-(13,57)
(13,63)-(13,75)
(13,63)-(13,73)
(13,74)-(13,75)
(15,11)-(36,34)
(15,14)-(36,34)
(16,2)-(36,34)
(16,11)-(35,51)
(17,4)-(35,51)
(17,10)-(32,55)
(17,12)-(32,55)
(18,6)-(32,55)
(18,12)-(18,13)
(20,10)-(32,55)
(20,17)-(20,18)
(22,15)-(32,54)
(22,22)-(22,25)
(24,20)-(26,77)
(24,23)-(24,45)
(24,23)-(24,40)
(24,24)-(24,35)
(24,25)-(24,30)
(24,33)-(24,34)
(24,38)-(24,39)
(24,43)-(24,45)
(25,25)-(25,54)
(25,26)-(25,27)
(25,29)-(25,53)
(25,30)-(25,35)
(25,37)-(25,52)
(25,37)-(25,48)
(25,38)-(25,43)
(25,46)-(25,47)
(25,51)-(25,52)
(26,25)-(26,77)
(26,26)-(26,37)
(26,27)-(26,32)
(26,35)-(26,36)
(26,39)-(26,76)
(26,40)-(26,49)
(26,40)-(26,45)
(26,48)-(26,49)
(26,51)-(26,75)
(26,51)-(26,68)
(26,52)-(26,63)
(26,53)-(26,58)
(26,61)-(26,62)
(26,66)-(26,67)
(26,73)-(26,75)
(28,20)-(32,53)
(28,23)-(28,41)
(28,23)-(28,36)
(28,24)-(28,31)
(28,25)-(28,26)
(28,29)-(28,30)
(28,34)-(28,35)
(28,39)-(28,41)
(29,25)-(29,57)
(29,26)-(29,27)
(29,29)-(29,56)
(29,34)-(29,35)
(29,30)-(29,33)
(29,31)-(29,32)
(29,36)-(29,55)
(29,51)-(29,52)
(29,37)-(29,50)
(29,38)-(29,49)
(29,38)-(29,45)
(29,39)-(29,40)
(29,43)-(29,44)
(29,48)-(29,49)
(29,53)-(29,54)
(31,22)-(32,53)
(31,23)-(31,34)
(31,24)-(31,29)
(31,32)-(31,33)
(31,36)-(32,52)
(31,37)-(31,57)
(31,38)-(31,56)
(31,38)-(31,51)
(31,39)-(31,46)
(31,40)-(31,41)
(31,44)-(31,45)
(31,49)-(31,50)
(31,54)-(31,56)
(32,24)-(32,51)
(32,24)-(32,46)
(32,25)-(32,45)
(32,25)-(32,38)
(32,26)-(32,33)
(32,27)-(32,28)
(32,31)-(32,32)
(32,36)-(32,37)
(32,43)-(32,45)
(32,50)-(32,51)
(33,4)-(35,51)
(33,15)-(33,22)
(33,16)-(33,17)
(33,19)-(33,21)
(34,4)-(35,51)
(34,15)-(34,44)
(34,15)-(34,23)
(34,24)-(34,44)
(34,25)-(34,37)
(34,38)-(34,40)
(34,41)-(34,43)
(35,4)-(35,51)
(35,18)-(35,44)
(35,18)-(35,32)
(35,33)-(35,34)
(35,35)-(35,39)
(35,40)-(35,44)
(35,48)-(35,51)
(36,2)-(36,34)
(36,2)-(36,12)
(36,13)-(36,34)
(36,14)-(36,17)
(36,18)-(36,33)
(36,19)-(36,26)
(36,27)-(36,29)
(36,30)-(36,32)
*)
