#lang racket
(require "streams.rkt"
         rackunit)

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define ones (cons-stream 1 ones))
(define integers-from-two (cons-stream 2 (add-streams ones integers-from-two)))

(define factorials (cons-stream 1 (mul-streams integers-from-two factorials)))

(check-equal? (stream-ref factorials 1) 2)
(check-equal? (stream-ref factorials 2) 6)
(check-equal? (stream-ref factorials 3) 24)
(check-equal? (stream-ref factorials 4) 120)
