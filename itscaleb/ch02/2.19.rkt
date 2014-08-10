#lang racket

(define us-coins (list 50 15 10 5 1))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (no-more? coin-values)
  (null? coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (first-denomination coin-values)
  (car coin-values))

; By changing the order of the list, you can see that it doesn't matter
; what order the list is in.  This is because the procedure is tree
; recursive, and each branch is processed independently of the other
; values in the list.