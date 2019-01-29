#lang racket/base

(require "37.rkt"
         "helpers.rkt")

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- (square x))))
  (define (d i)
    (- (* 2.0 i) 1))
  (cont-frac-iter n d k))

(provide tan-cf)
