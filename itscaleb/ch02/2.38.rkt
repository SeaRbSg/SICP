#lang racket

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

(fold-right / 1 '(1 2 3))
(fold-left / 1 '(1 2 3))
(fold-right list null '(1 2 3))
(fold-left list null '(1 2 3))

; A property that op must satisfy to guarantee that fold-right and fold-left will
; produce the same values for any sequence, is that it must be cummulative.