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

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

(define (stream-ref stream index)
  (cond [(= index 0) (stream-car stream)]
        [else
         (stream-ref (stream-cdr stream) (- index 1))]))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define integers (cons-stream 1 (add-streams ones integers)))

(define ones (cons-stream 1 ones))

(define stream-null? null?)

(define the-empty-stream '())

(provide cons-stream
         stream-car
         stream-cdr
         stream-null?
         stream-filter
         stream-map
         stream-ref
         the-empty-stream
         stream-enumerate-interval
         add-streams
         mul-streams
         ones
         integers)

(define stream-tests
  (test-suite
   "Tests for streams.rkt"
   
   (let ([interval (stream-enumerate-interval 1 10000000)])
     (check-equal? (stream-car interval) 1)
     (check-equal? (stream-car (stream-cdr interval)) 2))))
