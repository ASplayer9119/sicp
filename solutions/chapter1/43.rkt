#lang racket/base

(require "42.rkt")

(define (repeated f times)
  (if (= times 1)
      f
      (compose f (repeated f (- times 1)))))

(provide repeated)
