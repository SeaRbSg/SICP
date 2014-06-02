(define (square x)
  (* x x))

(define (sum-squares a b)
  (+ (square a) (square b)))

(define (sum-largest-two-squares a b c)
  (cond ((and (< a b) (< a c)) (sum-squares b c))
        ((and (< b a) (< b c)) (sum-squares a c))
        (else (sum-squares a b))))

(sum-largest-two-squares 2 3 4)
; 25
