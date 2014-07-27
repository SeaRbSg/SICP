#lang racket
(require rackunit)

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment segment)
  (let ((point1 (start-segment segment))
        (point2 (end-segment segment)))
    (make-point (/ (+ (x-point point1)
                      (x-point point2))
                   2)
                (/ (+ (y-point point1)
                      (y-point point2))
                   2))))

(let ((point1 (make-point 0 0))
      (point2 (make-point 4 4)))
  (define segment (make-segment point1 point2))
  (check-equal? (make-point 2 2)
                (midpoint-segment segment)))

(let ((point1 (make-point -2 -2))
      (point2 (make-point 2 2)))
  (define segment (make-segment point1 point2))
  (check-equal? (make-point 0 0)
                (midpoint-segment segment)))