#lang racket
(require rackunit)
(require math/base)

(define (cont-frac n d k)
  (define (term i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (d i) (term (+ i 1))))))
  (term 1))

(check-= 
 (cont-frac (lambda (i) 1.0)
            (lambda (i) 1.0)
            11)
 (/ 1 phi.0)
 .0001)
 