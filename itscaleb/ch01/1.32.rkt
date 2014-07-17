#lang racket
(require rackunit)

; accumulate generalizes sum and product.

; recursive implementation
;(define (accumulate combiner null-value term a next b)
;  (if (> a b)
;      null-value
;      (combiner (term a)
;                (accumulate combiner null-value term (next a) next b))))

; iterative implementation
(define (accumulate combiner null-value term a next b)
  (define (iter curr accumulated)
    (if (> curr b)
        accumulated
        (iter (next curr) (combiner (term curr) accumulated))))
  (iter a null-value))

; redifine sum using accumulate
(define (sum term a next b)
  (accumulate + 0 term a next b))

; redifine product using accumulate
(define (product term a next b)
  (accumulate * 1 term a next b))

; test them out
(define (identity x) x)
(define (inc x) (+ 1 x))

(define (sum-integers a b)
  (sum identity a inc b))

(define (factorial n)
  (product identity 1 inc n))

(check-equal? (factorial 3) 6)
(check-equal? (factorial 6) 720)
(check-equal? (sum-integers 1 10) 55)