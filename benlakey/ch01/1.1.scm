; 1.1.1
; (<operator> <operands...>)
(+ 10 20)

(+ 10 20 30 40)

(+ (* 2 5) (* 3 4))


; idiomatic indentation
(+ (* 2 5)
   (* (- 10 5)
      (+ 3 2)))

; 1.1.2
; abstraction
(define x 42)
(define y 10)

(+ x y)


; 1.1.4
; procedure
(define (triple x) (* x 3))

(triple 4)

(define (sum-of-triples x y)
  (+ (triple x) (triple y)))

(sum-of-triples 3 4)


; 1.1.5
; Procedure application
; 
; Applicative order = Operands evaluated immediately, first
; Normal order      = Operators evaluated until primitives are left at the leaf nodes

