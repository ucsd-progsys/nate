
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

let max = ref 0;;

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
      max 1.0
        (min 1.0
           ((2.71 **
               (((sin (pi *. (eval (a, x, y)))) +.
                   (cos (pi *. (eval (b, x, y)))))
                  -. 1.0))
              -. 1.0))
  | SinLog (a',b',c) -> 1.0;;


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
      let max' a b = if a < b then b else a in
      max' 1.0
        (min 1.0
           ((2.71 **
               (((sin (pi *. (eval (a, x, y)))) +.
                   (cos (pi *. (eval (b, x, y)))))
                  -. 1.0))
              -. 1.0))
  | SinLog (a',b',c) -> 1.0;;

*)

(* changed spans
(13,10)-(13,13)
(13,10)-(13,15)
(13,14)-(13,15)
(30,6)-(30,9)
(30,6)-(36,22)
*)

(* type error slice
(13,3)-(13,17)
(13,10)-(13,13)
(13,10)-(13,15)
(30,6)-(30,9)
(30,6)-(36,22)
*)

(* all spans
(13,10)-(13,15)
(13,10)-(13,13)
(13,14)-(13,15)
(15,9)-(15,26)
(15,9)-(15,12)
(15,16)-(15,26)
(15,17)-(15,21)
(15,22)-(15,25)
(17,14)-(37,27)
(18,2)-(37,27)
(18,8)-(18,9)
(19,13)-(19,14)
(20,13)-(20,14)
(21,14)-(21,42)
(21,14)-(21,17)
(21,18)-(21,42)
(21,19)-(21,21)
(21,25)-(21,41)
(21,26)-(21,30)
(21,31)-(21,40)
(21,32)-(21,33)
(21,35)-(21,36)
(21,38)-(21,39)
(22,16)-(22,44)
(22,16)-(22,19)
(22,20)-(22,44)
(22,21)-(22,23)
(22,27)-(22,43)
(22,28)-(22,32)
(22,33)-(22,42)
(22,34)-(22,35)
(22,37)-(22,38)
(22,40)-(22,41)
(23,23)-(23,70)
(23,23)-(23,63)
(23,24)-(23,41)
(23,25)-(23,29)
(23,30)-(23,40)
(23,31)-(23,33)
(23,35)-(23,36)
(23,38)-(23,39)
(23,45)-(23,62)
(23,46)-(23,50)
(23,51)-(23,61)
(23,52)-(23,54)
(23,56)-(23,57)
(23,59)-(23,60)
(23,67)-(23,70)
(24,21)-(24,59)
(24,21)-(24,38)
(24,22)-(24,26)
(24,27)-(24,37)
(24,28)-(24,30)
(24,32)-(24,33)
(24,35)-(24,36)
(24,42)-(24,59)
(24,43)-(24,47)
(24,48)-(24,58)
(24,49)-(24,51)
(24,53)-(24,54)
(24,56)-(24,57)
(26,6)-(28,26)
(26,9)-(26,46)
(26,9)-(26,26)
(26,10)-(26,14)
(26,15)-(26,25)
(26,16)-(26,18)
(26,20)-(26,21)
(26,23)-(26,24)
(26,29)-(26,46)
(26,30)-(26,34)
(26,35)-(26,45)
(26,36)-(26,38)
(26,40)-(26,41)
(26,43)-(26,44)
(27,11)-(27,26)
(27,11)-(27,15)
(27,16)-(27,26)
(27,17)-(27,19)
(27,21)-(27,22)
(27,24)-(27,25)
(28,11)-(28,26)
(28,11)-(28,15)
(28,16)-(28,26)
(28,17)-(28,19)
(28,21)-(28,22)
(28,24)-(28,25)
(30,6)-(36,22)
(30,6)-(30,9)
(30,10)-(30,13)
(31,8)-(36,22)
(31,9)-(31,12)
(31,13)-(31,16)
(32,11)-(36,21)
(32,12)-(35,26)
(32,18)-(32,20)
(32,13)-(32,17)
(33,15)-(35,25)
(33,16)-(34,50)
(33,17)-(33,47)
(33,18)-(33,21)
(33,22)-(33,46)
(33,23)-(33,25)
(33,29)-(33,45)
(33,30)-(33,34)
(33,35)-(33,44)
(33,36)-(33,37)
(33,39)-(33,40)
(33,42)-(33,43)
(34,19)-(34,49)
(34,20)-(34,23)
(34,24)-(34,48)
(34,25)-(34,27)
(34,31)-(34,47)
(34,32)-(34,36)
(34,37)-(34,46)
(34,38)-(34,39)
(34,41)-(34,42)
(34,44)-(34,45)
(35,21)-(35,24)
(36,17)-(36,20)
(37,24)-(37,27)
*)
