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
  (define (dispatch secret-password m)
    (if (not (eq? secret-password password))
        (error "Incorrect password")
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m)))))
  dispatch)

(define account (make-account 100 'password))
(check-equal? ((account 'password 'withdraw) 50) 50)
(check-equal? ((account 'password 'deposit) 30) 80)
