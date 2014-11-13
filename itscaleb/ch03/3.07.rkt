#lang racket
(require rackunit)

(define (make-account balance password)
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
  (lambda (password m)
    (cond [(eq? password user-password)
           (f m)]
          [else
           (error "Incorrect password")])))

(define (make-joint account original-pass pass)
  (define (dispatch m)
    (account original-pass m))
  (password-protect pass dispatch))

(define peter-acc (make-account 100 'peter-pass))
(define paul-acc (make-joint peter-acc 'peter-pass 'paul-pass))

(check-equal? ((peter-acc 'peter-pass 'withdraw) 50) 50)
(check-equal? ((paul-acc 'paul-pass 'deposit ) 10) 60)


