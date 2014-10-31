#lang racket
(require rackunit
         "codetree.rkt")

(define lyric-symbols
  '((BOOM 1) (WAH 1) (GET 2) (A 2) (JOB 2) (SHA 3) (YIP 9) (NA 16)))

(define huffman-tree (generate-huffman-tree lyric-symbols))

(define bytes
  (encode '(GET A JOB
            SHA NA NA NA NA NA NA NA NA
            GET A JOB
            SHA NA NA NA NA NA NA NA NA
            WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
            SHA BOOM)
          huffman-tree))

(length bytes) ; it takes 84 bytes to store the lyrics

; If we were going to use a fxed-length code for this eight-symbol alphabet, we would need log_2(8) = 3 bits per symbol.
; There are 36 symbols, so that would need 3 * 36 = 108 bites to store the message.
