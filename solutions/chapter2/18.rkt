#lang racket/base

(define (reverse x)
  (define (iter l res)
    (if (null? l)
        res
        (iter (cdr l) (cons (car l) res))))
  (iter x null))

(provide reverse)
