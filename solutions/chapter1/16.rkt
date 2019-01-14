#lang racket/base

(require "helpers.rkt")

(define (fast-expt-iter b n)
  (define (iter a b pow)
    (cond ((= pow 0) a)
          ((even? pow) (iter a (square b) (/ pow 2)))
          (else (iter (* a b) b (- pow 1)))))
  (iter 1 b n))

(provide fast-expt-iter)
