#lang racket
(require rackunit)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (+ (term a) result))))
  (iter a 0))

; testing
(define (identity x) x)
(define (inc x) (+ 1 x))
(define (sum-integers a b)
  (sum identity a inc b))

(check-equal? 55 (sum-integers 1 10))