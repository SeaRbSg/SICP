#lang racket
(define (largest-two-sum a b c)
  (if (> a b)
      (if (> b c) 
	  (+ (square a) (square b))
	  (+ (square a) (square c)))
      (if (> a c)
	  (+ (square a) (square b))
	  (+ (square b) (square c)))))

(define (square a)
  (* a a))
