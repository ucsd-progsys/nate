
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    let rand' = rand (1, 5) in
    match rand' with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 -> buildTimes ((build (rand, (depth - 1))), (buildY ()))
    | 4 -> buildAverage ((build (rand, (depth - 1))), buildY)
    | 5 ->
        buildThresh
          ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else buildX ();;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    let rand' = rand (1, 5) in
    match rand' with
    | 1 -> buildSine (build (rand, (depth - 1)))
    | 2 -> buildCosine (build (rand, (depth - 1)))
    | 3 -> buildTimes ((build (rand, (depth - 1))), (buildY ()))
    | 4 -> buildAverage ((build (rand, (depth - 1))), (buildY ()))
    | 5 ->
        buildThresh
          ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else buildX ();;

*)

(* changed spans
(33,54)-(33,60)
(35,8)-(37,40)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(11,40)-(11,42)
(23,3)-(23,22)
(23,11)-(23,20)
(33,11)-(33,23)
(33,11)-(33,61)
(33,24)-(33,61)
(33,54)-(33,60)
*)

(* all spans
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,17)-(17,67)
(17,38)-(17,67)
(17,46)-(17,47)
(17,49)-(17,50)
(17,52)-(17,58)
(17,60)-(17,66)
(19,16)-(19,39)
(19,25)-(19,39)
(19,32)-(19,34)
(19,36)-(19,38)
(21,11)-(21,20)
(21,16)-(21,20)
(23,11)-(23,20)
(23,16)-(23,20)
(25,15)-(38,16)
(26,2)-(38,16)
(26,5)-(26,14)
(26,5)-(26,10)
(26,13)-(26,14)
(28,4)-(37,40)
(28,16)-(28,27)
(28,16)-(28,20)
(28,21)-(28,27)
(28,22)-(28,23)
(28,25)-(28,26)
(29,4)-(37,40)
(29,10)-(29,15)
(30,11)-(30,48)
(30,11)-(30,20)
(30,21)-(30,48)
(30,22)-(30,27)
(30,28)-(30,47)
(30,29)-(30,33)
(30,35)-(30,46)
(30,36)-(30,41)
(30,44)-(30,45)
(31,11)-(31,50)
(31,11)-(31,22)
(31,23)-(31,50)
(31,24)-(31,29)
(31,30)-(31,49)
(31,31)-(31,35)
(31,37)-(31,48)
(31,38)-(31,43)
(31,46)-(31,47)
(32,11)-(32,64)
(32,11)-(32,21)
(32,22)-(32,64)
(32,23)-(32,50)
(32,24)-(32,29)
(32,30)-(32,49)
(32,31)-(32,35)
(32,37)-(32,48)
(32,38)-(32,43)
(32,46)-(32,47)
(32,52)-(32,63)
(32,53)-(32,59)
(32,60)-(32,62)
(33,11)-(33,61)
(33,11)-(33,23)
(33,24)-(33,61)
(33,25)-(33,52)
(33,26)-(33,31)
(33,32)-(33,51)
(33,33)-(33,37)
(33,39)-(33,50)
(33,40)-(33,45)
(33,48)-(33,49)
(33,54)-(33,60)
(35,8)-(37,40)
(35,8)-(35,19)
(36,10)-(37,40)
(36,11)-(36,22)
(36,12)-(36,18)
(36,19)-(36,21)
(36,24)-(36,35)
(36,25)-(36,31)
(36,32)-(36,34)
(36,37)-(36,64)
(36,38)-(36,43)
(36,44)-(36,63)
(36,45)-(36,49)
(36,51)-(36,62)
(36,52)-(36,57)
(36,60)-(36,61)
(37,12)-(37,39)
(37,13)-(37,18)
(37,19)-(37,38)
(37,20)-(37,24)
(37,26)-(37,37)
(37,27)-(37,32)
(37,35)-(37,36)
(38,7)-(38,16)
(38,7)-(38,13)
(38,14)-(38,16)
*)
