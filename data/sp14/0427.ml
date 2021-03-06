
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 ->
      let num = rand (1, 10) in
      if (num > 7) || (num = 2) then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then
        buildSine
          (buildTimes
             ((build (rand, (depth - 1))), (buildCosine (rand, (depth - 1)))))
      else
        buildSine
          (buildTimes
             ((build (rand, (depth - 1))), (buildSine (rand, (depth - 1)))))
  | 2 ->
      let num = rand (1, 30) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
      else
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
  | 3 ->
      let num = rand (1, 50) in
      if (num mod 2) = 0
      then
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildCosine (build (rand, (depth - 1)))))
      else
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildSine (build (rand, (depth - 1)))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      let num = rand (1, 10) in
      if num = 1
      then buildSine (buildSine (buildSine (build (rand, (depth - 1)))))
      else
        if num = 2
        then
          buildCosine (buildCosine (buildCosine (build (rand, (depth - 1)))))
        else
          if num = 3
          then buildSine (buildCosine (build (rand, (depth - 1))))
          else buildCosine (buildSine (build (rand, (depth - 1))))
  | 6 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 8 ->
      buildTimes
        ((buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
          (buildSine (build (rand, (depth - 1)))))
  | _ -> build (rand, (depth - 1));;


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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 ->
      let num = rand (1, 10) in
      if (num > 7) || (num = 2) then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then
        buildSine
          (buildTimes
             ((build (rand, (depth - 1))),
               (buildCosine (build (rand, (depth - 1))))))
      else
        buildSine
          (buildTimes
             ((build (rand, (depth - 1))),
               (buildSine (build (rand, (depth - 1))))))
  | 2 ->
      let num = rand (1, 30) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
      else
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
  | 3 ->
      let num = rand (1, 50) in
      if (num mod 2) = 0
      then
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildCosine (build (rand, (depth - 1)))))
      else
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildSine (build (rand, (depth - 1)))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      let num = rand (1, 10) in
      if num = 1
      then buildSine (buildSine (buildSine (build (rand, (depth - 1)))))
      else
        if num = 2
        then
          buildCosine (buildCosine (buildCosine (build (rand, (depth - 1)))))
        else
          if num = 3
          then buildSine (buildCosine (build (rand, (depth - 1))))
          else buildCosine (buildSine (build (rand, (depth - 1))))
  | 6 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 8 ->
      buildTimes
        ((buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
          (buildSine (build (rand, (depth - 1)))))
  | _ -> build (rand, (depth - 1));;

*)

(* changed spans
(34,56)-(34,75)
(38,54)-(38,73)
*)

(* type error slice
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(34,43)-(34,76)
(34,44)-(34,55)
(34,56)-(34,75)
(38,43)-(38,74)
(38,44)-(38,53)
(38,54)-(38,73)
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
(17,16)-(17,39)
(17,25)-(17,39)
(17,32)-(17,34)
(17,36)-(17,38)
(19,11)-(19,20)
(19,16)-(19,20)
(21,11)-(21,20)
(21,16)-(21,20)
(23,15)-(90,34)
(24,2)-(90,34)
(24,8)-(24,13)
(26,6)-(27,61)
(26,16)-(26,28)
(26,16)-(26,20)
(26,21)-(26,28)
(26,22)-(26,23)
(26,25)-(26,27)
(27,6)-(27,61)
(27,9)-(27,31)
(27,9)-(27,18)
(27,10)-(27,13)
(27,16)-(27,17)
(27,22)-(27,31)
(27,23)-(27,26)
(27,29)-(27,30)
(27,37)-(27,46)
(27,37)-(27,43)
(27,44)-(27,46)
(27,52)-(27,61)
(27,52)-(27,58)
(27,59)-(27,61)
(29,6)-(38,76)
(29,16)-(29,28)
(29,16)-(29,20)
(29,21)-(29,28)
(29,22)-(29,23)
(29,25)-(29,27)
(30,6)-(38,76)
(30,9)-(30,24)
(30,9)-(30,20)
(30,10)-(30,13)
(30,18)-(30,19)
(30,23)-(30,24)
(32,8)-(34,78)
(32,8)-(32,17)
(33,10)-(34,78)
(33,11)-(33,21)
(34,13)-(34,77)
(34,14)-(34,41)
(34,15)-(34,20)
(34,21)-(34,40)
(34,22)-(34,26)
(34,28)-(34,39)
(34,29)-(34,34)
(34,37)-(34,38)
(34,43)-(34,76)
(34,44)-(34,55)
(34,56)-(34,75)
(34,57)-(34,61)
(34,63)-(34,74)
(34,64)-(34,69)
(34,72)-(34,73)
(36,8)-(38,76)
(36,8)-(36,17)
(37,10)-(38,76)
(37,11)-(37,21)
(38,13)-(38,75)
(38,14)-(38,41)
(38,15)-(38,20)
(38,21)-(38,40)
(38,22)-(38,26)
(38,28)-(38,39)
(38,29)-(38,34)
(38,37)-(38,38)
(38,43)-(38,74)
(38,44)-(38,53)
(38,54)-(38,73)
(38,55)-(38,59)
(38,61)-(38,72)
(38,62)-(38,67)
(38,70)-(38,71)
(40,6)-(53,59)
(40,16)-(40,28)
(40,16)-(40,20)
(40,21)-(40,28)
(40,22)-(40,23)
(40,25)-(40,27)
(41,6)-(53,59)
(41,9)-(41,25)
(41,9)-(41,20)
(41,10)-(41,13)
(41,18)-(41,19)
(41,24)-(41,25)
(43,8)-(47,59)
(43,8)-(43,18)
(44,10)-(47,59)
(44,11)-(44,50)
(44,12)-(44,21)
(44,22)-(44,49)
(44,23)-(44,28)
(44,29)-(44,48)
(44,30)-(44,34)
(44,36)-(44,47)
(44,37)-(44,42)
(44,45)-(44,46)
(45,12)-(47,58)
(45,13)-(45,23)
(46,15)-(47,57)
(46,16)-(46,43)
(46,17)-(46,22)
(46,23)-(46,42)
(46,24)-(46,28)
(46,30)-(46,41)
(46,31)-(46,36)
(46,39)-(46,40)
(47,17)-(47,56)
(47,18)-(47,27)
(47,28)-(47,55)
(47,29)-(47,34)
(47,35)-(47,54)
(47,36)-(47,40)
(47,42)-(47,53)
(47,43)-(47,48)
(47,51)-(47,52)
(49,8)-(53,59)
(49,8)-(49,18)
(50,10)-(53,59)
(50,11)-(50,50)
(50,12)-(50,21)
(50,22)-(50,49)
(50,23)-(50,28)
(50,29)-(50,48)
(50,30)-(50,34)
(50,36)-(50,47)
(50,37)-(50,42)
(50,45)-(50,46)
(51,12)-(53,58)
(51,13)-(51,23)
(52,15)-(53,57)
(52,16)-(52,43)
(52,17)-(52,22)
(52,23)-(52,42)
(52,24)-(52,28)
(52,30)-(52,41)
(52,31)-(52,36)
(52,39)-(52,40)
(53,17)-(53,56)
(53,18)-(53,27)
(53,28)-(53,55)
(53,29)-(53,34)
(53,35)-(53,54)
(53,36)-(53,40)
(53,42)-(53,53)
(53,43)-(53,48)
(53,51)-(53,52)
(55,6)-(66,52)
(55,16)-(55,28)
(55,16)-(55,20)
(55,21)-(55,28)
(55,22)-(55,23)
(55,25)-(55,27)
(56,6)-(66,52)
(56,9)-(56,24)
(56,9)-(56,20)
(56,10)-(56,13)
(56,18)-(56,19)
(56,23)-(56,24)
(58,8)-(61,54)
(58,8)-(58,18)
(59,10)-(61,54)
(59,11)-(60,73)
(59,12)-(59,24)
(60,14)-(60,72)
(60,15)-(60,42)
(60,16)-(60,21)
(60,22)-(60,41)
(60,23)-(60,27)
(60,29)-(60,40)
(60,30)-(60,35)
(60,38)-(60,39)
(60,44)-(60,71)
(60,45)-(60,50)
(60,51)-(60,70)
(60,52)-(60,56)
(60,58)-(60,69)
(60,59)-(60,64)
(60,67)-(60,68)
(61,12)-(61,53)
(61,13)-(61,24)
(61,25)-(61,52)
(61,26)-(61,31)
(61,32)-(61,51)
(61,33)-(61,37)
(61,39)-(61,50)
(61,40)-(61,45)
(61,48)-(61,49)
(63,8)-(66,52)
(63,8)-(63,18)
(64,10)-(66,52)
(64,11)-(65,73)
(64,12)-(64,24)
(65,14)-(65,72)
(65,15)-(65,42)
(65,16)-(65,21)
(65,22)-(65,41)
(65,23)-(65,27)
(65,29)-(65,40)
(65,30)-(65,35)
(65,38)-(65,39)
(65,44)-(65,71)
(65,45)-(65,50)
(65,51)-(65,70)
(65,52)-(65,56)
(65,58)-(65,69)
(65,59)-(65,64)
(65,67)-(65,68)
(66,12)-(66,51)
(66,13)-(66,22)
(66,23)-(66,50)
(66,24)-(66,29)
(66,30)-(66,49)
(66,31)-(66,35)
(66,37)-(66,48)
(66,38)-(66,43)
(66,46)-(66,47)
(68,6)-(68,75)
(68,6)-(68,16)
(68,17)-(68,75)
(68,18)-(68,45)
(68,19)-(68,24)
(68,25)-(68,44)
(68,26)-(68,30)
(68,32)-(68,43)
(68,33)-(68,38)
(68,41)-(68,42)
(68,47)-(68,74)
(68,48)-(68,53)
(68,54)-(68,73)
(68,55)-(68,59)
(68,61)-(68,72)
(68,62)-(68,67)
(68,70)-(68,71)
(70,6)-(80,66)
(70,16)-(70,28)
(70,16)-(70,20)
(70,21)-(70,28)
(70,22)-(70,23)
(70,25)-(70,27)
(71,6)-(80,66)
(71,9)-(71,16)
(71,9)-(71,12)
(71,15)-(71,16)
(72,11)-(72,72)
(72,11)-(72,20)
(72,21)-(72,72)
(72,22)-(72,31)
(72,32)-(72,71)
(72,33)-(72,42)
(72,43)-(72,70)
(72,44)-(72,49)
(72,50)-(72,69)
(72,51)-(72,55)
(72,57)-(72,68)
(72,58)-(72,63)
(72,66)-(72,67)
(74,8)-(80,66)
(74,11)-(74,18)
(74,11)-(74,14)
(74,17)-(74,18)
(76,10)-(76,77)
(76,10)-(76,21)
(76,22)-(76,77)
(76,23)-(76,34)
(76,35)-(76,76)
(76,36)-(76,47)
(76,48)-(76,75)
(76,49)-(76,54)
(76,55)-(76,74)
(76,56)-(76,60)
(76,62)-(76,73)
(76,63)-(76,68)
(76,71)-(76,72)
(78,10)-(80,66)
(78,13)-(78,20)
(78,13)-(78,16)
(78,19)-(78,20)
(79,15)-(79,66)
(79,15)-(79,24)
(79,25)-(79,66)
(79,26)-(79,37)
(79,38)-(79,65)
(79,39)-(79,44)
(79,45)-(79,64)
(79,46)-(79,50)
(79,52)-(79,63)
(79,53)-(79,58)
(79,61)-(79,62)
(80,15)-(80,66)
(80,15)-(80,26)
(80,27)-(80,66)
(80,28)-(80,37)
(80,38)-(80,65)
(80,39)-(80,44)
(80,45)-(80,64)
(80,46)-(80,50)
(80,52)-(80,63)
(80,53)-(80,58)
(80,61)-(80,62)
(82,6)-(82,77)
(82,6)-(82,18)
(82,19)-(82,77)
(82,20)-(82,47)
(82,21)-(82,26)
(82,27)-(82,46)
(82,28)-(82,32)
(82,34)-(82,45)
(82,35)-(82,40)
(82,43)-(82,44)
(82,49)-(82,76)
(82,50)-(82,55)
(82,56)-(82,75)
(82,57)-(82,61)
(82,63)-(82,74)
(82,64)-(82,69)
(82,72)-(82,73)
(84,6)-(84,75)
(84,6)-(84,16)
(84,17)-(84,75)
(84,18)-(84,45)
(84,19)-(84,24)
(84,25)-(84,44)
(84,26)-(84,30)
(84,32)-(84,43)
(84,33)-(84,38)
(84,41)-(84,42)
(84,47)-(84,74)
(84,48)-(84,53)
(84,54)-(84,73)
(84,55)-(84,59)
(84,61)-(84,72)
(84,62)-(84,67)
(84,70)-(84,71)
(86,6)-(89,50)
(86,6)-(86,16)
(87,8)-(89,50)
(87,9)-(88,71)
(87,10)-(87,22)
(88,12)-(88,70)
(88,13)-(88,40)
(88,14)-(88,19)
(88,20)-(88,39)
(88,21)-(88,25)
(88,27)-(88,38)
(88,28)-(88,33)
(88,36)-(88,37)
(88,42)-(88,69)
(88,43)-(88,48)
(88,49)-(88,68)
(88,50)-(88,54)
(88,56)-(88,67)
(88,57)-(88,62)
(88,65)-(88,66)
(89,10)-(89,49)
(89,11)-(89,20)
(89,21)-(89,48)
(89,22)-(89,27)
(89,28)-(89,47)
(89,29)-(89,33)
(89,35)-(89,46)
(89,36)-(89,41)
(89,44)-(89,45)
(90,9)-(90,34)
(90,9)-(90,14)
(90,15)-(90,34)
(90,16)-(90,20)
(90,22)-(90,33)
(90,23)-(90,28)
(90,31)-(90,32)
*)
