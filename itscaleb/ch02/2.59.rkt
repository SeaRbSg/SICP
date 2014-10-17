#lang racket
(require rackunit)

(define (element-of-set? x set)
  (cond [(null? set) false]
        [(equal? x (car set)) #t]
        [else
         (element-of-set? x (cdr set))]))

(define (union-set set1 set2)
  (cond [(null? set1) set2]
        [(null? set2) set1]
        [(element-of-set? (car set1) set2)
         (union-set (cdr set1) set2)]
        [else
         (union-set (cdr set1) (cons (car set1) set2))]))

(check-equal? (union-set '(1 2) '(2 3))
              '(1 2 3))

(check-equal? (union-set '(1 2 3) '(8 9 10))
              '(3 2 1 8 9 10))
