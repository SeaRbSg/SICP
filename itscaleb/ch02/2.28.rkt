#lang racket
(require rackunit)

(define (fringe tree)
  (cond ((null? tree) tree)
        ((pair? (car tree))
         (append (fringe (car tree)) (fringe (cdr tree))))
        (else
         (cons (car tree) (fringe (cdr tree))))))
         

(check-equal? (fringe (list (list 1 2) (list 3 4 (list 5 6))))
              (list 1 2 3 4 5 6))

(check-equal? (fringe (list (list 1 2) 3 4))
              (list 1 2 3 4))