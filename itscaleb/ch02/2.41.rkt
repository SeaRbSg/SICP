#lang racket
(require "util.rkt")

(define (ordered-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k)
                               (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (triple-sum n s)
  (filter (lambda (triple)
            (= s (accumulate + 0 triple)))
          (ordered-triples n)))