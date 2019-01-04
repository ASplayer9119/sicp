#lang racket/base

(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(provide (all-defined-out))
