#lang r5rs

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)
    )
  )

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)
    )
  )

(define (good-enough? guess x) #f)

(define (improve guess x) guess)

(display (sqrt-iter 1.4 2)) (newline)
