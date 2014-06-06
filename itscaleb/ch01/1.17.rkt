#lang racket
(require rackunit)

(define (my* x y)
  (cond
    ((= y 1) x)
    ((even? y)
     (double (my* x (halve y))))
    (else
     (+ x (my* x (- y 1))))))

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(check-equal? 4 (my* 2 2))
(check-equal? 8 (my* 2 4))
(check-equal? 9 (my* 3 3))
(check-equal? 18 (my* 6 3))
