#lang sicp

(#%require "helpers.rkt")

(define (randomm-in-range low high)
  (let ((range (- high low)))
    (+ low (* (random) range))))

(define (square x) (* x x))
(define (area-rect x1 y1 x2 y2)
  (define (length-side x1 x2 y1 y2)
    (sqrt (+ (square (abs (- x2 x1)))
	           (square (abs (- y2 y1))))))
  (* (length-side x1 x1 y1 y2)
     (length-side x1 x2 y1 y1)))

(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream
      (/ passed (+ passed failed))
      (monte-carlo
        (stream-cdr experiment-stream) passed failed)))
  (if (stream-car experiment-stream)
      (next (+ passed 1) failed)
      (next passed (+ failed 1))))

(define (estimate-integral p x1 x2 y1 y2)
  (define (experiment-stream)
    (let ((x (randomm-in-range x1 x2))
          (y (randomm-in-range y1 y2)))
      (cons-stream
        (p x y)
        (experiment-stream))))
  (scale-stream (monte-carlo (experiment-stream) 0 0)
                (area-rect x1 y1 x2 y2)))
