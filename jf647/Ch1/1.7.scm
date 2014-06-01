#lang r5rs

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define solution (sqrt 0.001))

(display solution) (newline)
(display (square solution)) (newline)

(define solution2 (sqrt 0.0001))

(display solution2) (newline)
(display (square solution2)) (newline)
