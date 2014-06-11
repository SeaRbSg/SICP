#lang racket

(define (calc-pascal row column)
   (cond ((< row column) #f)
         ((or (= 0 column) (= row column)) 1)
         (else (+ (calc-pascal (- row 1) column)
                  (calc-pascal (- row 1) (- column 1))))))

(calc-pascal 1 1)
(calc-pascal 15 1)

