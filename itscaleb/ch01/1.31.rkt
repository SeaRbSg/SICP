#lang racket
(require rackunit)

(define (identity x) x)
(define (inc x) (+ 1 x))

; recursive product function
(define (product-r term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-r term (next a) next b))))

(define (factorial-r n)
  (product-r identity 1 inc n))

(check-equal? (factorial-r 5) 120)
(check-equal? (factorial-r 4) 24)

; iterative product function
(define (product-i term a next b)
  (define (iter curr prod)
    (if (> curr b)
        prod
        (iter (next curr)
              (* (term curr) prod))))
  (iter a 1))

(define (factorial-i n)
  (product-i identity 1 inc n))

(check-equal? (factorial-i 3) 6)
(check-equal? (factorial-i 6) 720)