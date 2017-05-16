
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
  if depth = 0
  then (if (rand (0, 2)) < 1 then buildX else buildY)
  else
    (let x = rand (0, 5) in
     match x with
     | 0 -> buildSine buildX
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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
  if depth = 0
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     match x with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(27,34)-(27,40)
(27,46)-(27,52)
(29,4)-(42,71)
(31,22)-(31,28)
(32,12)-(32,23)
*)

(* type error slice
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(21,3)-(21,22)
(21,11)-(21,20)
(25,3)-(42,73)
(25,15)-(42,71)
(26,2)-(42,71)
(26,2)-(42,71)
(27,7)-(27,53)
(27,34)-(27,40)
(29,4)-(42,71)
(30,5)-(42,70)
(31,12)-(31,21)
(31,12)-(31,28)
(31,22)-(31,28)
(32,12)-(32,23)
(32,12)-(32,51)
(32,24)-(32,51)
(32,25)-(32,30)
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
(25,15)-(42,71)
(26,2)-(42,71)
(26,5)-(26,14)
(26,5)-(26,10)
(26,13)-(26,14)
(27,7)-(27,53)
(27,11)-(27,28)
(27,11)-(27,24)
(27,12)-(27,16)
(27,17)-(27,23)
(27,18)-(27,19)
(27,21)-(27,22)
(27,27)-(27,28)
(27,34)-(27,40)
(27,46)-(27,52)
(29,4)-(42,71)
(29,13)-(29,24)
(29,13)-(29,17)
(29,18)-(29,24)
(29,19)-(29,20)
(29,22)-(29,23)
(30,5)-(42,70)
(30,11)-(30,12)
(31,12)-(31,28)
(31,12)-(31,21)
(31,22)-(31,28)
(32,12)-(32,51)
(32,12)-(32,23)
(32,24)-(32,51)
(32,25)-(32,30)
(32,31)-(32,50)
(32,32)-(32,36)
(32,38)-(32,49)
(32,39)-(32,44)
(32,47)-(32,48)
(34,9)-(35,69)
(34,9)-(34,21)
(35,11)-(35,69)
(35,12)-(35,39)
(35,13)-(35,18)
(35,19)-(35,38)
(35,20)-(35,24)
(35,26)-(35,37)
(35,27)-(35,32)
(35,35)-(35,36)
(35,41)-(35,68)
(35,42)-(35,47)
(35,48)-(35,67)
(35,49)-(35,53)
(35,55)-(35,66)
(35,56)-(35,61)
(35,64)-(35,65)
(37,9)-(38,69)
(37,9)-(37,19)
(38,11)-(38,69)
(38,12)-(38,39)
(38,13)-(38,18)
(38,19)-(38,38)
(38,20)-(38,24)
(38,26)-(38,37)
(38,27)-(38,32)
(38,35)-(38,36)
(38,41)-(38,68)
(38,42)-(38,47)
(38,48)-(38,67)
(38,49)-(38,53)
(38,55)-(38,66)
(38,56)-(38,61)
(38,64)-(38,65)
(40,9)-(42,70)
(40,9)-(40,20)
(41,11)-(42,70)
(41,12)-(41,39)
(41,13)-(41,18)
(41,19)-(41,38)
(41,20)-(41,24)
(41,26)-(41,37)
(41,27)-(41,32)
(41,35)-(41,36)
(41,41)-(41,68)
(41,42)-(41,47)
(41,48)-(41,67)
(41,49)-(41,53)
(41,55)-(41,66)
(41,56)-(41,61)
(41,64)-(41,65)
(42,13)-(42,40)
(42,14)-(42,19)
(42,20)-(42,39)
(42,21)-(42,25)
(42,27)-(42,38)
(42,28)-(42,33)
(42,36)-(42,37)
(42,42)-(42,69)
(42,43)-(42,48)
(42,49)-(42,68)
(42,50)-(42,54)
(42,56)-(42,67)
(42,57)-(42,62)
(42,65)-(42,66)
*)
