
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Log of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine n -> "sin(pi*" ^ ((exprToString n) ^ ")")
  | Cosine n -> "cos(pi*" ^ ((exprToString n) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (x,y,z,w) ->
      "(" ^
        ((exprToString x) ^
           ("<" ^
              ((exprToString y) ^
                 ("?" ^ ((exprToString z) ^ (":" ^ ((exprToString w) ^ ")")))))))
  | Power (x,y) -> (exprToString x) ^ ("**" (exprToString y))
  | Log n -> "log " ^ (exprToString n);;


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
  | Log of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine n -> "sin(pi*" ^ ((exprToString n) ^ ")")
  | Cosine n -> "cos(pi*" ^ ((exprToString n) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (x,y,z,w) ->
      "(" ^
        ((exprToString x) ^
           ("<" ^
              ((exprToString y) ^
                 ("?" ^ ((exprToString z) ^ (":" ^ ((exprToString w) ^ ")")))))))
  | Power (x,y) -> (exprToString x) ^ ("**" ^ (exprToString y))
  | Log n -> "log " ^ (exprToString n);;

*)

(* changed spans
(28,38)-(28,61)
(28,39)-(28,43)
*)

(* type error slice
(28,38)-(28,61)
(28,39)-(28,43)
*)

(* all spans
(13,21)-(29,38)
(14,2)-(29,38)
(14,8)-(14,9)
(15,13)-(15,16)
(16,13)-(16,16)
(17,14)-(17,50)
(17,24)-(17,25)
(17,14)-(17,23)
(17,26)-(17,50)
(17,44)-(17,45)
(17,27)-(17,43)
(17,28)-(17,40)
(17,41)-(17,42)
(17,46)-(17,49)
(18,16)-(18,52)
(18,26)-(18,27)
(18,16)-(18,25)
(18,28)-(18,52)
(18,46)-(18,47)
(18,29)-(18,45)
(18,30)-(18,42)
(18,43)-(18,44)
(18,48)-(18,51)
(20,6)-(20,69)
(20,11)-(20,12)
(20,6)-(20,10)
(20,13)-(20,69)
(20,31)-(20,32)
(20,14)-(20,30)
(20,15)-(20,27)
(20,28)-(20,29)
(20,33)-(20,68)
(20,38)-(20,39)
(20,34)-(20,37)
(20,40)-(20,67)
(20,58)-(20,59)
(20,41)-(20,57)
(20,42)-(20,54)
(20,55)-(20,56)
(20,60)-(20,66)
(21,19)-(21,62)
(21,36)-(21,37)
(21,19)-(21,35)
(21,20)-(21,32)
(21,33)-(21,34)
(21,38)-(21,62)
(21,43)-(21,44)
(21,39)-(21,42)
(21,45)-(21,61)
(21,46)-(21,58)
(21,59)-(21,60)
(23,6)-(27,81)
(23,10)-(23,11)
(23,6)-(23,9)
(24,8)-(27,81)
(24,26)-(24,27)
(24,9)-(24,25)
(24,10)-(24,22)
(24,23)-(24,24)
(25,11)-(27,80)
(25,16)-(25,17)
(25,12)-(25,15)
(26,14)-(27,79)
(26,32)-(26,33)
(26,15)-(26,31)
(26,16)-(26,28)
(26,29)-(26,30)
(27,17)-(27,78)
(27,22)-(27,23)
(27,18)-(27,21)
(27,24)-(27,77)
(27,42)-(27,43)
(27,25)-(27,41)
(27,26)-(27,38)
(27,39)-(27,40)
(27,44)-(27,76)
(27,49)-(27,50)
(27,45)-(27,48)
(27,51)-(27,75)
(27,69)-(27,70)
(27,52)-(27,68)
(27,53)-(27,65)
(27,66)-(27,67)
(27,71)-(27,74)
(28,19)-(28,61)
(28,36)-(28,37)
(28,19)-(28,35)
(28,20)-(28,32)
(28,33)-(28,34)
(28,38)-(28,61)
(28,39)-(28,43)
(28,44)-(28,60)
(28,45)-(28,57)
(28,58)-(28,59)
(29,13)-(29,38)
(29,20)-(29,21)
(29,13)-(29,19)
(29,22)-(29,38)
(29,23)-(29,35)
(29,36)-(29,37)
*)
