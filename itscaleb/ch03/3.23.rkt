#lang r5rs

(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))
(define (make-deque) (cons '() '()))
(define (front-deque deque) (car (front-ptr deque)))
(define (rear-deque deque) (car (rear-ptr deque)))
(define (empty-deque? deque) (null? (front-ptr deque)))
(define (set-front-ptr! deque item) (set-car! deque item))
(define (set-rear-ptr! deque item) (set-cdr! deque item))

(define (front-insert-deque! deque item)
  (let ((new-pair (cons item (front-ptr deque))))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-pair)
           (set-rear-ptr! deque new-pair)
           deque)
          (else
           (set-cdr! new-pair front-ptr)
           (set-front-ptr! deque new-pair)
           deque))))

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons item '())))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-pair)
           (set-rear-ptr! deque new-pair)
           deque)
          (else
           (set-cdr! (rear-ptr deque) new-pair)
           (set-rear-ptr! deque new-pair)
           deque))))
