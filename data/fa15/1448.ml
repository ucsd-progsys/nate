
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Neg of expr
  | Average of expr* expr
  | Times of expr* expr
  | AveThree of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Neg e -> (-1.0) *. (eval (e, x, y))
  | AveThree (e1,e2,e3) ->
      ((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Neg of expr
  | Average of expr* expr
  | Times of expr* expr
  | AveThree of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Neg e -> (-1.0) *. (eval (e, x, y))
  | AveThree (e1,e2,e3) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y));;

*)

(* changed spans
(23,6)-(23,45)
(23,6)-(23,65)
(23,7)-(23,24)
*)

(* type error slice
(19,18)-(19,42)
(19,25)-(19,41)
(19,26)-(19,30)
(21,13)-(21,19)
(21,13)-(21,39)
(21,15)-(21,18)
(23,6)-(23,45)
(23,6)-(23,65)
(23,7)-(23,24)
(23,8)-(23,12)
(23,27)-(23,44)
(23,28)-(23,32)
(23,48)-(23,65)
(23,49)-(23,53)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(23,65)
(16,2)-(23,65)
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
(21,13)-(21,39)
(21,13)-(21,19)
(21,15)-(21,18)
(21,23)-(21,39)
(21,24)-(21,28)
(21,29)-(21,38)
(21,30)-(21,31)
(21,33)-(21,34)
(21,36)-(21,37)
(23,6)-(23,65)
(23,6)-(23,45)
(23,7)-(23,24)
(23,8)-(23,12)
(23,13)-(23,23)
(23,14)-(23,16)
(23,18)-(23,19)
(23,21)-(23,22)
(23,27)-(23,44)
(23,28)-(23,32)
(23,33)-(23,43)
(23,34)-(23,36)
(23,38)-(23,39)
(23,41)-(23,42)
(23,48)-(23,65)
(23,49)-(23,53)
(23,54)-(23,64)
(23,55)-(23,57)
(23,59)-(23,60)
(23,62)-(23,63)
*)
