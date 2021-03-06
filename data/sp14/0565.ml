
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | AddThree of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e2 -> "cos(pi*" ^ ((exprToString e2) ^ ")")
  | Average (e3,e4) ->
      "((" ^ ((exprToString e3) ^ ("+" ^ ((exprToString e4) ^ ")/2)")))
  | Times (e5,e6) -> (exprToString e5) ^ ("*" ^ (exprToString e6))
  | Thresh (e7,e8,e9,e10) ->
      "(" ^
        ((exprToString e7) ^
           ("<" ^
              ((exprToString e8) ^
                 ("?" ^
                    ((exprToString e9) ^ (":" ^ ((exprToString e10) ^ ")")))))))
  | Power (e1,e2) ->
      "(" ^ ((exprToString e1) ^ ("**" ^ ((exprToString e2) ^ ")")))
  | AddThree (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("+" ^ ((exprToString e2) ^ (("+" exprToString e3) ^ ")"))));;


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
  | AddThree of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e2 -> "cos(pi*" ^ ((exprToString e2) ^ ")")
  | Average (e3,e4) ->
      "((" ^ ((exprToString e3) ^ ("+" ^ ((exprToString e4) ^ ")/2)")))
  | Times (e5,e6) -> (exprToString e5) ^ ("*" ^ (exprToString e6))
  | Thresh (e7,e8,e9,e10) ->
      "(" ^
        ((exprToString e7) ^
           ("<" ^
              ((exprToString e8) ^
                 ("?" ^
                    ((exprToString e9) ^ (":" ^ ((exprToString e10) ^ ")")))))))
  | Power (e1,e2) ->
      "(" ^ ((exprToString e1) ^ ("**" ^ ((exprToString e2) ^ ")")))
  | AddThree (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("+" ^ ((exprToString e2) ^ ("+" ^ ((exprToString e3) ^ ")")))));;

*)

(* changed spans
(34,40)-(34,61)
(34,45)-(34,57)
*)

(* type error slice
(34,40)-(34,61)
(34,41)-(34,44)
*)

(* all spans
(13,21)-(34,71)
(14,2)-(34,71)
(14,8)-(14,9)
(15,13)-(15,16)
(16,13)-(16,16)
(17,15)-(17,52)
(17,25)-(17,26)
(17,15)-(17,24)
(17,27)-(17,52)
(17,46)-(17,47)
(17,28)-(17,45)
(17,29)-(17,41)
(17,42)-(17,44)
(17,48)-(17,51)
(18,17)-(18,54)
(18,27)-(18,28)
(18,17)-(18,26)
(18,29)-(18,54)
(18,48)-(18,49)
(18,30)-(18,47)
(18,31)-(18,43)
(18,44)-(18,46)
(18,50)-(18,53)
(20,6)-(20,71)
(20,11)-(20,12)
(20,6)-(20,10)
(20,13)-(20,71)
(20,32)-(20,33)
(20,14)-(20,31)
(20,15)-(20,27)
(20,28)-(20,30)
(20,34)-(20,70)
(20,39)-(20,40)
(20,35)-(20,38)
(20,41)-(20,69)
(20,60)-(20,61)
(20,42)-(20,59)
(20,43)-(20,55)
(20,56)-(20,58)
(20,62)-(20,68)
(21,21)-(21,66)
(21,39)-(21,40)
(21,21)-(21,38)
(21,22)-(21,34)
(21,35)-(21,37)
(21,41)-(21,66)
(21,46)-(21,47)
(21,42)-(21,45)
(21,48)-(21,65)
(21,49)-(21,61)
(21,62)-(21,64)
(23,6)-(28,80)
(23,10)-(23,11)
(23,6)-(23,9)
(24,8)-(28,80)
(24,27)-(24,28)
(24,9)-(24,26)
(24,10)-(24,22)
(24,23)-(24,25)
(25,11)-(28,79)
(25,16)-(25,17)
(25,12)-(25,15)
(26,14)-(28,78)
(26,33)-(26,34)
(26,15)-(26,32)
(26,16)-(26,28)
(26,29)-(26,31)
(27,17)-(28,77)
(27,22)-(27,23)
(27,18)-(27,21)
(28,20)-(28,76)
(28,39)-(28,40)
(28,21)-(28,38)
(28,22)-(28,34)
(28,35)-(28,37)
(28,41)-(28,75)
(28,46)-(28,47)
(28,42)-(28,45)
(28,48)-(28,74)
(28,68)-(28,69)
(28,49)-(28,67)
(28,50)-(28,62)
(28,63)-(28,66)
(28,70)-(28,73)
(30,6)-(30,68)
(30,10)-(30,11)
(30,6)-(30,9)
(30,12)-(30,68)
(30,31)-(30,32)
(30,13)-(30,30)
(30,14)-(30,26)
(30,27)-(30,29)
(30,33)-(30,67)
(30,39)-(30,40)
(30,34)-(30,38)
(30,41)-(30,66)
(30,60)-(30,61)
(30,42)-(30,59)
(30,43)-(30,55)
(30,56)-(30,58)
(30,62)-(30,65)
(32,6)-(34,71)
(32,10)-(32,11)
(32,6)-(32,9)
(33,8)-(34,71)
(33,27)-(33,28)
(33,9)-(33,26)
(33,10)-(33,22)
(33,23)-(33,25)
(34,11)-(34,70)
(34,16)-(34,17)
(34,12)-(34,15)
(34,18)-(34,69)
(34,37)-(34,38)
(34,19)-(34,36)
(34,20)-(34,32)
(34,33)-(34,35)
(34,39)-(34,68)
(34,62)-(34,63)
(34,40)-(34,61)
(34,41)-(34,44)
(34,45)-(34,57)
(34,58)-(34,60)
(34,64)-(34,67)
*)
