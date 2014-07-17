#lang racket
(require rackunit)

(define (filtered-accumulate combiner null-value term a next b pred?)
  (if (> a b)
      null-value
      (if (pred? a)
          (combiner
           (term a)
           (filtered-accumulate combiner null-value term (next a) next b pred?))
          (filtered-accumulate combiner null-value term (next a) next b pred?))))

; took this prime function from earlier exercises
(define (prime? n)
  (if (= n 1)
      #f
      (= n (smallest-divisor n))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square a) (* a a))

(define (divides? a b)
  (= (remainder b a) 0))
; end prime function

(define (sum-of-squares-primes a b)
  (define (square x) (* x x))
  (define (inc x) (+ 1 x))
  (filtered-accumulate + 0 square a inc b prime?))

(check-equal? (sum-of-squares-primes 1 10) 87)
(check-equal? (sum-of-squares-primes 5 11) 195)