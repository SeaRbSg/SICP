#lang racket
(require rackunit)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (list tree))
        (else
         (append (enumerate-tree (car tree))
                 (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate + 0
   (map (lambda (leaf) 1) (enumerate-tree t))))

(check-equal?
 (count-leaves '(((1 2) 3 4) ((1 2) 3 4)))
 8)