#lang racket/base

(require "helpers.rkt")

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  ((iterative-improve good-enough? improve) x))

(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- (f guess) guess))
       0.00001))
  ((iterative-improve close-enough? f) first-guess))

(provide (all-defined-out))
