#lang racket
; this won't work because we don't have 'after-delay' or a wire implementation yet

(define (or-gate a1 a2 output)
  (define (or-action-proc)
    (let ((new-value 
           (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 or-action-proc)
  (add-action! a2 or-action-proc)
  'ok)
