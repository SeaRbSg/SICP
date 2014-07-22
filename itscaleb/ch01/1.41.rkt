#lang racket
(require rackunit)

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ 1 x))

(check-equal? ((double inc) 1) 3)