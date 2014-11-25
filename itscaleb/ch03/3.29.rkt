#lang racket

; The delay time wil be (2 * inverter-delay) + and-delay

(define (or-gate a1 a2 output)
  (let ((out1 (make-wire))
        (out2 (make-wire))
        (out3 (make-wire)))
    (inverter a1 out1)
    (inverter a2 out2)
    (and-gate out1 out2 out3)
    (inverter out3 output)))
