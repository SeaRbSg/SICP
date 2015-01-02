#lang racket
(require "streams.rkt")

(define (show x)
  (print x)
  x)

(define x (stream-map show (stream-enumerate-interval 0 10)))

(stream-ref x 5)

(stream-ref x 7)
