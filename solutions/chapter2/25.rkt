#lang racket/base

(define (solution-1 x)
  (car (cdaddr x)))

(define (solution-2 x)
  (caar x))

(define (solution-3 x)
  (cadadr (cadadr (cadadr x))))

(provide (all-defined-out))
