#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))

; Trying to find out what (f n) is:
(f 0) ; 0
(f 1) ; 2
(f 3) ; 6
; (f n) is 2n

; Tring to find out what (g n) is:
(g 0) ; 0
(g 1) ; 2
(g 2) ; 4
(g 3) ; 8
(g 4) ; 16
; (g n) is 2^n for n > 0

; Trying to find out what (h n) is:
(h 0) ; 0
(h 1) ; 2 = 2
(h 2) ; 4 = 2^(2)
(h 3) ; 16 = 2^(2^2)
(h 4) ; 65536 = 2^(2^2^2)
(h 5) ; WTF = probably 2^(2^2^2^2)
; I found a pattern but I'm not really sure how to express this.