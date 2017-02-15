
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | TowerInv of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Power (a,b) ->
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else a ** b
  | TowerInv (a,b,c) ->
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else 1 /. ((eval (a, x, y)) ** ((eval (b, x, y)) ** (eval (c, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | TowerInv of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Power (a,b) ->
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else (eval (a, x, y)) ** (eval (b, x, y))
  | TowerInv (a,b,c) ->
      if ((x < 1.0) && (x > (-1.0))) || ((y < 1.0) && (y > (-1.0)))
      then 0.5
      else
        1.0 /. ((eval (a, x, y)) ** ((eval (b, x, y)) ** (eval (c, x, y))));;

*)

(* changed spans
(30,11)-(30,12)
(30,16)-(30,17)
(32,6)-(34,76)
(34,11)-(34,12)
(34,45)-(34,46)
(34,48)-(34,49)
(34,51)-(34,52)
(34,59)-(34,63)
(34,64)-(34,73)
(34,65)-(34,66)
(34,68)-(34,69)
(34,71)-(34,72)
*)

(* type error slice
(16,2)-(34,76)
(28,10)-(28,19)
(28,10)-(28,19)
(28,11)-(28,12)
(28,15)-(28,18)
(28,23)-(28,35)
(28,23)-(28,35)
(28,24)-(28,25)
(28,28)-(28,34)
(28,28)-(28,34)
(28,30)-(28,33)
(28,41)-(28,50)
(28,41)-(28,50)
(28,42)-(28,43)
(28,46)-(28,49)
(28,54)-(28,66)
(28,54)-(28,66)
(28,55)-(28,56)
(28,59)-(28,65)
(28,59)-(28,65)
(28,61)-(28,64)
(30,11)-(30,12)
(30,11)-(30,17)
(30,13)-(30,15)
(32,23)-(32,35)
(32,23)-(32,35)
(32,24)-(32,25)
(32,28)-(32,34)
(32,28)-(32,34)
(32,30)-(32,33)
(32,54)-(32,66)
(32,54)-(32,66)
(32,55)-(32,56)
(32,59)-(32,65)
(32,59)-(32,65)
(32,61)-(32,64)
(34,11)-(34,12)
(34,11)-(34,76)
*)