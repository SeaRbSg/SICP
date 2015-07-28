#lang racket
(require rackunit)

(define (fib_slow n)
  (cond
    [(= 0 n) 0]
    [(= 1 n) 1]
    [else (+ (fib_slow (- n 1)) (fib_slow (- n 2)))]))

(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

[check-equal? (fib_slow 9) (fib 9)]

; A function f is defined by the rule that
; f(n) = n if n<3 and
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3.
; Write a procedure that computes f by means of a recursive process.
; Write a procedure that computes f by means of an iterative process.

(define (f_rec n)
  (if (< n 3)
      n
      (+ (f_rec (- n 1))
         (* 2 (f_rec (- n 2)))
         (* 3 (f_rec (- n 3))))))

(define (fit n1 n2 n3 count)
  (if (= count 0)
      n3
      (fit (+ n1 (* 2 n2) (* 3 n3)) n1 n2 (- count 1))))

(define (f_itr n)
  (fit 2 1 0 n))

[check-equal? (f_rec 13) (f_itr 13)]

; the ideas is a list where we keep track of f(n - 1), f(n - 2) and f(n - 3)
; in order and keep pushing the tail out of the way
; as many times as needed (counter)

