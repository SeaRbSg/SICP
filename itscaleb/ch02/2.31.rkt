#lang racket
(require rackunit)

(define (tree-map fn tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (tree-map fn subtree)
             (fn subtree)))
       tree))

(check-equal? (tree-map (lambda (x) (* x x))
               (list 1
                     (list 2 (list 3 4) 5)
                     (list 6 7)))
              (list 1
                    (list 4 (list 9 16) 25)
                    (list 36 49)))