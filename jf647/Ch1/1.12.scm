#lang r5rs

(define (pascal-triangle-elem row column)
  (cond
  ;;; row n has n columns, so if row < column, return 0
    ((< row column) 0)
  ;;; the leftmost and rightmost columns are value 1
    ((or (= 0 column) (= row column)) 1)
  ;;; otherwise add the row above, this column and the one before it
    (else (+ (pascal-triangle-elem (- row 1) (- column 1)) (pascal-triangle-elem (- row 1) column)))
  )
)

(display (pascal-triangle-elem 3 1)) (newline)
(display (pascal-triangle-elem 4 2)) (newline)

