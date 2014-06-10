#lang racket
(require rackunit)

; recursive edition!
(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1)) 
         (* 2 (f-recursive (- n 2))) 
         (* 3 (f-recursive (- n 3))))))

(f-recursive 1) ; 1
(f-recursive 2) ; 2
(f-recursive 3) ; 4
(f-recursive 4) ; 11
(f-recursive 5) ; 25

; iterative edition!
(define (f-iter n a b c)
  (cond ((= n 1) 1)
        ((< n 3) a)
        (else (f-iter (- n 1) 
                      (+ a (* 2 b) (* 3 c))
                      a
                      b))))

(define (f-iterative n)
  (f-iter n 2 1 0))

; tests based on recursive version to verify iterative during development
(check-equal? (f-iterative 1) 1)
(check-equal? (f-iterative 2) 2)
(check-equal? (f-iterative 3) 4)
(check-equal? (f-iterative 4) 11)
(check-equal? (f-iterative 5) 25)