#lang racket
(require rackunit)

(define (square x) (* x x))

(define (cubert x)
  (define (cubert-iter guess last_guess)
    (if (good-enough? guess last_guess) guess
        (cubert-iter (improve guess) guess)))
  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))
  (define (good-enough? guess last_guess)
    (< (abs (- guess last_guess)) 0.001))
  (cubert-iter 1.0 0.0))

[check-equal?  (cubert 2197)  13.000000000002023]

