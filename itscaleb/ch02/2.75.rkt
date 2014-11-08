#lang racket
(require rackunit)

(define (make-from-mag-ang x y)
  (lambda (op)
    (cond [(eq? op 'magnitude) x]
          [(eq? op 'angle) y])))

(define (apply-generic op arg)
  (arg op))

(define (magnitude num)
  (apply-generic 'magnitude num))

(define (angle num)
  (apply-generic 'angle num))

(let ([complex-number (make-from-mag-ang 1 2)])
  (check-equal? (magnitude complex-number) 1)
  (check-equal? (angle complex-number) 2))
