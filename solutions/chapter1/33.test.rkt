#lang racket/base

(require rackunit
         rackunit/text-ui
         "33.rkt")

(define sum-of-prime-squares-test
  (test-suite
    "sum-of-prime-squares"
    (test-case
      "it should calculate sum of squares of prime numbers from interval"
      (check-equal? (sum-of-prime-squares 1 5) 39))))

(define product-of-relatively-prime-test
  (test-suite
    "product-of-relatively-prime"
    (test-case
      "it should calculate product of relatively prime numbers"
      (check-equal? (product-of-relatively-prime 5) 24))))

(run-tests sum-of-prime-squares-test)
(run-tests product-of-relatively-prime-test)
