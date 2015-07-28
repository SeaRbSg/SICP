#lang racket
(require rackunit)

; How many different ways can we make change of $ 1.00, given half-dollars,
; quarters, dimes, nickels, and pennies?

; this is my version (which took me some time) because I wanted to see if I
; was able to figure out the code.

(define (change Q coins)
  (cond
    [(null? coins) 0]
    [(+ (let ((rem (- Q (car coins))))
          (cond
            [(= rem 0) 1]
            [(< rem 0) 0]
            [(> rem 0) (change rem coins)]))
        (change Q (cdr coins)))]))

[check-equal? (change 100 '(50 25 10 5 1)) 292]

[check-equal? (change 11 '(50 25 10 5 1)) 4]

;                           11
;                           |
;              _____________|____________________________________
;             /      /      |        \                            \
;           50      25      10        5                            1
;            X       X      |         |                            |
;                        (rem 1)   (rem 6)                      (rem 10)
;                    _______/         |                            |
;                   /           ______|__________               ...1
;              _____|________  50 ..... 5       1               ...1
;             /  /  |   \    \          |       |               ...1
;           50  25  10   5    1      (rem 1)  __|__             ...1
;            X   X   X   X   [1]        |     |    1            ...1
;                                    ...1  ...5    1            ...1
;                                      [1]<--[=]   1            ...1
;                                                  1            ...1
;                                                  1            ...1
;                                                 [1]           ...1
;                                                                 [1]

