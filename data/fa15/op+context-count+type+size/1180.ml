
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
  | Sine sine -> "" ^ (sin (pi * (eval (sine, x, y))))
  | Cosine cos -> "cos(pi*" ^ ((eval (cos, x, y)) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((eval (e1, x, y)) ^ ("+" ^ ((eval (e2, x, y)) ^ ")/2)")))
  | Times (t1,t2) -> (eval (t1, x, y)) ^ ("*" ^ (eval (t2, x, y)))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((eval (th1, x, y)) ^
           ("<*" ^
              ((eval (th2, x, y)) ^
                 ("?" ^
                    ((eval (th3, x, y)) ^ (":" ^ ((eval (th4, x, y)) ^ ")")))))));;


(* fix

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
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y);;

*)

(* changed spans
(14,2)-(28,81)
(17,17)-(17,19)
(17,17)-(17,54)
(17,20)-(17,21)
(17,27)-(17,53)
(18,18)-(18,27)
(18,18)-(18,56)
(18,28)-(18,29)
(18,30)-(18,56)
(18,32)-(18,36)
(18,38)-(18,41)
(18,50)-(18,51)
(18,52)-(18,55)
(20,6)-(20,10)
(20,6)-(20,71)
(20,11)-(20,12)
(20,13)-(20,71)
(20,14)-(20,31)
(20,32)-(20,33)
(20,34)-(20,70)
(20,35)-(20,38)
(20,39)-(20,40)
(20,41)-(20,69)
(20,60)-(20,61)
(20,62)-(20,68)
(21,21)-(21,38)
(21,21)-(21,66)
(21,39)-(21,40)
(21,41)-(21,66)
(21,42)-(21,45)
(21,46)-(21,47)
(23,6)-(23,9)
(23,6)-(28,81)
(23,10)-(23,11)
(24,8)-(28,81)
(24,9)-(24,27)
(24,28)-(24,29)
(25,11)-(28,80)
(25,17)-(25,18)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(17,22)-(17,54)
(17,23)-(17,26)
(17,27)-(17,53)
(17,27)-(17,53)
(17,27)-(17,53)
(17,28)-(17,30)
(17,33)-(17,52)
(17,34)-(17,38)
(18,30)-(18,56)
(18,31)-(18,49)
(18,32)-(18,36)
(18,50)-(18,51)
(20,41)-(20,69)
(20,42)-(20,59)
(20,43)-(20,47)
(20,60)-(20,61)
(21,41)-(21,66)
(21,46)-(21,47)
(21,48)-(21,65)
(21,49)-(21,53)
(28,49)-(28,75)
(28,50)-(28,68)
(28,51)-(28,55)
(28,69)-(28,70)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(28,81)
(14,2)-(28,81)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,17)-(17,54)
(17,20)-(17,21)
(17,17)-(17,19)
(17,22)-(17,54)
(17,23)-(17,26)
(17,27)-(17,53)
(17,28)-(17,30)
(17,33)-(17,52)
(17,34)-(17,38)
(17,39)-(17,51)
(17,40)-(17,44)
(17,46)-(17,47)
(17,49)-(17,50)
(18,18)-(18,56)
(18,28)-(18,29)
(18,18)-(18,27)
(18,30)-(18,56)
(18,50)-(18,51)
(18,31)-(18,49)
(18,32)-(18,36)
(18,37)-(18,48)
(18,38)-(18,41)
(18,43)-(18,44)
(18,46)-(18,47)
(18,52)-(18,55)
(20,6)-(20,71)
(20,11)-(20,12)
(20,6)-(20,10)
(20,13)-(20,71)
(20,32)-(20,33)
(20,14)-(20,31)
(20,15)-(20,19)
(20,20)-(20,30)
(20,21)-(20,23)
(20,25)-(20,26)
(20,28)-(20,29)
(20,34)-(20,70)
(20,39)-(20,40)
(20,35)-(20,38)
(20,41)-(20,69)
(20,60)-(20,61)
(20,42)-(20,59)
(20,43)-(20,47)
(20,48)-(20,58)
(20,49)-(20,51)
(20,53)-(20,54)
(20,56)-(20,57)
(20,62)-(20,68)
(21,21)-(21,66)
(21,39)-(21,40)
(21,21)-(21,38)
(21,22)-(21,26)
(21,27)-(21,37)
(21,28)-(21,30)
(21,32)-(21,33)
(21,35)-(21,36)
(21,41)-(21,66)
(21,46)-(21,47)
(21,42)-(21,45)
(21,48)-(21,65)
(21,49)-(21,53)
(21,54)-(21,64)
(21,55)-(21,57)
(21,59)-(21,60)
(21,62)-(21,63)
(23,6)-(28,81)
(23,10)-(23,11)
(23,6)-(23,9)
(24,8)-(28,81)
(24,28)-(24,29)
(24,9)-(24,27)
(24,10)-(24,14)
(24,15)-(24,26)
(24,16)-(24,19)
(24,21)-(24,22)
(24,24)-(24,25)
(25,11)-(28,80)
(25,17)-(25,18)
(25,12)-(25,16)
(26,14)-(28,79)
(26,34)-(26,35)
(26,15)-(26,33)
(26,16)-(26,20)
(26,21)-(26,32)
(26,22)-(26,25)
(26,27)-(26,28)
(26,30)-(26,31)
(27,17)-(28,78)
(27,22)-(27,23)
(27,18)-(27,21)
(28,20)-(28,77)
(28,40)-(28,41)
(28,21)-(28,39)
(28,22)-(28,26)
(28,27)-(28,38)
(28,28)-(28,31)
(28,33)-(28,34)
(28,36)-(28,37)
(28,42)-(28,76)
(28,47)-(28,48)
(28,43)-(28,46)
(28,49)-(28,75)
(28,69)-(28,70)
(28,50)-(28,68)
(28,51)-(28,55)
(28,56)-(28,67)
(28,57)-(28,60)
(28,62)-(28,63)
(28,65)-(28,66)
(28,71)-(28,74)
*)
