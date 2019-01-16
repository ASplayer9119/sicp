#lang racket/base

(require "helpers.rkt")

(define (mul-fast a b)
  (cond ((= b 0) 0)
        ((even? b) (double (mul-fast a (halve b))))
        (else (+ a (mul-fast a (- b 1))))))

(provide mul-fast)
