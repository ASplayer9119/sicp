#lang racket/base

(require "helpers.rkt"
         "36.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x)
        (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x)
          (matrix-*-vector cols x)) m)))

(provide (all-defined-out))
