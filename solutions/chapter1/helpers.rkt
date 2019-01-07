#lang racket/base

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (cube x)
  (* x x x))

(provide (all-defined-out))
