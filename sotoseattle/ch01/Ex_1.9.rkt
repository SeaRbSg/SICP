#lang racket
(require rackunit)

(define (factorial_I n)
  (cond
    [(= n 1) 1]
    [(* n (factorial_I (- n 1))) ]))

[check-equal? (factorial_I 6) 720]

(define (factorial_II n)
  (define (factocarry tot m)
    (cond
      [(= n m) (* tot m)]
      [else (factocarry (* tot m) (+ m 1))]))
  (factocarry 1 1))

[check-equal? (factorial_II 6) 720]

; Both factorials are recursive, but the first one is linearly-recursive in its
; execution, while the second is iterative. The first one needs to keep track of
; where it is in the long chain of delayed executions. The second has all the
; info it needs with him in the variables (tot n m) and nothing is delayed.

; Recursive process (factorial I), but both are recursive procedures.

; In most languages a recursive call => recursive process. So to do iterations
; they define special constructs (do while loop).
; In Scheme no, because recursion that is tail recursive becomes iterative!

(define (inc a) (+ a 1))
(define (dec a) (- a 1))

(define (+_I a b)
  (if (= a 0)
    b
    (inc (+_I (dec a) b))))

; (+_I 4 5)
; (inc (+_I 3 5))
; (inc (inc (+_I 2 5)))
; (inc (inc (inc (+_I 1 5))))
; (inc (inc (inc (inc (+_I 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9              <= Recursive

(define (+_II a b)
  (if (= a 0)
    b
    (+_II (dec a) (inc b))))

; (+_II 4 5)
; (+_II 3 6)
; (+_II 2 7)
; (+_II 1 8)
; (+_II 0 9)
; 9              <= Iterative

(time (+_I  400000 50000000))
(time (+_II 400000 50000000))

