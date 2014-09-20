#lang racket
(require rackunit)
(require "util.rkt")

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j)
            (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter (lambda (pair)
                 (prime? (+ (car pair) (cadr pair))))
               (unique-pairs n))))

(check-equal? (prime-sum-pairs 3)
              '((2 1 3) (3 2 5)))