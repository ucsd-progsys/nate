
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewExprA of expr* expr
  | NewExprB of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewExprA (e1,e2) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e1, x, y)
      else eval (e2, x, y)
  | NewExprB (e1,e2,e3) ->
      ((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y));;



type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewExprA of expr* expr
  | NewExprB of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewExprA (e1,e2) ->
      if (eval (e1, x, y)) > (eval (e2, x, y))
      then eval (e1, x, y)
      else eval (e2, x, y)
  | NewExprB (e1,e2,e3) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) -. (eval (e3, x, y));;


(* changed spans
(32,26)-(32,27)
(32,47)-(32,48)
*)

(* type error slice
(19,27)-(19,40)
(32,9)-(32,23)
(32,9)-(32,43)
*)