#lang racket
(car ''abracadabra)

; The interpreter prints "quote" because the quotation mark is an abbreviation 
; for wrapping the next expression with quote, to form (quote <expression>).
; The car of '(quote <expression>) is quote.
