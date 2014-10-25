#lang racket
(require rackunit)

(define (union-set set1 set2)
  (let ([list1 (tree->list set1)]
        [list2 (tree->list set2)])
    (let ([unioned-set (union-set-list list1 list2)])
      (list->tree unioned-set))))

(define (intersection-set set1 set2)
  (let ([list1 (tree->list set1)]
        [list2 (tree->list set2)])
    (let ([set (intersection-set-list list1 list2)])
      (list->tree set))))

(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(define (intersection-set-list set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set-list (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set-list (cdr set1) set2))
              ((< x2 x1)
               (intersection-set-list set1 (cdr set2)))))))

(define (union-set-list set1 set2)
  (cond [(null? set1) set2]
        [(null? set2) set1]
        [(= (car set1) (car set2))
         (cons (car set1) (union-set-list (cdr set1) (cdr set2)))]
        [(< (car set1) (car set2))
         (cons (car set1) (union-set-list (cdr set1) set2))]
        [(> (car set1) (car set2))
         (cons (car set2 (union-set-list set1 (cdr set2))))]))

(define (left-branch tree)
  (cadr tree))

(define (entry tree)
  (car tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(let ([tree1 (list->tree '(1 2 3))]
      [tree2 (list->tree '(2 3 4))])
  (check-equal? (tree->list (union-set tree1 tree2))
                '(1 2 3 4))
  (check-equal? (tree->list (intersection-set tree1 tree2))
                '(2 3)))
