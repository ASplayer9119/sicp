#lang racket/base

(define (compose f g)
  (lambda (x) (f (g x))))

(provide compose)
