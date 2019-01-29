#lang racket/base

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))

(define (cont-frac-rec n d k)
  (define (inner i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (inner (+ i 1))))))
  (inner 1))

(provide (all-defined-out))
