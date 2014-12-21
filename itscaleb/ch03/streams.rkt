#lang racket
(require rackunit)

(define (cons-stream a b)
  (cons a (delay b)))

(define (stream-car stream)
  (car stream))

(define (stream-cdr stream)
  (force (cdr stream)))

(define (force delayed-object)
  (delayed-object))

(define (delay exp)
  (lambda () exp))

(define (stream-enumerate-interval low high)
  (cond [(> low high) the-empty-stream]
        [else
         (cons-stream
          low
          (stream-enumerate-interval (+ low 1) high))]))

(define the-empty-stream '())

(provide 'cons-stream
         'stream-car
         'stream-cdr)

(define stream-tests
  (test-suite
   "Tests for streams.rkt"
   
   (let ([interval (stream-enumerate-interval 1 10000000)])
     (check-equal? (stream-car interval) 1)
     (check-equal? (stream-car (stream-cdr interval)) 2))))
