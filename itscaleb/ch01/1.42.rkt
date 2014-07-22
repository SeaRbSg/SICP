#lang racket
(require rackunit)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ 1 x))

(check-equal?
 ((compose square inc) 6)
 49)

(provide compose)