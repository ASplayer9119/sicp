#lang sicp

(#%require "helpers.rkt")

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)

(define (RC R C dt)
  (define (inner stream initial-value)
    (add-streams
      (scale-stream stream R)
      (integral (scale-stream stream (/ 1 C))
                initial-value
                dt)))
  inner)
