#lang racket/base

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (cube x)
  (* x x x))

(define (double x)
  (* 2 x))

(define (halve x)
  (/ x 2))

(define runtime current-milliseconds)

(define true #t)
(define false #f)

(define (inc x) (+ x 1))

(define (identity x) x)

(provide (all-defined-out))
