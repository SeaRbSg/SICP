(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;;; Applicative
;
; Lookup proc
(if (= x 0) 0 y)
; Apply arguments
(if (= 0 0) 0 (p))
; Eval operands
; Results in an infinite loop of repeatedly attempting to eval (p)

;;; Normal
; 
; In normal-order 0 would be returned because the (p) exp would not be evaluated in the first step, and would not be evaluated later due to the 'if' short-circuiting
