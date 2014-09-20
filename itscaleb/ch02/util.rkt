#lang racket

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next n)
  (cond ((= 2 n) 3)
        (else (+ n 2))))

(define (square a) (* a a))

(define (divides? a b)
  (= (remainder b a) 0))

(define (enumerate-interval x y)
  (cond ((> x y) null)
        (else
         (cons x (enumerate-interval (+ 1 x) y)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(provide prime?
         enumerate-interval
         accumulate)