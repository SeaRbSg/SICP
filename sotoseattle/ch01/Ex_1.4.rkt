#lang racket
(require rackunit)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; the operator is also the result of the expression (if (> b 0) + -)
; so the procedure can either be (+ a b) or (- a b)
; in the second case, since b<0, a - b == a + |b|

