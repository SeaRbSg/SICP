#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; Find how many steps it takes to find the fixed point of
; x => log(1000)/log(x)
; with and without average damping

; 35 steps with no average damping
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)

(newline)

; 10 steps with average damping
(fixed-point (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2)) 2.0)