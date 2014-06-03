#lang racket
(require rackunit)
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(test-case
 "Positive b"
 (check-eq? (a-plus-abs-b 1 4) 5 "pos b added to a"))
(test-case
 "Negative b"
 (check-eq? (a-plus-abs-b 1 -4) 5 "neg b added to a"))

;The predicate (> b 0) determines whether the prefix of + or - is applied to the two
;arguments a and b respectively. If the argument b is less than 0 then b is subtracted from a.
;Since b is negative this cause b to be added to a, and the same will happen if its positive,
;because the prefix of + is returned.