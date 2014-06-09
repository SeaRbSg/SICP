#lang racket

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

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
(inc (inc (inc (+ 5 1))))
(inc (inc (inc (inc (+ (dec 5) 1)))))
(inc (inc (inc (inc (+ 4 1)))))
(inc (inc (inc (inc (inc (+ (dec 4) 1))))))
(inc (inc (inc (inc (inc (+ 3 1))))))
(inc (inc (inc (inc (inc (inc (+ (dec 3) 1)))))))
(inc (inc (inc (inc (inc (inc (+ 2 1)))))))
(inc (inc (inc (inc (inc (inc (inc (+ (dec 2) 1))))))))
(inc (inc (inc (inc (inc (inc (inc (+ 1 1))))))))
(inc (inc (inc (inc (inc (inc (inc (inc (+ (dec 1) 1)))))))))
(inc (inc (inc (inc (inc (inc (inc (inc (+ 0 1)))))))))
(inc (inc (inc (inc (inc (inc (inc (inc 1))))))))
(inc (inc (inc (inc (inc (inc (inc (+ 1 1))))))))
(inc (inc (inc (inc (inc (inc (inc (inc (+ (dec 1) 1)))))))))
; Seeing an infinite loop here ... (and verified with the REPL)

; This is not iterative because we don't carry forward with us a 
; complete picture of the program state. We are relying on the 
; preceding calls in the stack to continue other calculations.


; Variant #2

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; (+ 4 5) would substitute as follows:
; a=4, b=5

(+ 4 5)
(+ (dec 4) (inc 5))
(+ 3 (+ 5 1))
(+ 3 (+ (dec 5) (inc 1)))
(+ 3 (+ 4 (+ 1 1)))
(+ 3 (+ 4 (+ (dec 1) (inc 1))))
(+ 3 (+ 4 (+ 0 (+ 1 1))))
(+ 3 (+ 4 (+ (dec 1) (inc 1))))
(+ 3 (+ 4 (+ 0 (+ 1 1))))
; Again an infinite loop here (verified with REPL)

; This one seems recursive as well since there are actual deferred operations here.

; NOW, had we not redefined (+ a b) and used a different proc name instead, neither of 
; these would result in an infinite loop, and the 2nd one would be iterative since 
; there would be no deferred operations.