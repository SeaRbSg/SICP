#lang racket
(require rackunit)

(define (make-monitored f)
  (let ([count 0])
    (lambda (arg)
      (cond [(eq? arg 'how-many-calls?)
             count]
            [(eq? arg 'reset-count)
             (set! count 0)]
            [else
             (set! count (+ 1 count))
             (f arg)]))))

(define s (make-monitored sqrt))

(check-equal? (s 100) 10)
(check-equal? (s 'how-many-calls?) 1)
(check-equal? (s 25) 5)
(check-equal? (s 'how-many-calls?) 2)
(s 'reset-count)
(check-equal? (s 'how-many-calls?) 0)
