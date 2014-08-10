#lang racket
(require rackunit)

(define (reverse lst)
  (if (null? (cdr lst))
      lst
      (append (reverse (cdr lst))
              (list (car lst)))))

(check-equal? (reverse (list 1 2 3 4))
              (list 4 3 2 1))