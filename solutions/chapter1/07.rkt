#lang racket/base

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      (improve guess x)
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess next-guess)
  (< (/ (abs (- next-guess guess)) guess) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(provide (all-defined-out))
