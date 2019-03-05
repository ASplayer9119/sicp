#lang racket/base

(define (same-parity x . y)
  (define (same-parity? a b)
    (if (even? a)
        (even? b)
        (odd? b)))
  (define (iter l res)
    (cond ((null? l) (reverse res))
          ((same-parity? x (car l))
           (iter (cdr l) (cons (car l) res)))
          (else (iter (cdr l) res))))
  (iter y (list x)))

(provide same-parity)
