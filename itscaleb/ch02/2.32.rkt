#lang racket

(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest 
                (map (lambda (x) 
                       (cons (car s)
                               x))
                     rest)))))

(subsets (list 1 2 3))

; this works by taking the subset of the last number in the list (which is itself and the empty set),
; and then appends that subset to itself with the next number appended to each of the subsets.