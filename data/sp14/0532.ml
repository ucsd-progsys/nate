
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      (2.71 **
         (((sin (pi *. (eval (a, x, y)))) +. (cos (pi *. (eval (b, x, y)))))
            -. 1.0))
        -. 1.0
  | SinLog (a,b,c) ->
      if c < 0.0
      then ((log (x *. 100)) ** (sin (x *. 100))) -. 1.0
      else (-1.0) *. (((log (x *. 100)) ** (sin (x *. 100))) -. 1.0);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      (2.71 **
         (((sin (pi *. (eval (a, x, y)))) +. (cos (pi *. (eval (b, x, y)))))
            -. 1.0))
        -. 1.0
  | SinLog (a,b,c) ->
      if (eval (c, x, y)) < 0.0
      then
        ((log ((eval (a, x, y)) *. 100.0)) **
           (sin ((eval (b, x, y)) *. 100.0)))
          -. 1.0
      else
        (-1.0) *.
          (((log ((eval (b, x, y)) *. 100.0)) **
              (sin ((eval (a, x, y)) *. 100.0)))
             -. 1.0);;

*)

(* changed spans
(33,9)-(33,10)
(33,13)-(33,16)
(34,18)-(34,19)
(34,23)-(34,26)
(34,32)-(34,48)
(34,38)-(34,39)
(34,43)-(34,46)
(34,53)-(34,56)
(35,29)-(35,30)
(35,34)-(35,37)
(35,43)-(35,59)
(35,49)-(35,50)
(35,54)-(35,57)
(35,64)-(35,67)
*)

(* type error slice
(16,2)-(35,68)
(33,9)-(33,10)
(33,9)-(33,16)
(33,9)-(33,16)
(33,13)-(33,16)
(34,17)-(34,27)
(34,23)-(34,26)
(34,37)-(34,47)
(34,43)-(34,46)
(35,11)-(35,17)
(35,11)-(35,17)
(35,11)-(35,68)
(35,13)-(35,16)
(35,28)-(35,38)
(35,34)-(35,37)
(35,48)-(35,58)
(35,54)-(35,57)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(35,68)
(16,2)-(35,68)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,14)-(19,42)
(19,14)-(19,17)
(19,18)-(19,42)
(19,19)-(19,21)
(19,25)-(19,41)
(19,26)-(19,30)
(19,31)-(19,40)
(19,32)-(19,33)
(19,35)-(19,36)
(19,38)-(19,39)
(20,16)-(20,44)
(20,16)-(20,19)
(20,20)-(20,44)
(20,21)-(20,23)
(20,27)-(20,43)
(20,28)-(20,32)
(20,33)-(20,42)
(20,34)-(20,35)
(20,37)-(20,38)
(20,40)-(20,41)
(21,23)-(21,70)
(21,23)-(21,63)
(21,24)-(21,41)
(21,25)-(21,29)
(21,30)-(21,40)
(21,31)-(21,33)
(21,35)-(21,36)
(21,38)-(21,39)
(21,45)-(21,62)
(21,46)-(21,50)
(21,51)-(21,61)
(21,52)-(21,54)
(21,56)-(21,57)
(21,59)-(21,60)
(21,67)-(21,70)
(22,21)-(22,59)
(22,21)-(22,38)
(22,22)-(22,26)
(22,27)-(22,37)
(22,28)-(22,30)
(22,32)-(22,33)
(22,35)-(22,36)
(22,42)-(22,59)
(22,43)-(22,47)
(22,48)-(22,58)
(22,49)-(22,51)
(22,53)-(22,54)
(22,56)-(22,57)
(24,6)-(26,26)
(24,9)-(24,46)
(24,9)-(24,26)
(24,10)-(24,14)
(24,15)-(24,25)
(24,16)-(24,18)
(24,20)-(24,21)
(24,23)-(24,24)
(24,29)-(24,46)
(24,30)-(24,34)
(24,35)-(24,45)
(24,36)-(24,38)
(24,40)-(24,41)
(24,43)-(24,44)
(25,11)-(25,26)
(25,11)-(25,15)
(25,16)-(25,26)
(25,17)-(25,19)
(25,21)-(25,22)
(25,24)-(25,25)
(26,11)-(26,26)
(26,11)-(26,15)
(26,16)-(26,26)
(26,17)-(26,19)
(26,21)-(26,22)
(26,24)-(26,25)
(28,6)-(31,14)
(28,6)-(30,20)
(28,12)-(28,14)
(28,7)-(28,11)
(29,9)-(30,19)
(29,10)-(29,76)
(29,11)-(29,41)
(29,12)-(29,15)
(29,16)-(29,40)
(29,17)-(29,19)
(29,23)-(29,39)
(29,24)-(29,28)
(29,29)-(29,38)
(29,30)-(29,31)
(29,33)-(29,34)
(29,36)-(29,37)
(29,45)-(29,75)
(29,46)-(29,49)
(29,50)-(29,74)
(29,51)-(29,53)
(29,57)-(29,73)
(29,58)-(29,62)
(29,63)-(29,72)
(29,64)-(29,65)
(29,67)-(29,68)
(29,70)-(29,71)
(30,15)-(30,18)
(31,11)-(31,14)
(33,6)-(35,68)
(33,9)-(33,16)
(33,9)-(33,10)
(33,13)-(33,16)
(34,11)-(34,56)
(34,11)-(34,49)
(34,29)-(34,31)
(34,12)-(34,28)
(34,13)-(34,16)
(34,17)-(34,27)
(34,18)-(34,19)
(34,23)-(34,26)
(34,32)-(34,48)
(34,33)-(34,36)
(34,37)-(34,47)
(34,38)-(34,39)
(34,43)-(34,46)
(34,53)-(34,56)
(35,11)-(35,68)
(35,11)-(35,17)
(35,13)-(35,16)
(35,21)-(35,68)
(35,22)-(35,60)
(35,40)-(35,42)
(35,23)-(35,39)
(35,24)-(35,27)
(35,28)-(35,38)
(35,29)-(35,30)
(35,34)-(35,37)
(35,43)-(35,59)
(35,44)-(35,47)
(35,48)-(35,58)
(35,49)-(35,50)
(35,54)-(35,57)
(35,64)-(35,67)
*)
