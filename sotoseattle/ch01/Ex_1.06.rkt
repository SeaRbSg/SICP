#lang racket
(require rackunit)

; Newton's approx to sqr root

(define (sqrt-iter guess x)
  (if
    (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average a b)
  (/ (+ a b) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

[check-equal? (sqrt 9) 3.00009155413138]

; Alyssa's version

(define (new-if predicate then-clause else-clause)
  (cond
    [predicate then-clause]
    [else else-clause]))

(define (sqrt-iter-alyssa guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-alyssa (improve guess x) x)))

(define (sqrt-alyssa x)
  (sqrt-iter-alyssa 1.0 x))

; (sqrt-alyssa 9)

; Assuming that, like in exercise 1.5, the evaluation rule for the special form using applicative order is: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.

; Then with a cond, that no longer applies and all operands are evaluated which means that ALL the successive calls to sqrt-iter-alyssa are evaluated before the (up the tree) operators are called. This results in an infinite loop.

