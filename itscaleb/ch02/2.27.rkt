#lang racket
(require rackunit)

(define (reverse lst)
  (cond ((null? lst) lst)
        ((pair? (car lst))
         (append (reverse (cdr lst)) (list (reverse (car lst)))))
        (else
         (append (reverse (cdr lst))
                 (list (car lst))))))


(check-equal? (reverse (list 1 2))
              (list 2 1))

(check-equal? (reverse (list (list 1) (list 2)))
              (list (list 2) (list 1)))

(check-equal? (reverse (list (list 1 2) (list 3 4)))
              (list (list 4 3) (list 2 1)))

