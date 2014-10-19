#lang racket
(require rackunit)

(define (adjoin-set x set)
  (cond [(null? set) (cons x '())]
        [(= x (car set)) set]
        [(< x (car set))
         (cons x set)]
        [(> x (car set))
         (cons (car set)
               (adjoin-set x (cdr set)))]))

(check-equal? (adjoin-set 3 '(1 2))
              '(1 2 3))

(check-equal? (adjoin-set 2 '(1 2 3))
              '(1 2 3))

(check-equal? (adjoin-set 1 '())
              '(1))

;[2 4 6 8] 5

