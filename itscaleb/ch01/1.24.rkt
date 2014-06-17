#lang planet neil/sicp
; The numbers below have a huge improvement.
; log 1000 = 3, and log 1000000 = 6, so I would expect the times near 1000000 to be double that of 1000.

;1009 *** 35
;1013 *** 35
;1019 *** 35

;1000003 *** 70
;1000033 *** 43
;1000037 *** 39

;10000019 *** 46
;10000079 *** 43
;10000103 *** 43

;100000007 *** 47
;100000037 *** 46
;100000039 *** 46

;1000000007 *** 49
;1000000009 *** 48
;1000000021 *** 47

(define (search-for-primes min max)
  (cond ((and (odd? min) (< min max))
         (timed-prime-test min)
         (search-for-primes (+ 2 min) max))
        ((< min max)
         (search-for-primes (+ 1 min) max))))

(define (odd? a)
  (not (= (remainder a 2) 0)))
  
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((fast-prime? n 3)
         (display n)
         (report-prime (- (runtime) start-time))
         (newline))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next n)
  (cond ((= 2 n) 3)
        (else (+ n 2))))

(define (square a) (* a a))

(define (divides? a b)
  (= (remainder b a) 0))
