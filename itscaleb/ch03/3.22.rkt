#lang r5rs
;; using r5rs because racket doesn't have 'set-cdr!'
;; not sure how to use the 'error' function is r5rs, so this has
;; no error checking yet.

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (empty-queue?) (null? front-ptr))
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair))
              (else
               (set-cdr! rear-ptr new-pair)
               (set! rear-ptr new-pair)))))
    (define (delete-queue!)
      (set! front-ptr (cdr front-ptr)))
    (define (dispatch message)
      (cond ((eq? message 'insert-queue!) insert-queue!)
            ((eq? message 'delete-queue!) delete-queue!)
            ((eq? message 'front-queue) (car front-ptr))))
    dispatch))

(define (insert-queue! queue item) ((queue 'insert-queue!) item))
(define (delete-queue! queue) ((queue 'delete-queue!)))
(define (empty-queue? queue) ((queue 'empty-queue?)))
(define (front-queue queue) (queue 'front-queue))

(define q (make-queue))
(insert-queue! q 'a)
(insert-queue! q 'b)
(display (front-queue q))
(newline)
(delete-queue! q)
(display (front-queue q))
(newline)
