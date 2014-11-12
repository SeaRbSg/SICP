#lang racket

(define (estimate-integral p x1 x2 y1 y2 trials)
  (let ((rect-area (* (- x2 x1) (- y2 y1)))
        (experiment (area-experiment p x1 x2 y1 y2)))
   (* rect-area (monte-carlo trials experiment))))

(define (area-experiment p x1 x2 y1 y2)
  (lambda ()
    (let ((x (random-in-range x1 x2))
          (y (random-in-range y1 y2)))
      (point-in-circle? x y))))

(define (random-in-range low high)
            (let ((range (- high low)))
              (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (point-in-circle? x y)
  (<= (+ (expt (- x 5) 2)
        (expt (- y 7) 2))
     (expt 3 2)))

(define pi-estimate (/ (estimate-integral P 2 8 4 10 10000) 9))

; only doing this to avoid printing out a rational number
(/ pi-estimate 1.0)
