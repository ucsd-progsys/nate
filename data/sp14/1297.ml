
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewA of expr* expr
  | NewB of expr* expr* expr;;

let rec exprToString e =
  let s = "" in
  match e with
  | VarX  -> s ^ "x"
  | VarY  -> s ^ "y"
  | Sine a -> s ^ ("sin(pi*" ^ ((exprToString a) ^ ")"))
  | Cosine a -> s ^ ("cos(pi*" ^ ((exprToString a) ^ ")"))
  | Average (a,b) ->
      s ^ ("((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ "/2)"))))
  | Times (a,b) -> s ^ ((exprToString a) ^ ("*" ^ (exprToString b)))
  | Thresh (a,b,c,d) ->
      s ^
        ("(" ^
           ((exprToString a) ^
              ("<" ^
                 ((exprToString b) ^
                    ("?" ^
                       ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")"))))))))
  | NewA (a,b) ->
      s ^
        ("sin(pi*" ^
           ((exprToString a) ^ (")*cos(pi*" ^ ((exprToString b) ^ ")"))))
  | NewB (a,b,c) ->
      s ^
        ("(" ^
           ((exprToString a) ^
              ("+" ^ ((exprToString b) ^ (("+" + (exprToString c)) ^ ")^0")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewA of expr* expr
  | NewB of expr* expr* expr;;

let rec exprToString e =
  let s = "" in
  match e with
  | VarX  -> s ^ "x"
  | VarY  -> s ^ "y"
  | Sine a -> s ^ ("sin(pi*" ^ ((exprToString a) ^ ")"))
  | Cosine a -> s ^ ("cos(pi*" ^ ((exprToString a) ^ ")"))
  | Average (a,b) ->
      s ^ ("((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ "/2)"))))
  | Times (a,b) -> s ^ ((exprToString a) ^ ("*" ^ (exprToString b)))
  | Thresh (a,b,c,d) ->
      s ^
        ("(" ^
           ((exprToString a) ^
              ("<" ^
                 ((exprToString b) ^
                    ("?" ^
                       ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")"))))))))
  | NewA (a,b) ->
      s ^
        ("sin(pi*" ^
           ((exprToString a) ^ (")*cos(pi*" ^ ((exprToString b) ^ ")"))))
  | NewB (a,b,c) ->
      s ^
        ("(" ^
           ((exprToString a) ^
              ("+" ^ ((exprToString b) ^ ("+" ^ ((exprToString c) ^ ")^0"))))));;

*)

(* changed spans
(39,42)-(39,66)
(39,49)-(39,65)
*)

(* type error slice
(18,31)-(18,55)
(18,32)-(18,48)
(18,33)-(18,45)
(18,49)-(18,50)
(39,41)-(39,75)
(39,42)-(39,66)
(39,43)-(39,46)
(39,49)-(39,65)
(39,50)-(39,62)
(39,67)-(39,68)
*)

(* all spans
(13,21)-(39,79)
(14,2)-(39,79)
(14,10)-(14,12)
(15,2)-(39,79)
(15,8)-(15,9)
(16,13)-(16,20)
(16,15)-(16,16)
(16,13)-(16,14)
(16,17)-(16,20)
(17,13)-(17,20)
(17,15)-(17,16)
(17,13)-(17,14)
(17,17)-(17,20)
(18,14)-(18,56)
(18,16)-(18,17)
(18,14)-(18,15)
(18,18)-(18,56)
(18,29)-(18,30)
(18,19)-(18,28)
(18,31)-(18,55)
(18,49)-(18,50)
(18,32)-(18,48)
(18,33)-(18,45)
(18,46)-(18,47)
(18,51)-(18,54)
(19,16)-(19,58)
(19,18)-(19,19)
(19,16)-(19,17)
(19,20)-(19,58)
(19,31)-(19,32)
(19,21)-(19,30)
(19,33)-(19,57)
(19,51)-(19,52)
(19,34)-(19,50)
(19,35)-(19,47)
(19,48)-(19,49)
(19,53)-(19,56)
(21,6)-(21,74)
(21,8)-(21,9)
(21,6)-(21,7)
(21,10)-(21,74)
(21,16)-(21,17)
(21,11)-(21,15)
(21,18)-(21,73)
(21,36)-(21,37)
(21,19)-(21,35)
(21,20)-(21,32)
(21,33)-(21,34)
(21,38)-(21,72)
(21,43)-(21,44)
(21,39)-(21,42)
(21,45)-(21,71)
(21,63)-(21,64)
(21,46)-(21,62)
(21,47)-(21,59)
(21,60)-(21,61)
(21,65)-(21,70)
(22,19)-(22,68)
(22,21)-(22,22)
(22,19)-(22,20)
(22,23)-(22,68)
(22,41)-(22,42)
(22,24)-(22,40)
(22,25)-(22,37)
(22,38)-(22,39)
(22,43)-(22,67)
(22,48)-(22,49)
(22,44)-(22,47)
(22,50)-(22,66)
(22,51)-(22,63)
(22,64)-(22,65)
(24,6)-(30,81)
(24,8)-(24,9)
(24,6)-(24,7)
(25,8)-(30,81)
(25,13)-(25,14)
(25,9)-(25,12)
(26,11)-(30,80)
(26,29)-(26,30)
(26,12)-(26,28)
(26,13)-(26,25)
(26,26)-(26,27)
(27,14)-(30,79)
(27,19)-(27,20)
(27,15)-(27,18)
(28,17)-(30,78)
(28,35)-(28,36)
(28,18)-(28,34)
(28,19)-(28,31)
(28,32)-(28,33)
(29,20)-(30,77)
(29,25)-(29,26)
(29,21)-(29,24)
(30,23)-(30,76)
(30,41)-(30,42)
(30,24)-(30,40)
(30,25)-(30,37)
(30,38)-(30,39)
(30,43)-(30,75)
(30,48)-(30,49)
(30,44)-(30,47)
(30,50)-(30,74)
(30,68)-(30,69)
(30,51)-(30,67)
(30,52)-(30,64)
(30,65)-(30,66)
(30,70)-(30,73)
(32,6)-(34,73)
(32,8)-(32,9)
(32,6)-(32,7)
(33,8)-(34,73)
(33,19)-(33,20)
(33,9)-(33,18)
(34,11)-(34,72)
(34,29)-(34,30)
(34,12)-(34,28)
(34,13)-(34,25)
(34,26)-(34,27)
(34,31)-(34,71)
(34,44)-(34,45)
(34,32)-(34,43)
(34,46)-(34,70)
(34,64)-(34,65)
(34,47)-(34,63)
(34,48)-(34,60)
(34,61)-(34,62)
(34,66)-(34,69)
(36,6)-(39,79)
(36,8)-(36,9)
(36,6)-(36,7)
(37,8)-(39,79)
(37,13)-(37,14)
(37,9)-(37,12)
(38,11)-(39,78)
(38,29)-(38,30)
(38,12)-(38,28)
(38,13)-(38,25)
(38,26)-(38,27)
(39,14)-(39,77)
(39,19)-(39,20)
(39,15)-(39,18)
(39,21)-(39,76)
(39,39)-(39,40)
(39,22)-(39,38)
(39,23)-(39,35)
(39,36)-(39,37)
(39,41)-(39,75)
(39,67)-(39,68)
(39,42)-(39,66)
(39,43)-(39,46)
(39,49)-(39,65)
(39,50)-(39,62)
(39,63)-(39,64)
(39,69)-(39,74)
*)
