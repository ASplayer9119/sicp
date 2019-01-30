#lang racket/base

(define (double-f f)
  (lambda (x) (f (f x))))

(provide double-f)
