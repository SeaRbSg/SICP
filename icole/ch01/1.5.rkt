#lang racket
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;(test 0 (p))

;In normal-order evaluation then 0 will be returned.
;This is because the function (p) is not evaluated ahead of time, so it is never actually
;called, since (= x 0) is true and 0 not the function (p) for y is returned

;In applicative-order the call will hang and not terminate since (p) will attempt to be evaluated
;in the place of y, which ends up being an infinite loop calling itself over and over again.