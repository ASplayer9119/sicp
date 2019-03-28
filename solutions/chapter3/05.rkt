#lang racket/base

(define (square x)
  (* x x))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else (iter (- trials-remaining 1)
                      trials-passed))))
  (iter trials 0))

(define (estimate-intergral p x1 x2 y1 y2 trials)
  (define (experiment)
    (let ((x (randomm-in-range x1 x2))
          (y (randomm-in-range y1 y2)))
      (p x y)))
  (* (monte-carlo trials experiment)
     (area-rect x1 y1 x2 y2)))

(define (randomm-in-range low high)
  (let ((range (- high low)))
    (+ low (* (random) range))))

(define (area-rect x1 y1 x2 y2)
  (define (length-side x1 x2 y1 y2)
    (sqrt (+ (square (abs (- x2 x1)))
	           (square (abs (- y2 y1))))))
  (* (length-side x1 x1 y1 y2)
     (length-side x1 x2 y1 y1)))

(define (pi-approx) (/ (estimate-intergral
                      (lambda (x y) (<= (+ (square (- x 5))
                                           (square (- y 7)))
                                        9))
                      2 8 4 10 1000000)
                      9.0))

(provide pi-approx)
