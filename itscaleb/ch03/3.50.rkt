#lang racket
(require "streams.rkt")
(require rackunit)

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

(let* [(numbs1 (stream-enumerate-interval 1 5))
       (numbs2 (stream-enumerate-interval 1 5))
       (mapped (stream-map + numbs1 numbs2))]
  (check-equal? (stream-car mapped) 2)
  (check-equal? (stream-car (stream-cdr mapped)) 4))
