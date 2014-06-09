#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
; 1024
(A 2 4)
; 65536
(A 3 3)
; 65536

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

; k(n) is 5n^2

(f 1) ; 2 
(f 2) ; 4
(f 3) ; 6
(f 4) ; 8
; f(n) is 2n
; because this is the 2nd clause in the cond:
; ((= x 0) (* 2 y))

(g 1) ; 2
(g 2) ; 4
(g 3) ; 8
(g 4) ; 16
; f(n) is 2^n

(h 1) ; 2         2**1
(h 2) ; 4         2**2
(h 3) ; 16        2**4
(h 4) ; 65536     2**16
; f(n) is 2^(h(n-1))

