#lang r5rs

;; informed by the lecture on Bill the Lizard's site

(define (fast-expt b n)

  (define (expt-iter b n a)
    ;; we're done
    (cond ((= n 0) a)
          ;; if even, iterate using the formula from the exercise
          ((= (remainder n 2) 0) (expt-iter (* b b) (/ n 2) a))
          ;; if odd, iterate using the formula from the lecture
          (else (expt-iter b (- n 1) (* a b)))
    )
  )

  (expt-iter b n 1)

)

(display (fast-expt 2 2)) (newline)

(display (fast-expt 2 3)) (newline)

(display (fast-expt 4 5)) (newline)

(display (fast-expt 6 20)) (newline)
