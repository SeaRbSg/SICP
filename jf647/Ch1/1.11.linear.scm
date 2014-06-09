#lang r5rs

(define (f n)
  (define (iter count n1 n2 n3)
    (if (< count 3)
        n1
        (iter (- count 1) (+ n1 (* n2 2) (* n3 3))
              n1
              n2))
  )
  (if (< n 3)
      n
      (iter n 2 1 0)
  )
)

(display (f 0)) (newline)
(display (f 1)) (newline)
(display (f 2)) (newline)
(display (f 3)) (newline)
(display (f 4)) (newline)
(display (f 5)) (newline)
(display (f 20)) (newline)
