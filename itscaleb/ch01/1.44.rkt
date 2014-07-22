#lang racket
(require rackunit)

(define (smooth f dx)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(check-equal?
 ((smooth (lambda (x) (* x 2)) 1) 2)
 4)