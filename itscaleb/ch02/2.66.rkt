#lang racket
; Note: I got lazy and did not implement all the supporting procedures or test this.
; But I think the algorithm is correct...

(define (lookup given-key set-of-records)
  (cond [(null? set-of-records) #f]
        [(< given-key (key (entry set-of-records)))
         (lookup given-key (left-tree set-of-records))]
        [(> given-key (key (entry set-of-records)))
         (lookup given-key (right-tree set-of-records))]
        [else
         (entry set-of-records)]))
