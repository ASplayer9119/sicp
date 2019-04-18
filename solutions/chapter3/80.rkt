#lang sicp

(#%require "helpers.rkt"
           "77.rkt")

(define (RLC R L C dt)
  (define (inner vc0 il0)
    (define il (integral (delay dil) il0 dt))
    (define vc (integral (delay dvc) vc0 dt))
    (define dvc (scale-stream il (/ -1 C)))
    (define dil (add-streams (scale-stream vc (/ 1 L))
                            (scale-stream il (/ (- R) L))))
    (cons vc il))
  inner)
