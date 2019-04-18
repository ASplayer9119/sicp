#lang sicp

(#%require "helpers.rkt")

(define (sign-change-detector current last)
  (cond ((and (< current 0) (>= last 0)) -1)
        ((and (>= current 0) (< last 0)) 1)
        (else 0)))

(define (smooth stream)
  (let ((s1 (stream-car stream))
        (s2 (stream-car (stream-cdr stream))))
    (cons-stream
      (/ (+ s1 s2) 2)
      (smooth (stream-cdr stream)))))

(define (make-zero-crossings input-stream)
  (stream-map-2 sign-change-detector
                (smooth input-stream)
                (smooth (stream-cdr input-stream))))
