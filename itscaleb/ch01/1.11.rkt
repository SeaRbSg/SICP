#lang racket
(require rackunit)

; original recursive procedure
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

(define (g n)
  (g-iter 2 1 0 n))

(define (g-iter a b c count)
  (if (= count 0)
      c
      (g-iter (+ a 
                 (* 2 b)
                 (* 3 c))
              a
              b
              (- count 1))))

(check-equal? (g 1) 1)
(check-equal? (g 2) 2)
(check-equal? (g 3) 4)
(check-equal? 11 (g 4))
(check-equal? 25 (g 5))