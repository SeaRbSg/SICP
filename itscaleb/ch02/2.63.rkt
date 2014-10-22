#lang racket

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define tree-1 (make-tree 7
                        (make-tree 3 
                                   (make-tree 1 '() '())
                                   (make-tree 5 '() '()))
                        (make-tree 9
                                   '()
                                   (make-tree 11 '() '()))))

(define tree-2 (make-tree 3
                          (make-tree 1 '() '())
                          (make-tree 7
                                     (make-tree 5 '() '())
                                     (make-tree 9
                                                '()
                                                (make-tree 11 '() '())))))

(define tree-3 (make-tree 5
                          (make-tree 3
                                     (make-tree 1 '() '())
                                     '())
                          (make-tree 9
                                     (make-tree 7 '() '())
                                     (make-tree 11 '() '()))))
(tree->list-1 tree-1)
(tree->list-2 tree-1)
(tree->list-2 tree-2)
(tree->list-2 tree-2)
(tree->list-2 tree-3)
(tree->list-2 tree-3)

;; a) The two functions appear to produce the same output for each tree.

;; b) Each function visits each tree once. When a tree is visited, the first function uses the append operator,
;; and the second function uses the cons operator. So the running time will be n * (running time of append or cons).

