#lang racket
(require "1.07.rkt"
         rackunit)

(define (cube-itr guess x)
  ((sqr-iter-maker 
    (lambda (a b) ; good-enough?
      (< (abs (- (* a a a) x)) .001))
    (lambda (a b) ; improve
      (/ (+ (/ a (* b b)) (* 2 b)) 3)))
  2.0
  x))

(define (cube-root x)
  (cube-itr 1.0 x))
  

(check-= (cube-root 8) 2 .001)