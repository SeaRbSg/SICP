#lang racket
(require "streams.rkt"
         rackunit)

(define (partial-sums s)
  (cons-stream (stream-car s)
               (add-streams (stream-cdr s)
                            (partial-sums s))))

(let ((sums (partial-sums integers)))
  (check-equal? (stream-ref sums 0) 1)
  (check-equal? (stream-ref sums 1) 3)
  (check-equal? (stream-ref sums 2) 6)
  (check-equal? (stream-ref sums 3) 10))
