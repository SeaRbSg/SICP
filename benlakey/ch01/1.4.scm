(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; if the value of b is greater than zero then use the operator '+' on a and b
; otherwise use the operator '-' on a and b

(a-plus-abs-b 2 4)
; 6
(a-plus-abs-b 2 -4)
; 6
