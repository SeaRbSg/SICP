#lang racket
(require rackunit)

(define (my* x y)
  (mult-itr x y 0))

(define (mult-itr x y a)
  (cond 
    ((= y 0) a)
    ((even? y)
     (mult-itr (double x) (halve y) a))
    (else
     (mult-itr x (- y 1) (+ x a)))))

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(check-equal? (my* 3 0) 0)
(check-equal? (my* 2 2) 4)
(check-equal? (my* 2 4) 8)
(check-equal? (my* 3 3) 9)
(check-equal? (my* 6 4) 24)
