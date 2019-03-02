#lang racket/base

(define (average x y)
  (/ (+ x y) 2.0))

(define (make-segment start end)
  (cons start end))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (make-point x y)
  (cons x y))
(define (x-point x) (car x))
(define (y-point x) (cdr x))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment x)
  (let ((x1 (x-point (start-segment x)))
        (x2 (x-point (end-segment x)))
        (y1 (y-point (start-segment x)))
        (y2 (y-point (end-segment x))))
    (make-point (average x2 x1) (average y2 y1))))

(define p1 (make-point 1 2))
(define p2 (make-point 3 4))
(define s (make-segment p1 p2))

(define mid (midpoint-segment s))

(print-point mid)
