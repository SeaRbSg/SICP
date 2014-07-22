#lang racket
(require rackunit)
(require "1.42.rkt")

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (square x) (* x x))
      
(check-equal?
 ((repeated square 2) 5)
 625)