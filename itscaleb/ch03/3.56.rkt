#lang racket
(require "streams.rkt"
         rackunit)

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (cond ((< s1car s2car)
                  (cons-stream s1car (merge (stream-cdr s1) s2)))
                 ((> s1car s2car)
                  (cons-stream s2car (merge s1 (stream-cdr s2))))
                 (else
                  (cons-stream s1car
                               (merge (stream-cdr s1)
                                      (stream-cdr s2)))))))))

(define S (cons-stream 1 (merge (scale-stream S 2)
                                (merge (scale-stream S 3)
                                       (scale-stream S 5)))))

(check-equal? (stream-ref S 0) 1)
(check-equal? (stream-ref S 1) 2)
(check-equal? (stream-ref S 2) 3)
(check-equal? (stream-ref S 3) 4)
(check-equal? (stream-ref S 4) 5)
(check-equal? (stream-ref S 5) 6)
(check-equal? (stream-ref S 6) 8)
(check-equal? (stream-ref S 7) 9)
(check-equal? (stream-ref S 8) 10)
(check-equal? (stream-ref S 9) 12)
(check-equal? (stream-ref S 10) 15)
