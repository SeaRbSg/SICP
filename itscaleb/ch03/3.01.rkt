#lang racket
(require rackunit)

(define (make-accumulator initial)
  (lambda (n)
    (set! initial (+ initial n))
    initial))

(define A (make-accumulator 5))
(check-equal? (A 10) 15)
(check-equal? (A 10) 25)
