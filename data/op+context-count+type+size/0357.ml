
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) + (eval (ex2, x, y))) / 2
  | Times (ex1,ex2) -> (eval (ex1, x, y)) * (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y);;



type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y);;


(* changed spans
(19,46)-(19,47)
(19,68)-(19,71)
(20,43)-(20,44)
*)

(* type error slice
(17,28)-(17,42)
(19,28)-(19,43)
(19,28)-(19,64)
*)