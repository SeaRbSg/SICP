#lang racket
(require rackunit)

(define (average a b) (/ (+ a b) 2))
(define (square x) (* x x))

(define (sqrt x)
  (define (sqrt-iter guess last_guess)
    (if (good-enough? guess last_guess) guess
        (sqrt-iter (improve guess) guess)))
  (define (good-enough? guess last_guess)
    (< (abs (- guess last_guess)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (sqrt-iter 1.0 0.0))

[check-equal? (sqrt 9)  3.000000001396984]

