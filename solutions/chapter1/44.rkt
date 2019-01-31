#lang racket/base

(require "43.rkt"
         "helpers.rkt")

(define dx 0.00001)
(define (avg-3 a b c)
  (/ (+ a b c) 3.0))

(define (smooth f)
  (lambda (x) (avg-3 (f (- x dx))
                     (f x)
                     (f (+ x dx)))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

((n-fold-smooth square 2) 2)
