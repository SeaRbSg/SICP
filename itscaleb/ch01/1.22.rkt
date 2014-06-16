#lang planet neil/sicp
; I had to modify some of the code from the book to work, and also to only print the primes. No major changes though.

;1000003 *** 186
;1000033 *** 198
;1000037 *** 186

;10000019 *** 545
;10000079 *** 547
;10000103 *** 553

;100000007 *** 1732
;100000037 *** 1715
;100000039 *** 1689

;1000000007 *** 5323
;1000000009 *** 5379
;1000000021 *** 5364

;10000000019 *** 17304
;10000000033 *** 17457
;10000000061 *** 19451

; To get better results, I ended up trying larger numbers, and also taking a wider range 
; around the numbers we were looking for because the first few results were off. I also
; installed an SICP package for DrRacket which had a timer like in the book.

; After these changes, we are getting growth close to sqrt(n).

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
        (else (find-divisor n (+ test-divisor 1)))))

(define (square a) (* a a))

(define (divides? a b)
  (= (remainder b a) 0))
