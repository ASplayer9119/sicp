#lang racket/base

(require rackunit
         rackunit/text-ui
         "19.rkt")

(define cc-test
  (test-suite
    "change-counting"
    (test-case
      "it should correctly calculate number of of ways to change money"
      (check-equal? (cc 100 us-coins) 292))
    (test-case
      "it should produce same result with reverse ordered list of coins"
      (check-equal? (cc 100 (reverse us-coins)) 292))))

(run-tests cc-test)
