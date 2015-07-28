#lang racket
(require rackunit)

(define (row r)
  (define (rowdy l)
    (if (null? (cdr l))
        '(1)
        (cons (+ (car l) (car (cdr l))) (rowdy (cdr l)))))
  (cons 1 (rowdy r)))

[check-equal? (row '(1)) '(1 1)]
[check-equal? (row '(1 1)) '(1 2 1)]
[check-equal? (row '(1 2 1)) '(1 3 3 1)]

(define (pascal n)
  (define (pascualino r c)
    (let ((new_row (row r)))
      (if (= c 0)
          '()
          (cons new_row (pascualino new_row (- c 1))))))
  (cons '(1) (pascualino '(1) (- n 1))))

[check-equal? (pascal 3) '((1) (1 1) (1 2 1))]
[check-equal? (pascal 5) '((1) (1 1) (1 2 1) (1 3 3 1) (1 4 6 4 1))]

