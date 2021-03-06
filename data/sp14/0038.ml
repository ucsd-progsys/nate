
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (h1::t1,[]) ->
          ((List.rev List.tl (List.rev (h1 :: t1))),
            [(h1 + x) / 10; (h1 + x) mod 10])
      | (h1::t1,rh::rt) ->
          ((List.rev List.tl (List.rev (h1 :: t1))), ((((h1 + x) + rh) / 10)
            :: (((h1 + x) + rh) mod 10) :: rt)) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (h1::t1,[]) ->
          ((List.rev (List.tl (List.rev (h1 :: t1)))),
            [(h1 + x) / 10; (h1 + x) mod 10])
      | (h1::t1,rh::rt) ->
          ((List.rev (List.tl (List.rev (h1 :: t1)))),
            ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt)) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(26,11)-(26,51)
(26,21)-(26,28)
(29,11)-(29,51)
(29,21)-(29,28)
*)

(* type error slice
(26,11)-(26,51)
(26,12)-(26,20)
(29,11)-(29,51)
(29,12)-(29,20)
*)

(* all spans
(2,14)-(3,67)
(2,16)-(3,67)
(3,2)-(3,67)
(3,8)-(3,13)
(3,8)-(3,9)
(3,12)-(3,13)
(3,30)-(3,52)
(3,30)-(3,31)
(3,35)-(3,52)
(3,36)-(3,41)
(3,42)-(3,43)
(3,44)-(3,51)
(3,45)-(3,46)
(3,49)-(3,50)
(3,65)-(3,67)
(5,12)-(14,61)
(5,15)-(14,61)
(6,2)-(14,61)
(6,16)-(6,30)
(6,16)-(6,27)
(6,28)-(6,30)
(7,2)-(14,61)
(7,16)-(7,30)
(7,16)-(7,27)
(7,28)-(7,30)
(8,2)-(14,61)
(8,8)-(8,26)
(8,8)-(8,15)
(8,19)-(8,26)
(10,6)-(11,61)
(10,14)-(10,31)
(10,14)-(10,21)
(10,24)-(10,31)
(11,6)-(11,61)
(11,19)-(11,28)
(11,19)-(11,24)
(11,25)-(11,26)
(11,27)-(11,28)
(11,32)-(11,61)
(11,33)-(11,35)
(11,37)-(11,60)
(11,38)-(11,49)
(11,50)-(11,56)
(11,57)-(11,59)
(13,6)-(14,61)
(13,14)-(13,31)
(13,14)-(13,21)
(13,24)-(13,31)
(14,6)-(14,61)
(14,19)-(14,28)
(14,19)-(14,24)
(14,25)-(14,26)
(14,27)-(14,28)
(14,32)-(14,61)
(14,33)-(14,56)
(14,34)-(14,45)
(14,46)-(14,52)
(14,53)-(14,55)
(14,58)-(14,60)
(16,19)-(19,55)
(17,2)-(19,55)
(17,8)-(17,9)
(18,10)-(18,12)
(19,12)-(19,55)
(19,19)-(19,20)
(19,33)-(19,45)
(19,33)-(19,43)
(19,44)-(19,45)
(19,53)-(19,54)
(21,11)-(33,34)
(21,14)-(33,34)
(22,2)-(33,34)
(22,11)-(32,68)
(23,4)-(32,68)
(23,10)-(30,47)
(23,12)-(30,47)
(24,6)-(30,47)
(24,12)-(24,13)
(26,10)-(27,45)
(26,11)-(26,51)
(26,12)-(26,20)
(26,21)-(26,28)
(26,29)-(26,50)
(26,30)-(26,38)
(26,39)-(26,49)
(26,40)-(26,42)
(26,46)-(26,48)
(27,12)-(27,44)
(27,13)-(27,26)
(27,13)-(27,21)
(27,14)-(27,16)
(27,19)-(27,20)
(27,24)-(27,26)
(27,28)-(27,43)
(27,28)-(27,36)
(27,29)-(27,31)
(27,34)-(27,35)
(27,41)-(27,43)
(29,10)-(30,47)
(29,11)-(29,51)
(29,12)-(29,20)
(29,21)-(29,28)
(29,29)-(29,50)
(29,30)-(29,38)
(29,39)-(29,49)
(29,40)-(29,42)
(29,46)-(29,48)
(29,53)-(30,46)
(29,54)-(29,76)
(29,55)-(29,70)
(29,56)-(29,64)
(29,57)-(29,59)
(29,62)-(29,63)
(29,67)-(29,69)
(29,73)-(29,75)
(30,15)-(30,45)
(30,15)-(30,39)
(30,16)-(30,31)
(30,17)-(30,25)
(30,18)-(30,20)
(30,23)-(30,24)
(30,28)-(30,30)
(30,36)-(30,38)
(30,43)-(30,45)
(31,4)-(32,68)
(31,15)-(31,23)
(31,16)-(31,18)
(31,20)-(31,22)
(32,4)-(32,68)
(32,15)-(32,17)
(32,21)-(32,68)
(32,35)-(32,61)
(32,35)-(32,49)
(32,50)-(32,51)
(32,52)-(32,56)
(32,57)-(32,61)
(32,65)-(32,68)
(33,2)-(33,34)
(33,2)-(33,12)
(33,13)-(33,34)
(33,14)-(33,17)
(33,18)-(33,33)
(33,19)-(33,26)
(33,27)-(33,29)
(33,30)-(33,32)
*)
