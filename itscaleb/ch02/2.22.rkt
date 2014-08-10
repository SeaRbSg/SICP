#lang racket

(define (square-list items)
  (define (square x) (* x x))
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

; The list is produced in reverse order because on each iteration he is cons'ing the square
; of the first item on the list to the back of the resulting list.

(define (square-list1 items)
  (define (square x) (* x x))
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer 
                    (square (car things))))))
  (iter items '()))

; this 'fixed' version doesn't work either, because the first value to cons is a list. It's making a list where
; the first value is another list. What he should be doing is appending (car things) to the list on each iteration.