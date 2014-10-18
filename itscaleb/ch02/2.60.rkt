#lang racket
(require rackunit)

(define (element-of-set? x set)
  (cond [(null? set) false]
        [(equal? x (car set)) #t]
        [else
         (element-of-set? x (cdr set))]))

(define (union-set set1 set2)
  (append set1 set2))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  (cond [(or (null? set1) (null? set2)) '()]
        [(element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set 2))]
        [else
         (intersection-set (cdr set1) set2)]))

(check-equal? (union-set '(1 2) '(2 3))
              '(1 2 2 3))

(check-equal? (union-set '(1 2 3) '(8 9 10))
              '(1 2 3 8 9 10))

; since duplicates are allowed, union-set and adjoin set do not need to first check to see if the elements
; are part of the other set, which gives them a constant runtime O(1) which is an improvement over O(n).
; If the operations in the program are primarily union-set and adjoin, this could possibly be preferred
; over the other representation.
