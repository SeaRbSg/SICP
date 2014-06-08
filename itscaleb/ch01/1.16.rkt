#lang racket
(require rackunit)

(define (fast-expt b n)
  (expt-itr b n 1))

(define (expt-itr b n a)
  (cond
    ((= n 0) a)
    ((even? n)(expt-itr (square b) (/ n 2) a))
    (else 
     (expt-itr b (- n 1) (* a b)))))

(define (square a) (* a a))

(check-equal? (fast-expt 2 2) 4)
(check-equal? (fast-expt 2 3) 8)
(check-equal? (fast-expt 3 3) 27)