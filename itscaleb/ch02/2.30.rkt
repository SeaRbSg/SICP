#lang racket
(require rackunit)

(define (square-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (* tree tree))
        (else
         (cons (square-tree (car tree))
               (square-tree (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (square-tree-map subtree)
             (* subtree subtree)))
       tree))

(check-equal? (square-tree
               (list 1
                     (list 2 (list 3 4) 5)
                     (list 6 7)))
              (list 1
                    (list 4 (list 9 16) 25)
                    (list 36 49)))

(check-equal? (square-tree-map
               (list 1
                     (list 2 (list 3 4) 5)
                     (list 6 7)))
              (list 1
                    (list 4 (list 9 16) 25)
                    (list 36 49)))