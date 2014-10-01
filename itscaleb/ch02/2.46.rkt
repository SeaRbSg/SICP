#lang racket
(require rackunit)

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v)) 

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

(check-equal? (xcor-vect (make-vect 1 2))
              1)
(check-equal? (ycor-vect (make-vect 1 2))
              2)
(check-equal? (scale-vect 2 (make-vect 3 4))
              (make-vect 6 8))

(check-equal? (add-vect (make-vect 1 2)
                        (make-vect 3 4))
              (make-vect 4 6))
(check-equal? (sub-vect (make-vect 4 6)
                        (make-vect 2 4))
              (make-vect 2 2))
