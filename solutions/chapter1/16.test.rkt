#lang racket/base

(require rackunit
         rackunit/text-ui
         "16.rkt")

(define fast-expt-iter-test
  (test-suite
    "fast-expt-iter-test"
    (test-case
      "it should return 1 if power is 0"
      (check-equal? (fast-expt-iter 5 0) 1))
    (test-case
      "it should return 32 if for 2^5"
      (check-equal? (fast-expt-iter 2 5) 32))))

(run-tests fast-expt-iter-test)
