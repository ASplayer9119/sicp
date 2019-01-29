#lang racket/base

(require "37.rkt")

(define (e-approx k)
  (define (n i)
    1.0)
  (define (d i)
    (cond ((or (= i 1) (= i 2)) i)
          ((= (remainder i 3) 2) (* 2 (+ (/ (- i 2) 3.0) 1)))
          (else 1)))
  (cont-frac-iter n d k))

(provide e-approx)
