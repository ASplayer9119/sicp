#lang sicp

(#%require "helpers.rkt")

(define (sign-change-detector current last)
  (cond ((and (< current 0) (>= last 0)) -1)
        ((and (>= current 0) (< last 0)) 1)
        (else 0)))

(define (make-zero-crossings input-stream last-value avg)
  (let ((avpt (/ (+ (stream-car input-stream)
                    last-value)
                 2)))
    (cons-stream
      (sign-change-detector avpt avg)
      (make-zero-crossings
        (stream-cdr input-stream) (stream-car input-stream) avpt))))
