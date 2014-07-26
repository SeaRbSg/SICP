#lang racket
(require rackunit)

(define (make-rat n d)
  (let ((g (abs (gcd n d)))
        (num (abs n))
        (denom (abs d)))
    (cons (* (sign n d) (/ num g)) (/ denom g))))
       
(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))
       
(define (sign num denom)
  (cond ((and (< num 0) (< denom 0))
         1)
        ((or (< num 0) (< denom 0))
         -1)
        (else 1)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(check-equal? (numer (make-rat -4 6)) -2)
(check-equal? (denom (make-rat -4 6)) 3)

(check-equal? (numer (make-rat 4 -6)) -2)
(check-equal? (denom (make-rat 4 -6)) 3)

(check-equal? (numer (make-rat -4 -6)) 2)
(check-equal? (denom (make-rat -4 -6)) 3)

(check-equal? (numer (make-rat 4 6)) 2)
(check-equal? (denom (make-rat 4 6)) 3)