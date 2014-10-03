#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define outline
  (let ([segment-list (list 
                       (make-segment
                        (make-vect 0 0)
                        (make-vect 0 0.9))
                       (make-segment
                        (make-vect 0 0.9)
                        (make-vect 0.9 0.9))
                       (make-segment
                        (make-vect 0 0)
                        (make-vect 0.9 0))
                       (make-segment
                        (make-vect 0.9 0)
                        (make-vect 0.9 0.9)))])
    (segments->painter segment-list)))

(define x
  (let ([segment-list (list
                       (make-segment
                        (make-vect 0 0)
                        (make-vect 1 1))
                       (make-segment
                        (make-vect 0 1)
                        (make-vect 1 0)))])
    (segments->painter segment-list)))

(define diamond
  (let ([segment-list (list
                       (make-segment
                        (make-vect 0.5 0)
                        (make-vect 1 0.5))
                       (make-segment
                        (make-vect 0.5 0)
                        (make-vect 0 0.5))
                       (make-segment
                        (make-vect 0.5 1)
                        (make-vect 1 0.5))
                       (make-segment
                        (make-vect 0.5 1)
                        (make-vect 0 0.5)))])
    (segments->painter segment-list)))

(paint outline)
(paint x)
(paint diamond)
