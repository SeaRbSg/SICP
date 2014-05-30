; As the number gets smaller, the number to tolerance ratio gets larger.
; So the difference between the number and the tolerance becomes much more significant.
; 
; For large numbers, we loose precision because we have a limited number of bits to hold the number in memory. 
; The amount of precision lost could be higher than the tolerance.
;
; Tests at the bottom to demonstrate

#lang racket
(require rackunit)

(define (sqr-iter-maker good-enough-func? improve-func)
  (define (sqr-iter guess x)
    (if (good-enough-func? guess x)
        guess
        (sqr-iter (improve-func guess x)
                  x)))
  (lambda (x y)
    (sqr-iter x y)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) .001))

(define (square x)
  (* x x))

(define (square-iter-orig guess x)
  ((sqr-iter-maker good-enough? improve) guess x))

(define (sqrt x)
  (square-iter-orig 1.0 x))

(define (good-enough-improved? guess x)
  (< (abs (- (improve guess x) guess))
     (* guess .001)))

(define (square-iter-improved guess x)
  ((sqr-iter-maker good-enough-improved? improve) guess x))

(define (sqrt-improved x)
  (square-iter-improved 1.0 x))

(test-case
 "Original sqrt procedure"
 ;(check-= (sqrt 100000000000000000) 3 .001 "this never finishes")
 (check-= (sqrt .0001) .01 .001)) ; fails because of small number

(test-case
 "improved sqrt procedure"
 (check-= (sqrt-improved 100000000000000000) 316227766.017 800) ; still off, but improved
 (check-= (sqrt-improved .0001) .01 .001))
