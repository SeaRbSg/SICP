#lang racket

(list 'a 'b 'c)
; prints '(a b c)

(list (list 'george))
; prints '((george))

(cdr '((x1 x2) (y1 y2)))
; prints '((y1 y2))

(cadr '((x1 x2) (y1 y2)))
; prints '(y1 y2)

(pair? (car '(a short list)))
; prints #f

(memq 'red '((red shoes) (blue socks)))
; prints #f

(memq 'red '(red shoes blue socks))
; prints '(red shoes blue socks)
