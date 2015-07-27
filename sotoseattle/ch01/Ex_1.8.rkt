#lang racket
(require rackunit)

(define (cubert x)
  (cubert-iter 1.0 x 0.0))

(define (cubert-iter guess x last_guess)
  (if
    (good-enough? (delta guess last_guess))
    guess
    (cubert-iter (improve guess x) x guess)))

(define (delta a b) (abs (- a b)))

(define (good-enough? delta) (< delta 0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3)) ; this is all we really changed

(define (square x) (* x x))

[check-equal?  (cubert 2197)  13.000000000002023]

