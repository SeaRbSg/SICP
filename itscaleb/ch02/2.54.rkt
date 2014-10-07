#lang racket
(require rackunit)

(define (equal? a b)
  (cond [(and (null? a) (null? b))
         #t]
        [(or (null? a) (null? b))
         #f]
        [(eq? (car a) (car b))
         (equal? (cdr a) (cdr b))]
        [(and (pair? (car a)) (pair? (car b)))
         (and (equal? (car a) (car b))
              (equal? (cdr a) (cdr b)))]
        [else #f]))

(check-true (equal? '(this is a list) '(this is a list)))
(check-true (equal? '(this (is a) list) '(this (is a) list)))
(check-true (equal? '(this (is (a)) list) '(this (is (a)) list)))
(check-false (equal? '(this is a list) '(this is a)))
(check-false (equal? '(this ((is) a) list) '(this (is (a)) list)))
(check-false (equal? '(this is a list) '(this (is a) list)))

