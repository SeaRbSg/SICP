#lang racket
(require rackunit)

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (cond ((not (pair? mobile))
         mobile)
        ((not (pair? (branch-structure mobile)))
         (branch-structure mobile))
        (else
         (+ (total-weight (branch-structure (left-branch mobile)))
            (total-weight (branch-structure (right-branch mobile)))))))
         
(let ((mobile (make-mobile
               (make-branch 1 10)
               (make-branch 1 5))))
      (check-equal? (total-weight mobile)
                    15))

(let ((mobile (make-mobile
               (make-branch 1 (make-mobile
                               (make-branch 1 6)
                               (make-branch 1 7)))
               (make-branch 1 5))))
      (check-equal? (total-weight mobile)
                    18))