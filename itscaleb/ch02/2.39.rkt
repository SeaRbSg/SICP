#lang racket
(require rackunit)

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))

(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))

(check-equal? (reverse-r '(1 2 3))
              '(3 2 1))

(check-equal? (reverse-l '(1 2 3))
              '(3 2 1))
; fold right:
; (f 1 (f 2 (f 3 null)))

; fold left:
; (f (f (f null 1) 2) 3)