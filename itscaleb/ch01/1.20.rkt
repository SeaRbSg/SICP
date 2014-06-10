; Normal order
(gcd 206 40)
(gcd 40 (remainder 206 40))
(if (= remainder 206 40)) ; +1
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= remainder 40 (remainder 206 40))) ; +2
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) ; +4
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))) ; +7
(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; +4

; 18 total evaluations of remainder for normal order evaluation.

; Applicative order
(gcd 206 40)
(gcd 40 6) ; +1
(gcd 6 4) ; +1
(gcd 4 2) ; +1
(gcd 2 0) ; +1

; 4 total evaluations of remainder for applicative order evaluation
