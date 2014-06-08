(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess last-guess x)
  (< (abs (- guess last-guess)) 0.0001))

(define (cube-root-iter guess last-guess x)
  (if (good-enough? guess last-guess x)
    guess
    (cube-root-iter (improve guess x) guess x)))

(define (cube-root x)
  (cube-root-iter 1.0 0 x))

(cube-root 8)
