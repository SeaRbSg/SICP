#lang racket
(require rackunit
         "codetree.rkt")

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (cond [(null? (cdr leaf-set)) 
         (car leaf-set)]
        [else
         (successive-merge 
          (adjoin-set (make-code-tree 
                       (car leaf-set) 
                       (cadr leaf-set)) 
                      (cddr leaf-set)))]))


; try to make the sample-tree given in ex. 2.68
(define sample-pairs '((A 4) (B 2) (D 1) (C 1)))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'C 1)
                                   (make-leaf 'D 1)))))

(check-equal? (generate-huffman-tree sample-pairs)
               sample-tree)
