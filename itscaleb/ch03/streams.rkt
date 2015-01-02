#lang racket
(require rackunit)

(define-syntax-rule (cons-stream a b)
  (cons a (delay b)))

(define (stream-car stream)
  (car stream))

(define (stream-cdr stream)
  (force (cdr stream)))

(define (stream-enumerate-interval low high)
  (cond [(> low high) the-empty-stream]
        [else
         (cons-stream
          low
          (stream-enumerate-interval (+ low 1) high))]))

(define (stream-filter pred stream)
  (cond [(stream-null? stream) the-empty-stream]
        [(pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter pred 
                                     (stream-cdr stream)))]
        [else
         (stream-filter pred (stream-cdr stream))]))

(define stream-null? null?)

(define the-empty-stream '())

(provide cons-stream
         stream-car
         stream-cdr
         stream-null?
         stream-filter
         the-empty-stream
         stream-enumerate-interval)

(define stream-tests
  (test-suite
   "Tests for streams.rkt"
   
   (let ([interval (stream-enumerate-interval 1 10000000)])
     (check-equal? (stream-car interval) 1)
     (check-equal? (stream-car (stream-cdr interval)) 2))))
