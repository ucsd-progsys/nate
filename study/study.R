library(irr)

a0 = read.csv(file="study-data/Types_Study_A_scores.csv")
b0 = read.csv(file="study-data/Types_Study_B_scores.csv")
a1 = read.csv(file="study-data/Types_Study_1_A_scores.csv")
b1 = read.csv(file="study-data/Types_Study_1_B_scores.csv")
a2 = read.csv(file="study-data/Types_Study_2_A_scores.csv")
b2 = read.csv(file="study-data/Types_Study_2_B_scores.csv")

reasons0 = c(a0$X1..sepConcat.explain..1.0.pts.,
             a0$X3..padZero.explain..1.0.pts.,
             a0$X5..mulByDigit.explain..1.0.pts.,
             b0$X1..sepConcat.explain..1.0.pts.,
             b0$X3..padZero.explain..1.0.pts.,
             b0$X5..mulByDigit.explain..1.0.pts.)
reasons1 = c(a1$X1..sepConcat.explain..1.0.pts.,
             a1$X3..padZero.explain..1.0.pts.,
             a1$X5..mulByDigit.explain..1.0.pts.,
             b1$X1..sepConcat.explain..1.0.pts.,
             b1$X3..padZero.explain..1.0.pts.,
             b1$X5..mulByDigit.explain..1.0.pts.)
reasons2 = c(a2$X1..sepConcat.explain..1.0.pts.,
             a2$X3..padZero.explain..1.0.pts.,
             a2$X5..mulByDigit.explain..1.0.pts.,
             b2$X1..sepConcat.explain..1.0.pts.,
             b2$X3..padZero.explain..1.0.pts.,
             b2$X5..mulByDigit.explain..1.0.pts.)
reasons = data.frame(reasons0, reasons1, reasons2)
# filter out answers that any annotator marked as INCOMPLETE
reasons = reasons[reasons$reasons0 != -1 & reasons$reasons1 != -1 & reasons$reasons2 != -1,]


fixes0 = c(a0$X2..sepConcat.fix..1.0.pts.,
           a0$X4..padZero.fix..1.0.pts.,
           a0$X6..mulByDigit.fix..1.0.pts.,
           b0$X2..sepConcat.fix..1.0.pts.,
           b0$X4..padZero.fix..1.0.pts.,
           b0$X6..mulByDigit.fix..1.0.pts.)
fixes1 = c(a1$X2..sepConcat.fix..1.0.pts.,
           a1$X4..padZero.fix..1.0.pts.,
           a1$X6..mulByDigit.fix..1.0.pts.,
           b1$X2..sepConcat.fix..1.0.pts.,
           b1$X4..padZero.fix..1.0.pts.,
           b1$X6..mulByDigit.fix..1.0.pts.)
fixes2 = c(a2$X2..sepConcat.fix..1.0.pts.,
           a2$X4..padZero.fix..1.0.pts.,
           a2$X6..mulByDigit.fix..1.0.pts.,
           b2$X2..sepConcat.fix..1.0.pts.,
           b2$X4..padZero.fix..1.0.pts.,
           b2$X6..mulByDigit.fix..1.0.pts.)
fixes = data.frame(fixes0, fixes1, fixes2)
# filter out answers that any annotator marked as INCOMPLETE
fixes = fixes[fixes$fixes0 != -1 & fixes$fixes1 != -1 & fixes$fixes2 != -1,]

print("REASONS")
print(table(reasons[,1]))
print(table(reasons[,2]))
print(table(reasons[,3]))
print(kappam.fleiss(reasons[,1:3],exact=TRUE,detail=TRUE))
#print(kappam.fleiss(reasons[1:3],detail=TRUE))

print("FIXES")
print(table(fixes[,1]))
print(table(fixes[,2]))
print(table(fixes[,3]))
print(kappam.fleiss(fixes[,1:3],exact=TRUE,detail=TRUE))
#print(kappam.fleiss(fixes[1:3],detail=TRUE))

significance <- function(x,y) {
  print(x)
  print(mean(x))
  print(y)
  print(mean(y))
  wilcox.test(x, y, alternative="g")
}

print("sepconcat reason")
print(significance(
        b0$X1..sepConcat.explain..1.0.pts.[b0$X1..sepConcat.explain..1.0.pts. != -1],
        a0$X1..sepConcat.explain..1.0.pts.[a0$X1..sepConcat.explain..1.0.pts. != -1]
))

print("padzero reason")
print(significance(
        a0$X3..padZero.explain..1.0.pts.[a0$X3..padZero.explain..1.0.pts. != -1],
        b0$X3..padZero.explain..1.0.pts.[b0$X3..padZero.explain..1.0.pts. != -1]
))

print("mulbydigit reason")
print(significance(
        b0$X5..mulByDigit.explain..1.0.pts.[b0$X5..mulByDigit.explain..1.0.pts. != -1],
        a0$X5..mulByDigit.explain..1.0.pts.[a0$X5..mulByDigit.explain..1.0.pts. != -1]
))

print("sepconcat fix")
print(significance(
        b0$X2..sepConcat.fix..1.0.pts.[b0$X2..sepConcat.fix..1.0.pts. != -1],
        a0$X2..sepConcat.fix..1.0.pts.[a0$X2..sepConcat.fix..1.0.pts. != -1]
))

print("padzero fix")
print(significance(
        a0$X4..padZero.fix..1.0.pts.[a0$X4..padZero.fix..1.0.pts. != -1],
        b0$X4..padZero.fix..1.0.pts.[b0$X4..padZero.fix..1.0.pts. != -1]
))

print("mulbydigit fix")
print(significance(
        b0$X6..mulByDigit.fix..1.0.pts.[b0$X6..mulByDigit.fix..1.0.pts. != -1],
        a0$X6..mulByDigit.fix..1.0.pts.[a0$X6..mulByDigit.fix..1.0.pts. != -1]
))

# print("append")
# print(significance(
#         c(b3$X5..append.reason[b3$X5..append.reason != -1],
#           b3$X6..append.fix[b3$X6..append.fix != -1]),
#         c(a3$X1..append.reason[a3$X1..append.reason != -1],
#           a3$X2..append.fix[a3$X2..append.fix != -1])
# ))

# print("digistofint")
# print(significance(
#         c(b3$X7..digitsofint.reason[b3$X7..digitsofint.reason != -1],
#           b3$X8..digitsofint.fix[b3$X8..digitsofint.fix != -1]),
#         c(a3$X3..digitsofint.reason[a3$X3..digitsofint.reason != -1],
#           a3$X4..digitsofint.fix[a3$X4..digitsofint.fix != -1])
# ))

# print("sumlist")
# print(significance(
#         c(a3$X5..sumlist.reason[a3$X5..sumlist.reason != -1],
#           a3$X6..sumlist.fix[a3$X6..sumlist.fix != -1]),
#         c(b3$X1..sumlist.reason[b3$X1..sumlist.reason != -1],
#           b3$X2..sumlist.fix[b3$X2..sumlist.fix != -1])
# ))

# print("wwhile")
# print(significance(
#         c(a3$X7..wwhile.reason[a3$X7..wwhile.reason != -1],
#           a3$X8..wwhile.fix[a3$X8..wwhile.fix != -1]),
#         c(b3$X3..wwhile.reason[b3$X3..wwhile.reason != -1],
#           b3$X4..wwhile.fix[b3$X4..wwhile.fix != -1])
# ))

# print("total reason")
# print(significance(
#         c(b3$X5..append.reason[b3$X5..append.reason != -1],
#           b3$X7..digitsofint.reason[b3$X7..digitsofint.reason != -1],
#           a3$X5..sumlist.reason[a3$X5..sumlist.reason != -1],
#           a3$X7..wwhile.reason[a3$X7..wwhile.reason != -1]),
#         c(a3$X1..append.reason[a3$X1..append.reason != -1],
#           a3$X3..digitsofint.reason[a3$X3..digitsofint.reason != -1],
#           b3$X1..sumlist.reason[b3$X1..sumlist.reason != -1],
#           b3$X3..wwhile.reason[b3$X3..wwhile.reason != -1])
# ))

# print("total fix")
# print(significance(
#         c(b3$X6..append.fix[b3$X6..append.fix != -1],
#           b3$X8..digitsofint.fix[b3$X8..digitsofint.fix != -1],
#           a3$X6..sumlist.fix[a3$X6..sumlist.fix != -1],
#           a3$X8..wwhile.fix[a3$X8..wwhile.fix != -1]),
#         c(a3$X2..append.fix[a3$X2..append.fix != -1],
#           a3$X4..digitsofint.fix[a3$X4..digitsofint.fix != -1],
#           b3$X2..sumlist.fix[b3$X2..sumlist.fix != -1],
#           b3$X4..wwhile.fix[b3$X4..wwhile.fix != -1])
# ))

# print("total")
# print(significance(
#         c(b3$X5..append.reason[b3$X5..append.reason != -1],
#           b3$X7..digitsofint.reason[b3$X7..digitsofint.reason != -1],
#           a3$X5..sumlist.reason[a3$X5..sumlist.reason != -1],
#           a3$X7..wwhile.reason[a3$X7..wwhile.reason != -1],
#           b3$X6..append.fix[b3$X6..append.fix != -1],
#           b3$X8..digitsofint.fix[b3$X8..digitsofint.fix != -1],
#           a3$X6..sumlist.fix[a3$X6..sumlist.fix != -1],
#           a3$X8..wwhile.fix[a3$X8..wwhile.fix != -1]),
#         c(a3$X1..append.reason[a3$X1..append.reason != -1],
#           a3$X3..digitsofint.reason[a3$X3..digitsofint.reason != -1],
#           b3$X1..sumlist.reason[b3$X1..sumlist.reason != -1],
#           b3$X3..wwhile.reason[b3$X3..wwhile.reason != -1],
#           a3$X2..append.fix[a3$X2..append.fix != -1],
#           a3$X4..digitsofint.fix[a3$X4..digitsofint.fix != -1],
#           b3$X2..sumlist.fix[b3$X2..sumlist.fix != -1],
#           b3$X4..wwhile.fix[b3$X4..wwhile.fix != -1])
# ))
