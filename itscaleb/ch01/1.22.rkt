#lang racket
; I had to modify some of the code from the book to work. No major changes though.

(define (search-for-primes min max)
  (cond ((and (odd? min) (< min max))
         (timed-prime-test min)
         (search-for-primes (+ 2 min) max))
        ((< min max)
         (search-for-primes (+ 1 min) max))))

(define (odd? a)
  (not (= (remainder a 2) 0)))
  
(define (timed-prime-test n)
  (define now (runtime))
  (start-prime-test n now))

(define (start-prime-test n start-time)
  (cond ((prime? n)
         (display n)
         (report-prime (- (runtime) start-time))
         (newline))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square a) (* a a))

(define (divides? a b)
  (= (remainder b a) 0))
  
; current-inexact-milliseconds seems to be giving me the best numbers.
(define (runtime) (current-inexact-milliseconds))