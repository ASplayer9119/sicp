#lang racket/base

(define (make-rat n d)
  (if (< d 0)
      (cons (- n) (- d))
      (cons n d)))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat -1 -2))
(print-rat (make-rat -1 2))
(print-rat (make-rat 1 -2))
(print-rat (make-rat 1 2))
