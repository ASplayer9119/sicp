#lang sicp

(#%require "helpers.rkt")

(define (sign-change-detector current last)
  (cond ((and (< current 0) (>= last 0)) -1)
        ((and (>= current 0) (< last 0)) 1)
        (else 0)))

(define (zero-crossings sense-data)
  (stream-map-2 sign-change-detector
                sense-data
                (stream-cdr sense-data)))
