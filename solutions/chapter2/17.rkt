#lang racket/base

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(provide last-pair)
