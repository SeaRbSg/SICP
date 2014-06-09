#lang r5rs

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

(display (A 1 10)) (newline)
(display (A 2 4)) (newline)
(display (A 3 3)) (newline)

(display (f 1)) (newline)
(display (f 2)) (newline)
(display (f 3)) (newline)
(display (f 4)) (newline)
(display (f 5)) (newline)
(display (f 20)) (newline)

(newline)

(display (g 1)) (newline)
(display (g 2)) (newline)
(display (g 3)) (newline)
(display (g 4)) (newline)
(display (g 5)) (newline)
(display (g 20)) (newline)

(newline)

(display (h 1)) (newline)
(display (h 2)) (newline)
(display (h 3)) (newline)
(display (h 4)) (newline)
(display (h 5)) (newline)
(display (h 20)) (newline)

(newline)