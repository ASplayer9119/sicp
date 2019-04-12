#lang sicp

(#%require "helpers.rkt")

(define (partial-sums stream)
  (cons-stream (stream-car stream)
               (add-streams
                (stream-cdr stream)
                (partial-sums stream))))

(#%provide partial-sums)
