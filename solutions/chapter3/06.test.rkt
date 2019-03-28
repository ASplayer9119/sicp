#lang racket/base

(require rackunit
         rackunit/text-ui
         "06.rkt")

(define rand-test
  (test-suite
    "rand"
    (test-case
      "it should reset rand number generator"
      (check-equal? (rand 'generate) 1)
      (check-equal? (rand 'generate) 2)
      (check-equal? (rand 'generate) 3)
      (check-equal? ((rand 'reset) 0) 0)
      (check-equal? (rand 'generate) 1)
      (check-equal? (rand 'generate) 2)
      (check-equal? (rand 'generate) 3))))

(run-tests rand-test)
