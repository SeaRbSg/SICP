#lang racket
(require rackunit)
(require "2.46.rkt")

(define (make-frame-1 origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame-1 frame)
  (car frame))

(define (edge1-frame-1 frame)
  (car (cdr frame)))

(define (edge2-frame-1 frame)
  (car (cdr (cdr frame))))

(define (make-frame-2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-2 frame)
  (car frame))

(define (edge1-frame-2 frame)
  (car (cdr frame)))

(define (edge2-frame-2 frame)
  (cdr (cdr frame)))

(let* ([origin (make-vect 1 2)]
       [edge1 (make-vect 3 4)]
       [edge2 (make-vect 5 6)]
       [frame (make-frame-1 origin edge1 edge2)])
  (check-equal? (origin-frame-1 frame)
                origin)
  (check-equal? (edge1-frame-1 frame)
                edge1)
  (check-equal? (edge2-frame-1 frame)
                edge2))

(let* ([origin (make-vect 1 2)]
       [edge1 (make-vect 3 4)]
       [edge2 (make-vect 5 6)]
       [frame (make-frame-2 origin edge1 edge2)])
  (check-equal? (origin-frame-2 frame)
                origin)
  (check-equal? (edge1-frame-2 frame)
                edge1)
  (check-equal? (edge2-frame-2 frame)
                edge2))
