#lang racket
(require rackunit)

; 1.2
[check-equal?
  (/ (+ 5 (+ 4 (- 2 (- 3 (+ 6 (/ 4 5)))))) (* 3 (- 6 2) (- 2 7)))
  -37/150]

; 1.3
(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (square-sum-2-biggest a b c)
  (cond
    [(and (< a b) (< a c)) (sum-of-squares b c)]
    [(and (< b a) (< b c)) (sum-of-squares a c)]
    [else (sum-of-squares a b)]))

[check-equal? (sum-of-squares 2 3) 13]
[check-equal? (square-sum-2-biggest 1 2 3) 13]
[check-equal? (square-sum-2-biggest 3 2 1) 13]
[check-equal? (square-sum-2-biggest 2 3 2) 13]

