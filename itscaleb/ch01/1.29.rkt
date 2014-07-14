#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (next x) (+ 1 x))
  (define (coeff x)
    (cond ((= x 0) 1)
          ((= x n) 1)
          ((even? x) 2)
          (else 4)))
  (define (y k)
    (f (+ a (* k h))))
  (define (term x)
    (* (coeff x)
       (y x)))
  (* (/ h 3) (sum term 0 next n)))