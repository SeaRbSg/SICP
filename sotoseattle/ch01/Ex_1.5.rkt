#lang racket
(require rackunit)

(define (p) (p))
(define (test x y) (if (= x 0) 0 y))

(test 0 (p))

; With applicative evaluation we first solve the operator and operands and then
; we apply them. In our case, we first evaluate test, 0 and (p).
; When we evaluate (p) we enter into an infinite loop so we can never hit the
; conditional
; If we were to use Normal order evaluation we would substitute operators and
; keep carrying the operands forward to be evaluated at the last minute.
;   (test 0 (p))
;   (if (= 0 0) 0 (p))  <= we substitute test for its body
;   0                   <= we substitute if with its evaluation
;   0                   <= this is the solution

