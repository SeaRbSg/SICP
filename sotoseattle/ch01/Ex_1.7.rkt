#lang racket
(require rackunit)

(define (sqrt x)
  (sqrt-iter 1.0 x 0.0))

(define (sqrt-iter guess x last_guess)
  (if
    (good-enough? (delta guess last_guess))
    guess
    (sqrt-iter (improve guess x) x guess)))

(define (delta a b) (abs (- a b)))

(define (good-enough? delta) (< delta 0.001))

(define (improve guess x) (average guess (/ x guess)))

(define (average a b) (/ (+ a b) 2))

(define (square x) (* x x))

[check-equal? (sqrt 9)  3.000000001396984]

