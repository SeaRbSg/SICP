#lang racket
(require rackunit)

(define (last-pair lst)
  (if (null? (cdr lst))
      lst
      (last-pair (cdr lst))))

(check-equal? (list 34)
              (last-pair (list 23 72 149 34)))