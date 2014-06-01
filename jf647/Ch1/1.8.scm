#lang r5rs

(define (cube x)
  (* x x x))

(define (cubrt x)

  (define (cubrt-iter guess x)
    (if (good-enough? guess x)
      guess
      (cubrt-iter (improve guess x)
      x)))

  (define (improve guess x)
    (/ (+ (/ x (* guess guess)) (* guess 2)) 3))

  (define (good-enough? guess x)
    (< (abs (- (cube guess) x)) 0.001))
  
  (cubrt-iter 1.0 x))

(define solution (cubrt 64))

(display solution) (newline)
(display (cube solution)) (newline)
