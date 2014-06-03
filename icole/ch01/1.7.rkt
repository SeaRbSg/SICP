#lang racket
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	 guess
	 (sqrt-iter (improve guess x)
		     x)))
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;(sqrt 0.00000001)
;0.03125010656242753
;Small number causes the guess to exit prematurely since the threshold is only 0.001

;(sqrt 100000000000000000)
;A significantly large number causes the program to hang in an endless loop.
;Presumably because trying to calculate the guess of that size takes up too much memory
