10

12

8

3

6

a

b

(+ a b (* a b))
(+ 3 4 (* 3 4))
(+ 3 4 12)
19

#f

(if (and (> b a) (< b (* a b)))
    b
    a)
(if (and (> 4 3) (< 4 (* 3 4)))
    4
    3)
(if (and #t (< 4 12))
    4
    3)
(if (and #t #t)
    4
    3)
(if #t 4 3)
4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(cond ((= 3 4) 6)
      ((= 4 4) (+ 6 7 3))
      (else 25))
(cond (#f 6)
      (#t 16)
      (else 25))
16

(+ 2 (if (> b a) b a))
(+ 2 (if (> 4 3) 4 3))
(+ 2 (if #t 4 3))
(+ 2 4)
6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
(* (cond ((> 3 4) 3)
         ((< 3 4) 4)
         (else -1))
   (+ 3 1))
(* (cond (#f 3)
         (#t 4)
         (else -1))
   (+ 3 1))
(* 4 (+ 3 1))
(* 4 4)
16
