#lang racket
(require plot)
; I had to modify some of the code from the book to work, and also to only print the primes. No major changes though.

; 3 smallest primes larger than 1000:
;1009 - .1169 ms
;1013 - .0368 ms
;1019 - .0300 ms

; 3 smallest primes larger than 10000:
; 10007 - .1220 ms
; 10009 - .0471 ms
; 10037 - .0410 ms


; 3 smallest primes larger than 100000;
; 100003 - .1279 ms
; 100019 - .0952 ms
; 100043 - .0869 ms

; 3 smallest primes larger than 1000000;
; 1000003 - .23779296875
; 1000033 - .197998046875
; 1000037 - .18896484375

; Ignoring the first timer in each group (seems way off), we are actually getting better than sqrt n growth.
; But the growth does seem to grow in proportion to n, something around 1/5 n.

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