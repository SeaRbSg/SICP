#lang racket
(require rackunit)

(define (same-parity . lst)
  (cond ((even? (car lst))
         (filter even? lst))
        (else
         (filter odd? lst))))

(check-equal? (same-parity 2 5 8 4 5 10)
             (list 2 8 4 10))

(check-equal? (same-parity 1 5 8 4 5 10)
             (list 1 5 5))
