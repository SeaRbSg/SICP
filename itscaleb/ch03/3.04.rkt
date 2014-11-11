#lang racket
(require rackunit)

(define (make-account password balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  (password-protect password dispatch))

(define (password-protect user-password f)
  (define invalid-attempts 0)
  (lambda (password m)
    (cond [(= invalid-attempts 7)
           (call-the-cops)]
          [(eq? password user-password)
           (set! invalid-attempts 0)
           (f m)]
          [else
           (set! invalid-attempts (+ 1 invalid-attempts))
           (error "Incorrect password")])))

(define (call-the-cops)
  (error "The cops have been called!"))

; It works as expected with a correct password
(define acc (make-account 'password 100))
(check-equal? ((acc 'password 'withdraw) 30) 70)
(check-equal? ((acc 'password 'deposit) 5) 75)

; Enter an invalid password 7 times...
(check-exn exn:fail? (lambda ()
                       ((acc 'invalid-password 'deposit) 5)))
(check-exn exn:fail? (lambda ()
                       ((acc 'invalid-password 'deposit) 5)))
(check-exn exn:fail? (lambda ()
                       ((acc 'invalid-password 'deposit) 5)))
(check-exn exn:fail? (lambda ()
                       ((acc 'invalid-password 'deposit) 5)))
(check-exn exn:fail? (lambda ()
                       ((acc 'invalid-password 'deposit) 5)))
(check-exn exn:fail? (lambda ()
                       ((acc 'invalid-password 'deposit) 5)))
(check-exn exn:fail? (lambda ()
                       ((acc 'invalid-password 'deposit) 5)))

; this will cause an error and "The cops have been called!" to be
; printed. I can't figure out how to test the message.
((acc 'invalid-password 'deposit) 10)
