#lang sicp

(#%require "helpers.rkt"
           "55.rkt")

(define (ln2-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (ln2-summands (+ n 1)))))
(define ln2-stream
  (partial-sums (ln2-summands 1)))

(display-stream ln2-stream)
