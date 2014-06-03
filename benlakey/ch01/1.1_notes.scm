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
; Applicative order = Operands evaluated immediately, first. Reduce primitives first, then proceed.
; Normal order      = Operators evaluated until primitives are left at the leaf nodes. Reduce last.
; 
; Both orders yield the same results. LISP uses applicative order evaluation for efficiency reasons (expressions dont have to be evaluated multiple times).


;;; Applicative:
;
; (sum-of-triples (* 2 3) (* 2 4))
; 
; (sum-of-triples 6 8)
; 
; (+ (triple 6) (triple 8))
; 
; (+ (* 3 6) (* 3 8))
; 
; (+ 18 24)
; 
; 42

;;; Normal:
;
; (sum-of-triples (* 2 3) (* 2 4))
;
; (+ (triple (* 2 3)) (triple (* 2 4)))
;
; (+ (* 3 (* 2 3)) (* 3 (* 2 4))
;
; (+ (* 3 6) (* 3 8))
;
; (+ 18 24)
;
; 42


; 1.1.6
; conditional expressions / predicates

(define (is-bens-age x)
  (cond ((= x 29) #t)
        ((< x 29) #f)
        ((> x 29) #f)))

(is-bens-age 29)

; else

(define (is-bens-age x)
  (cond ((= x 29) #t)
        (else #f)))

(is-bens-age 42)

; In other words 'else' is essentially just a predicate that returns true. Any true expression can be substituted for else. Therefor this is identical to the previous:

(define (is-bens-age x)
  (cond ((= x 29) #t)
        (#t #f)))

(is-bens-age 33)

; if
(define (is-bens-age x)
  (if (= x 29)
    #t
    #f))

(is-bens-age 29)

; logical operators

; Operates as typically seen in other languages, including evaluation rules (any false, short circuit). Thus this is a special form.
(and (= 2 2) (= 1 3))

; Same here; same as typical in other langs, including eval rules. (any true, short circuit). Special form.
(or (= 2 2) (= 1 3))

; negation is not a special form; always evaluated.
(not (= 2 3))  ;true


; Square root example

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
