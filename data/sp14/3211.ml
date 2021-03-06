
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
  let case = 0 in
  if depth = 0
  then case = (rand (0, 1))
  else
    (let case = rand (0, 6) in
     match case with
     | 0 -> buildX
     | 1 -> buildY
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
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
  let case = rand (0, 6) in
  match case with
  | 0 -> buildX ()
  | 1 -> buildY ()
  | 2 -> buildSine (build (rand, (depth - 1)))
  | 3 -> buildCosine (build (rand, (depth - 1)))
  | 4 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(26,13)-(26,14)
(27,2)-(45,71)
(27,5)-(27,10)
(27,5)-(27,14)
(27,13)-(27,14)
(28,7)-(28,11)
(28,7)-(28,27)
(28,24)-(28,25)
(30,4)-(45,71)
(30,16)-(30,20)
(30,16)-(30,27)
(30,21)-(30,27)
(30,22)-(30,23)
(32,12)-(32,18)
(33,12)-(33,18)
(34,12)-(34,49)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(19,3)-(19,41)
(19,16)-(19,39)
(19,25)-(19,39)
(21,3)-(21,22)
(21,11)-(21,20)
(27,2)-(45,71)
(28,7)-(28,27)
(30,4)-(45,71)
(31,5)-(45,70)
(32,12)-(32,18)
(34,12)-(34,21)
(34,12)-(34,49)
(35,12)-(35,23)
(35,12)-(35,51)
(37,9)-(37,21)
(37,9)-(38,69)
(40,9)-(40,19)
(40,9)-(41,69)
(43,9)-(43,20)
(43,9)-(45,70)
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
(25,15)-(45,71)
(26,2)-(45,71)
(26,13)-(26,14)
(27,2)-(45,71)
(27,5)-(27,14)
(27,5)-(27,10)
(27,13)-(27,14)
(28,7)-(28,27)
(28,7)-(28,11)
(28,14)-(28,27)
(28,15)-(28,19)
(28,20)-(28,26)
(28,21)-(28,22)
(28,24)-(28,25)
(30,4)-(45,71)
(30,16)-(30,27)
(30,16)-(30,20)
(30,21)-(30,27)
(30,22)-(30,23)
(30,25)-(30,26)
(31,5)-(45,70)
(31,11)-(31,15)
(32,12)-(32,18)
(33,12)-(33,18)
(34,12)-(34,49)
(34,12)-(34,21)
(34,22)-(34,49)
(34,23)-(34,28)
(34,29)-(34,48)
(34,30)-(34,34)
(34,36)-(34,47)
(34,37)-(34,42)
(34,45)-(34,46)
(35,12)-(35,51)
(35,12)-(35,23)
(35,24)-(35,51)
(35,25)-(35,30)
(35,31)-(35,50)
(35,32)-(35,36)
(35,38)-(35,49)
(35,39)-(35,44)
(35,47)-(35,48)
(37,9)-(38,69)
(37,9)-(37,21)
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
(40,9)-(41,69)
(40,9)-(40,19)
(41,11)-(41,69)
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
(43,9)-(45,70)
(43,9)-(43,20)
(44,11)-(45,70)
(44,12)-(44,39)
(44,13)-(44,18)
(44,19)-(44,38)
(44,20)-(44,24)
(44,26)-(44,37)
(44,27)-(44,32)
(44,35)-(44,36)
(44,41)-(44,68)
(44,42)-(44,47)
(44,48)-(44,67)
(44,49)-(44,53)
(44,55)-(44,66)
(44,56)-(44,61)
(44,64)-(44,65)
(45,13)-(45,40)
(45,14)-(45,19)
(45,20)-(45,39)
(45,21)-(45,25)
(45,27)-(45,38)
(45,28)-(45,33)
(45,36)-(45,37)
(45,42)-(45,69)
(45,43)-(45,48)
(45,49)-(45,68)
(45,50)-(45,54)
(45,56)-(45,67)
(45,57)-(45,62)
(45,65)-(45,66)
*)
