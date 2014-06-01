#lang r5rs

(define (sum-square-of-two-largest a b c)
  (define least (min a b c))
  (cond ((= a least) (+ (* b b) (* c c)))
        ((= b least) (+ (* a a) (* c c)))
        (else (+ (* a a) (* b b))))
  )

(display (sum-square-of-two-largest 1 2 3)) (newline)

(display (sum-square-of-two-largest 3 2 1)) (newline)

(display (sum-square-of-two-largest 1 3 2)) (newline)

(display (sum-square-of-two-largest 2 3 1)) (newline)
