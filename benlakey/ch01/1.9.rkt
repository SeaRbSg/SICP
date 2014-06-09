#lang racket

; Originally I had implemented 'inc' and 'dec' to actually run the sample 
; procs in 1.9. Unfortunately in doing so I used the '+' operator which we 
; then promptly overloaded below. This led to infinite recursion :(. I am 
; leaving these here as a reminder of this.

;(define (inc x)
;  (- x 1))

;(define (dec x)
;  (- x 1))

; Variant #1

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

;(+ 4 5) would substitute as follows:

(+ 4 5)
(inc (+ (dec 4) 5))
(inc (+ 3 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

; This is not iterative because we don't carry forward with us a 
; complete picture of the program state. We are relying on the 
; preceding calls in the stack to continue other calculations.
; The shape of the program execution is also a strong suggestion 
; that its recursive; it expands and contracts.


; Variant #2

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; (+ 4 5) would substitute as follows:
(+ 4 5)
(+ (dec 4) (inc 5))
(+ 3 6)
(+ (dec 3) (inc 6))
(+ 2 7)
(+ (dec 2) (inc 7))
(+ 1 8)
(+ (dec 1) (inc 8))
(+ 0 9)
9


; This is iterative because there are no deferred operations to 
; complete. We can pause the computation at any point and resume 
; based on state. The shape is also non expanding which suggests 
; iterative.