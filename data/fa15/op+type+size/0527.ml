
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Uncreative (e1,e2,e3) ->
      (((((eval (e1, x, y)) /. 2.0) *. (eval (e2, x, y))) /. 3.0) *.
         (eval (e3, x, y)))
        /. 4.0
  | Creative e1 -> (-1.0) *. (eval e1);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Uncreative (e1,e2,e3) ->
      (((((eval (e1, x, y)) /. 2.0) *. (eval (e2, x, y))) /. 3.0) *.
         (eval (e3, x, y)))
        /. 4.0
  | Creative e1 -> (-1.0) *. (eval (e1, x, y));;

*)

(* changed spans
(31,35)-(31,37)
*)

(* type error slice
(16,2)-(31,38)
(19,25)-(19,41)
(19,26)-(19,30)
(19,31)-(19,40)
(31,19)-(31,25)
(31,19)-(31,25)
(31,19)-(31,38)
(31,21)-(31,24)
(31,29)-(31,38)
(31,30)-(31,34)
(31,35)-(31,37)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(31,38)
(16,2)-(31,38)
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
(28,6)-(30,14)
(28,6)-(29,27)
(28,7)-(28,65)
(28,8)-(28,57)
(28,9)-(28,35)
(28,10)-(28,27)
(28,11)-(28,15)
(28,16)-(28,26)
(28,17)-(28,19)
(28,21)-(28,22)
(28,24)-(28,25)
(28,31)-(28,34)
(28,39)-(28,56)
(28,40)-(28,44)
(28,45)-(28,55)
(28,46)-(28,48)
(28,50)-(28,51)
(28,53)-(28,54)
(28,61)-(28,64)
(29,9)-(29,26)
(29,10)-(29,14)
(29,15)-(29,25)
(29,16)-(29,18)
(29,20)-(29,21)
(29,23)-(29,24)
(30,11)-(30,14)
(31,19)-(31,38)
(31,19)-(31,25)
(31,21)-(31,24)
(31,29)-(31,38)
(31,30)-(31,34)
(31,35)-(31,37)
*)