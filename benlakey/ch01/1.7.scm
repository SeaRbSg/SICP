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

; The 'good-enough?' method above is inadequate for very small or very large numbers because the differences in the values used in the checking are already smaller than the precision guide (0.001)
; 
; Example of a small number failing:
(sqrt 0.0008)
; produces ~ 0.00154
; actual   ~ 0.02828

; A better alternative that uses iteration diff checking. When the difference in guesses is smaller than a value then stop.

(define (good-enough? guess last-guess x)
  (< (abs (- guess last-guess)) 0.001))

(define (sqrt-iter guess last-guess x)
  (if (good-enough? guess last-guess x)
    guess
    (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
  (sqrt-iter 1.0 0 x))

(sqrt 0.0008)
; produces   ~ 0.02828
