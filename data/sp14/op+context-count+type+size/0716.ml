
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Quad of expr* expr* expr;;

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
  | Sqrt e -> sqrt (abs_float (eval (e, x, y)))
  | Quad (e1,e2,e3) ->
      (((eval (e1, x, y)) +. (eval (e2, x, y))) ** 2) +. (eval (e3, x, y))
  | _ -> failwith "we are seriously writing a lisp compiler god save us all";;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

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
  | Sqrt e -> sqrt (abs_float (eval (e, x, y)))
  | Gauss (e1,e2,e3) ->
      2.0 *.
        (exp
           (-.
              ((((eval (e1, x, y)) -. (eval (e2, x, y))) ** 2.0) /.
                 (eval (e3, x, y)))));;

*)

(* changed spans
(17,2)-(31,76)
(30,6)-(30,53)
(30,6)-(30,74)
(30,7)-(30,47)
(30,51)-(30,52)
(31,9)-(31,17)
(31,9)-(31,76)
(31,18)-(31,76)
*)

(* type error slice
(30,6)-(30,53)
(30,48)-(30,50)
(30,51)-(30,52)
*)

(* all spans
(14,9)-(14,26)
(14,9)-(14,12)
(14,16)-(14,26)
(14,17)-(14,21)
(14,22)-(14,25)
(16,14)-(31,76)
(17,2)-(31,76)
(17,8)-(17,9)
(18,13)-(18,14)
(19,13)-(19,14)
(20,15)-(20,44)
(20,15)-(20,18)
(20,19)-(20,44)
(20,20)-(20,22)
(20,26)-(20,43)
(20,27)-(20,31)
(20,32)-(20,42)
(20,33)-(20,35)
(20,37)-(20,38)
(20,40)-(20,41)
(21,17)-(21,46)
(21,17)-(21,20)
(21,21)-(21,46)
(21,22)-(21,24)
(21,28)-(21,45)
(21,29)-(21,33)
(21,34)-(21,44)
(21,35)-(21,37)
(21,39)-(21,40)
(21,42)-(21,43)
(22,23)-(22,70)
(22,23)-(22,63)
(22,24)-(22,41)
(22,25)-(22,29)
(22,30)-(22,40)
(22,31)-(22,33)
(22,35)-(22,36)
(22,38)-(22,39)
(22,45)-(22,62)
(22,46)-(22,50)
(22,51)-(22,61)
(22,52)-(22,54)
(22,56)-(22,57)
(22,59)-(22,60)
(22,67)-(22,70)
(23,21)-(23,59)
(23,21)-(23,38)
(23,22)-(23,26)
(23,27)-(23,37)
(23,28)-(23,30)
(23,32)-(23,33)
(23,35)-(23,36)
(23,42)-(23,59)
(23,43)-(23,47)
(23,48)-(23,58)
(23,49)-(23,51)
(23,53)-(23,54)
(23,56)-(23,57)
(25,6)-(27,26)
(25,9)-(25,46)
(25,9)-(25,26)
(25,10)-(25,14)
(25,15)-(25,25)
(25,16)-(25,18)
(25,20)-(25,21)
(25,23)-(25,24)
(25,29)-(25,46)
(25,30)-(25,34)
(25,35)-(25,45)
(25,36)-(25,38)
(25,40)-(25,41)
(25,43)-(25,44)
(26,11)-(26,26)
(26,11)-(26,15)
(26,16)-(26,26)
(26,17)-(26,19)
(26,21)-(26,22)
(26,24)-(26,25)
(27,11)-(27,26)
(27,11)-(27,15)
(27,16)-(27,26)
(27,17)-(27,19)
(27,21)-(27,22)
(27,24)-(27,25)
(28,14)-(28,47)
(28,14)-(28,18)
(28,19)-(28,47)
(28,20)-(28,29)
(28,30)-(28,46)
(28,31)-(28,35)
(28,36)-(28,45)
(28,37)-(28,38)
(28,40)-(28,41)
(28,43)-(28,44)
(30,6)-(30,74)
(30,6)-(30,53)
(30,48)-(30,50)
(30,7)-(30,47)
(30,8)-(30,25)
(30,9)-(30,13)
(30,14)-(30,24)
(30,15)-(30,17)
(30,19)-(30,20)
(30,22)-(30,23)
(30,29)-(30,46)
(30,30)-(30,34)
(30,35)-(30,45)
(30,36)-(30,38)
(30,40)-(30,41)
(30,43)-(30,44)
(30,51)-(30,52)
(30,57)-(30,74)
(30,58)-(30,62)
(30,63)-(30,73)
(30,64)-(30,66)
(30,68)-(30,69)
(30,71)-(30,72)
(31,9)-(31,76)
(31,9)-(31,17)
(31,18)-(31,76)
*)
