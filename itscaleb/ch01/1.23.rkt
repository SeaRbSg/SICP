#lang planet neil/sicp

; The numbers below have a good improvement with this optimization, although it isn't quite twice as fast.
; I'm guessing that although the next method is much better, there is still that conditional statement
; that needs to be checked on each call.
; 

;1000003 *** 268
;1000033 *** 265
;1000037 *** 304

;10000019 *** 358
;10000079 *** 359
;10000103 *** 355

;100000007 *** 1229
;100000037 *** 1226
;100000039 *** 1155

;1000000007 *** 3449
;1000000009 *** 3405
;1000000021 *** 3435

;10000000019 *** 10878
;10000000033 *** 10966
;10000000061 *** 10837

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
        (else (find-divisor n (next test-divisor)))))

(define (next n)
  (cond ((= 2 n) 3)
        (else (+ n 2))))

(define (square a) (* a a))

(define (divides? a b)
  (= (remainder b a) 0))
