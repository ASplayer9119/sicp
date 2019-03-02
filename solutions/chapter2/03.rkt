#lang racket/base

(define (square x) (* x x))

(define (make-point x y) (cons x y))
(define (x-point x) (car x))
(define (y-point x) (cdr x))

(define (make-segment start end)
  (cons start end))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (length-segment x)
  (let ((x1 (x-point (start-segment x)))
        (x2 (x-point (end-segment x)))
        (y1 (y-point (start-segment x)))
        (y2 (y-point (end-segment x))))
    (sqrt (+ (square (- x2 x1))
             (square (- y2 y1))))))

(define (make-rect a b)
  (cons a b))
(define (rect-a x) (car x))
(define (rect-b x) (cdr x))

; (define (make-rect a1 a2)
;   (cons a1 a2))
; (define (rect-a x) (car x))
; (define (rect-b x)
;   (let ((start (car (car x)))
;         (end (car (cdr x))))
;     (make-segment start end)))

(define (area rect)
  (let ((a (length-segment (rect-a rect)))
        (b (length-segment (rect-b rect))))
    (* a b)))
(define (perimeter rect)
  (let ((a (length-segment (rect-a rect)))
        (b (length-segment (rect-b rect))))
    (* (+ a b) 2)))

(provide (all-defined-out))
