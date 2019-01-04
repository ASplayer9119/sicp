#lang racket/base

(require "helpers.rkt")

(define (sum-squares-of-two-largest a b c)
  (cond ((and (>= a b) (>= b c)) (sum-of-squares a b))
        ((and (>= a b) (>= c b)) (sum-of-squares a c))
        ((and (>= b a) (>= a c)) (sum-of-squares a b))
        ((and (>= b a) (>= c a)) (sum-of-squares b c))))

(provide sum-squares-of-two-largest)
