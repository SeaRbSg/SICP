#lang racket
(require rackunit)

(define (union-set set1 set2)
  (cond [(null? set1) set2]
        [(null? set2) set1]
        [(= (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) (cdr set2)))]
        [(< (car set1) (car set2))
         (cons (car set1) (union-set (cdr set1) set2))]
        [(> (car set1) (car set2))
         (cons (car set2 (union-set set1 (cdr set2))))]))

(check-equal? (union-set '(1 2 3) '(4 5 6))
               '(1 2 3 4 5 6))

(check-equal? (union-set '(1 2 3) '(2 3 4))
              '(1 2 3 4))

(check-equal? (union-set '() '(1 2 3))
              '(1 2 3))

(check-equal? (union-set '(1 2 3) '())
              '(1 2 3))
