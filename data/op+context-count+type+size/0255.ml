
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      let res1 = eval (e1, x, y) in
      let res2 = eval (e2, x, y) in
      let res3 = eval (e3, x, y) in
      if res1 > res2
      then ((res1 +. res2) +. res3) /. 3.0
      else
        if res2 > res3
        then ((res1 *. res2) +. res3) /. 2.0
        else
          if res1 > res3
          then
            ((((atan res1) + (atan res2)) - (atan res3)) *. 2) / (3.0 *. pi)
          else eval ((-1.0) *. res3);;



type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      let res1 = eval (e1, x, y) in
      let res2 = eval (e2, x, y) in
      let res3 = eval (e3, x, y) in
      if res1 > res2
      then ((res1 +. res2) +. res3) /. 3.0
      else
        if res2 > res3
        then ((res1 *. res2) +. res3) /. 2.0
        else
          if res1 > res3
          then
            ((((atan res1) +. (atan res2)) -. (atan res3)) *. 2.0) /.
              (3.0 *. pi)
          else (-1.0) *. res3;;


(* changed spans
(42,28)-(42,29)
(42,43)-(42,44)
(42,61)-(42,62)
(42,64)-(42,65)
(43,16)-(43,20)
(43,22)-(43,23)
(43,36)-(43,37)
*)

(* type error slice
(42,17)-(42,26)
(42,17)-(42,40)
*)