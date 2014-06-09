#lang r5rs

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

(display (f 0)) (newline)
(display (f 1)) (newline)
(display (f 2)) (newline)
(display (f 3)) (newline)
(display (f 4)) (newline)
(display (f 5)) (newline)
(display (f 20)) (newline)
