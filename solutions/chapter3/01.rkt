#lang racket/base

(define (make-accumulator initial)
  (lambda (val)
    (set! initial (+ initial val))
    initial))

(provide make-accumulator)
