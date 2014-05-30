(define (sum-of-squares-two-largest x y z)
  (define min_num (min x y z))
  (cond ((= x min_num) (sum-of-squares y z))
	((= y min_num) (sum-of-squares x z))
	(else (sum-of-squares x y))))

(define (sum-of-squares x y)
  (+ (square x)
     (square y)))

(define (square x)
  (* x x))
