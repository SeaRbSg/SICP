#lang racket
(require rackunit)

(define (cubert-iter guess x)
  (if (good-enough? guess x)
	 guess
	 (cubert-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cube x)
  (* x x x))

(define (cubert x)
  (cubert-iter 1.0 x))

(test-case
 "Cube root success"
 (check-= (cubert 8) 2 0.001))