#lang racket
(require rackunit)

; first implementation without map
(define (square-list items)
  (if (null? items)
      '()
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

; implementation with map
(define (square-list-map items)
  (map (lambda (item) (* item item)) items))

; tests
(check-equal? (square-list (list 1 2 3 4))
              (list 1 4 9 16))

(check-equal? (square-list-map (list 1 2 3 4))
              (list 1 4 9 16))