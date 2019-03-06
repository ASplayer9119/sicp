#lang racket/base

(define (reverse x)
  (define (iter l res)
    (if (null? l)
        res
        (iter (cdr l) (cons (car l) res))))
  (iter x null))

(define (deep-reverse x)
  (define (iter l res)
    (cond ((null? l) res)
          ((not (pair? l)) l)
          (else (iter (cdr l)
                      (cons (deep-reverse (car l)) res)))))
  (iter x null))

(provide (all-defined-out))
