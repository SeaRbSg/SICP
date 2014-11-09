#lang racket
(require rackunit)

(define (attach-tag type-tag contents)
  (if (number? contents)
      contents
      (cons type-tag contents)))

(define (type-tag datum)
  (cond [(pair? datum) (car datum)]
        [(number? datum) 'scheme-number]
        [else
         (error "Bad tagged datum -- TYPE-TAG" datum)]))

(define (contents datum)
  (cond [(pair? datum) (cdr datum)]
        [(number? datum) datum]
        [else
         (error "Bad tagged datum -- CONTENTS" datum)])) 

(check-equal? (type-tag 5) 'scheme-number)
(check-equal? (contents 5) 5)
