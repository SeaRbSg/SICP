;; each element should be twice as much as the previous element

#lang racket
(require "streams.rkt" 
         rackunit)

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define s (cons-stream 1 (add-streams s s)))

(check-equal? (stream-ref s 0) 1)
(check-equal? (stream-ref s 1) 2)
(check-equal? (stream-ref s 2) 4)
(check-equal? (stream-ref s 3) 8)
