
let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair acc list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> pair (List.append acc [(h1, h2)]) t1 t2
        | (_,_) -> List.append acc [(0, 0)] in
      pair [] (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper acc carry i l =
    match l with
    | [] -> (match acc with | [] -> [] | h::t -> if h = 0 then t else acc)
    | h::t ->
        let x = (h * i) + carry in
        let n = if x > 9 then x mod 10 else x in
        let carry' = if x > 9 then x / 10 else 0 in
        let acc' = n :: acc in helper acc' carry' i t in
  helper [] 0 i (List.rev (0 :: l));;

let bigMul l1 l2 =
  let f a x = bigAdd a x in
  let base = [] in
  let args =
    let rec digitProducts acc place l1 l2 =
      match l1 with
      | [] -> acc
      | h::t ->
          let placeHolders =
            let rec buildZeros a places =
              if places = 0 then a else buildZeros (0 :: a) (places - 1) in
            buildZeros [] place in
          let a = List.append (mulByDigit h l2) placeHolders in
          digitProducts (a :: acc) (place + 1) t l2 in
    digitProducts [] 0 l1 l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair acc list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> pair (List.append acc [(h1, h2)]) t1 t2
        | (_,_) -> List.append acc [(0, 0)] in
      pair [] (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper acc carry i l =
    match l with
    | [] -> (match acc with | [] -> [] | h::t -> if h = 0 then t else acc)
    | h::t ->
        let x = (h * i) + carry in
        let n = if x > 9 then x mod 10 else x in
        let carry' = if x > 9 then x / 10 else 0 in
        let acc' = n :: acc in helper acc' carry' i t in
  helper [] 0 i (List.rev (0 :: l));;

let bigMul l1 l2 =
  let f a x = match a with | (_,z) -> (0, (bigAdd z x)) | _ -> (0, []) in
  let base = (0, []) in
  let args =
    let rec digitProducts acc place l1 l2 =
      match l1 with
      | [] -> acc
      | h::t ->
          let placeHolders =
            let rec buildZeros a places =
              if places = 0 then a else buildZeros (0 :: a) (places - 1) in
            buildZeros [] place in
          let a = List.append (mulByDigit h l2) placeHolders in
          digitProducts (a :: acc) (place + 1) t l2 in
    digitProducts [] 0 l1 l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(52,14)-(52,24)
(52,21)-(52,22)
(53,2)-(66,49)
(53,13)-(53,15)
(66,16)-(66,30)
(66,16)-(66,42)
(66,31)-(66,32)
(66,33)-(66,37)
(66,38)-(66,42)
(66,46)-(66,49)
*)

(* type error slice
(18,2)-(18,69)
(18,2)-(18,69)
(18,8)-(18,9)
(18,36)-(18,69)
(18,36)-(18,69)
(18,50)-(18,60)
(18,50)-(18,62)
(18,68)-(18,69)
(20,3)-(38,36)
(20,11)-(38,34)
(20,14)-(38,34)
(21,2)-(38,34)
(38,2)-(38,12)
(38,2)-(38,34)
(52,2)-(66,49)
(52,8)-(52,24)
(52,10)-(52,24)
(52,14)-(52,20)
(52,14)-(52,24)
(66,2)-(66,49)
(66,16)-(66,30)
(66,16)-(66,42)
(66,31)-(66,32)
*)

(* all spans
(2,14)-(5,15)
(2,16)-(5,15)
(3,2)-(5,15)
(3,17)-(4,66)
(3,19)-(4,66)
(3,21)-(4,66)
(4,4)-(4,66)
(4,7)-(4,13)
(4,7)-(4,8)
(4,12)-(4,13)
(4,19)-(4,20)
(4,26)-(4,66)
(4,36)-(4,42)
(4,36)-(4,37)
(4,41)-(4,42)
(4,46)-(4,65)
(4,46)-(4,52)
(4,53)-(4,55)
(4,56)-(4,57)
(4,58)-(4,65)
(4,59)-(4,60)
(4,63)-(4,64)
(5,2)-(5,15)
(5,2)-(5,8)
(5,9)-(5,11)
(5,12)-(5,13)
(5,14)-(5,15)
(7,12)-(15,17)
(7,15)-(15,17)
(8,2)-(15,17)
(8,16)-(8,30)
(8,16)-(8,27)
(8,28)-(8,30)
(9,2)-(15,17)
(9,16)-(9,30)
(9,16)-(9,27)
(9,28)-(9,30)
(10,2)-(15,17)
(10,5)-(10,22)
(10,5)-(10,12)
(10,15)-(10,22)
(11,7)-(11,59)
(11,8)-(11,10)
(11,12)-(11,58)
(11,13)-(11,24)
(11,25)-(11,54)
(11,26)-(11,31)
(11,32)-(11,33)
(11,34)-(11,53)
(11,35)-(11,42)
(11,45)-(11,52)
(11,55)-(11,57)
(13,4)-(15,17)
(13,7)-(13,24)
(13,7)-(13,14)
(13,17)-(13,24)
(14,9)-(14,61)
(14,10)-(14,56)
(14,11)-(14,22)
(14,23)-(14,52)
(14,24)-(14,29)
(14,30)-(14,31)
(14,32)-(14,51)
(14,33)-(14,40)
(14,43)-(14,50)
(14,53)-(14,55)
(14,58)-(14,60)
(15,9)-(15,17)
(15,10)-(15,12)
(15,14)-(15,16)
(17,19)-(18,69)
(18,2)-(18,69)
(18,8)-(18,9)
(18,23)-(18,25)
(18,36)-(18,69)
(18,39)-(18,44)
(18,39)-(18,40)
(18,43)-(18,44)
(18,50)-(18,62)
(18,50)-(18,60)
(18,61)-(18,62)
(18,68)-(18,69)
(20,11)-(38,34)
(20,14)-(38,34)
(21,2)-(38,34)
(21,11)-(37,51)
(22,4)-(37,51)
(22,10)-(29,48)
(22,12)-(29,48)
(23,6)-(29,48)
(23,12)-(23,13)
(25,10)-(29,48)
(25,17)-(25,18)
(27,15)-(29,47)
(27,18)-(27,37)
(27,18)-(27,33)
(27,19)-(27,27)
(27,20)-(27,21)
(27,24)-(27,26)
(27,30)-(27,32)
(27,36)-(27,37)
(28,20)-(28,56)
(28,21)-(28,22)
(28,24)-(28,55)
(28,25)-(28,49)
(28,26)-(28,41)
(28,27)-(28,35)
(28,28)-(28,29)
(28,32)-(28,34)
(28,38)-(28,40)
(28,46)-(28,48)
(28,53)-(28,54)
(29,20)-(29,47)
(29,21)-(29,22)
(29,24)-(29,46)
(29,25)-(29,40)
(29,26)-(29,34)
(29,27)-(29,28)
(29,31)-(29,33)
(29,37)-(29,39)
(29,44)-(29,45)
(30,4)-(37,51)
(30,15)-(30,22)
(30,16)-(30,17)
(30,19)-(30,21)
(31,4)-(37,51)
(32,6)-(36,41)
(32,19)-(35,43)
(32,23)-(35,43)
(32,29)-(35,43)
(33,8)-(35,43)
(33,14)-(33,28)
(33,15)-(33,20)
(33,22)-(33,27)
(34,29)-(34,68)
(34,29)-(34,33)
(34,34)-(34,62)
(34,35)-(34,46)
(34,47)-(34,50)
(34,51)-(34,61)
(34,52)-(34,60)
(34,53)-(34,55)
(34,57)-(34,59)
(34,63)-(34,65)
(34,66)-(34,68)
(35,19)-(35,43)
(35,19)-(35,30)
(35,31)-(35,34)
(35,35)-(35,43)
(35,36)-(35,42)
(35,37)-(35,38)
(35,40)-(35,41)
(36,6)-(36,41)
(36,6)-(36,10)
(36,11)-(36,13)
(36,14)-(36,27)
(36,15)-(36,23)
(36,24)-(36,26)
(36,28)-(36,41)
(36,29)-(36,37)
(36,38)-(36,40)
(37,4)-(37,51)
(37,18)-(37,44)
(37,18)-(37,32)
(37,33)-(37,34)
(37,35)-(37,39)
(37,40)-(37,44)
(37,48)-(37,51)
(38,2)-(38,34)
(38,2)-(38,12)
(38,13)-(38,34)
(38,14)-(38,17)
(38,18)-(38,33)
(38,19)-(38,26)
(38,27)-(38,29)
(38,30)-(38,32)
(40,19)-(49,35)
(40,21)-(49,35)
(41,2)-(49,35)
(41,17)-(48,53)
(41,21)-(48,53)
(41,27)-(48,53)
(41,29)-(48,53)
(42,4)-(48,53)
(42,10)-(42,11)
(43,12)-(43,74)
(43,19)-(43,22)
(43,36)-(43,38)
(43,49)-(43,73)
(43,52)-(43,57)
(43,52)-(43,53)
(43,56)-(43,57)
(43,63)-(43,64)
(43,70)-(43,73)
(45,8)-(48,53)
(45,16)-(45,31)
(45,16)-(45,23)
(45,17)-(45,18)
(45,21)-(45,22)
(45,26)-(45,31)
(46,8)-(48,53)
(46,16)-(46,45)
(46,19)-(46,24)
(46,19)-(46,20)
(46,23)-(46,24)
(46,30)-(46,38)
(46,30)-(46,31)
(46,36)-(46,38)
(46,44)-(46,45)
(47,8)-(48,53)
(47,21)-(47,48)
(47,24)-(47,29)
(47,24)-(47,25)
(47,28)-(47,29)
(47,35)-(47,41)
(47,35)-(47,36)
(47,39)-(47,41)
(47,47)-(47,48)
(48,8)-(48,53)
(48,19)-(48,27)
(48,19)-(48,20)
(48,24)-(48,27)
(48,31)-(48,53)
(48,31)-(48,37)
(48,38)-(48,42)
(48,43)-(48,49)
(48,50)-(48,51)
(48,52)-(48,53)
(49,2)-(49,35)
(49,2)-(49,8)
(49,9)-(49,11)
(49,12)-(49,13)
(49,14)-(49,15)
(49,16)-(49,35)
(49,17)-(49,25)
(49,26)-(49,34)
(49,27)-(49,28)
(49,32)-(49,33)
(51,11)-(66,49)
(51,14)-(66,49)
(52,2)-(66,49)
(52,8)-(52,24)
(52,10)-(52,24)
(52,14)-(52,24)
(52,14)-(52,20)
(52,21)-(52,22)
(52,23)-(52,24)
(53,2)-(66,49)
(53,13)-(53,15)
(54,2)-(66,49)
(55,4)-(65,28)
(55,26)-(64,51)
(55,30)-(64,51)
(55,36)-(64,51)
(55,39)-(64,51)
(56,6)-(64,51)
(56,12)-(56,14)
(57,14)-(57,17)
(59,10)-(64,51)
(60,12)-(62,31)
(60,31)-(61,72)
(60,33)-(61,72)
(61,14)-(61,72)
(61,17)-(61,27)
(61,17)-(61,23)
(61,26)-(61,27)
(61,33)-(61,34)
(61,40)-(61,72)
(61,40)-(61,50)
(61,51)-(61,59)
(61,52)-(61,53)
(61,57)-(61,58)
(61,60)-(61,72)
(61,61)-(61,67)
(61,70)-(61,71)
(62,12)-(62,31)
(62,12)-(62,22)
(62,23)-(62,25)
(62,26)-(62,31)
(63,10)-(64,51)
(63,18)-(63,60)
(63,18)-(63,29)
(63,30)-(63,47)
(63,31)-(63,41)
(63,42)-(63,43)
(63,44)-(63,46)
(63,48)-(63,60)
(64,10)-(64,51)
(64,10)-(64,23)
(64,24)-(64,34)
(64,25)-(64,26)
(64,30)-(64,33)
(64,35)-(64,46)
(64,36)-(64,41)
(64,44)-(64,45)
(64,47)-(64,48)
(64,49)-(64,51)
(65,4)-(65,28)
(65,4)-(65,17)
(65,18)-(65,20)
(65,21)-(65,22)
(65,23)-(65,25)
(65,26)-(65,28)
(66,2)-(66,49)
(66,16)-(66,42)
(66,16)-(66,30)
(66,31)-(66,32)
(66,33)-(66,37)
(66,38)-(66,42)
(66,46)-(66,49)
*)
