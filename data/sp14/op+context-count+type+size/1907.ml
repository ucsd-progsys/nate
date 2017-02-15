
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Inverse a ->
      let result = eval a in if result = 0. then 0 else 1 /. result
  | Max (a,b) ->
      let aResult = eval a in
      let bResult = eval b in if aResult > bResult then aResult else bResult
  | Range (a,b,c) ->
      let aResult = eval a in
      let bResult = eval b in
      let cResult = eval c in
      if aResult < bResult
      then bResult
      else if aResult < cResult then cResult else aResult;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Inverse a ->
      let result = eval (a, x, y) in if result = 0. then 0. else 1. /. result
  | Max (a,b) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      if aResult > bResult then aResult else bResult
  | Range (a,b,c) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      let cResult = eval (c, x, y) in
      if aResult < bResult
      then bResult
      else if aResult < cResult then cResult else aResult;;

*)

(* changed spans
(29,24)-(29,25)
(29,29)-(29,67)
(29,49)-(29,50)
(29,56)-(29,57)
(31,25)-(31,26)
(32,6)-(32,76)
(32,25)-(32,26)
(32,30)-(32,76)
(34,6)-(39,57)
(34,25)-(34,26)
(35,6)-(39,57)
(35,20)-(35,26)
(35,25)-(35,26)
(36,6)-(39,57)
(36,20)-(36,24)
(36,20)-(36,26)
(36,25)-(36,26)
(37,6)-(39,57)
(37,9)-(37,16)
(37,9)-(37,26)
(37,19)-(37,26)
(38,11)-(38,18)
(39,11)-(39,57)
(39,14)-(39,21)
(39,14)-(39,31)
(39,24)-(39,31)
(39,37)-(39,44)
(39,50)-(39,57)
*)

(* type error slice
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(17,2)-(39,57)
(20,14)-(20,17)
(20,14)-(20,42)
(20,25)-(20,41)
(20,26)-(20,30)
(20,31)-(20,40)
(29,6)-(29,67)
(29,19)-(29,23)
(29,19)-(29,25)
(29,24)-(29,25)
(29,29)-(29,67)
(29,29)-(29,67)
(29,49)-(29,50)
(29,56)-(29,57)
(29,56)-(29,67)
(29,56)-(29,67)
(31,20)-(31,24)
(31,20)-(31,26)
(31,25)-(31,26)
(32,20)-(32,24)
(32,20)-(32,26)
(32,25)-(32,26)
(34,20)-(34,24)
(34,20)-(34,26)
(34,25)-(34,26)
(35,20)-(35,24)
(35,20)-(35,26)
(35,25)-(35,26)
(36,20)-(36,24)
(36,20)-(36,26)
(36,25)-(36,26)
*)