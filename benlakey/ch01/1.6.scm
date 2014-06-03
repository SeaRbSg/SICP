; if reimplemented via cond

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; new-if works
(new-if (= 2 2) 0 5)

; but new-if will evaluate operands immediately regardless of short-circuit logic of the special form because scheme uses applicative-order evaluation instead of normal form

; for example, the numeric values here will be evaluated and simplified before the new-if logic operates:
(new-if (= 2 2) (+ 42 10) (* 3 9))

; if the square root example in 1.1.7 were rewritten using 'new-if' there would be an infinite loop of recursion evaluation because it doesnt matter whether 'guess' is good enough; we still evaluate all operands.
