#lang racket

(define (foreach func lst)
  (cond ((not (null? lst))
         (func (car lst))
         (foreach func (cdr lst)))))