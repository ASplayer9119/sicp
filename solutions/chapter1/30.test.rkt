#lang racket/base

(require rackunit
         rackunit/text-ui
         "30.rkt"
         "helpers.rkt")

(define sum-iter-test
  (test-suite
    "sum-iter"
    (test-case
      "it should calculate sum"
      (check-equal? (sum-iter identity 0 inc 5) 15))))

(run-tests sum-iter-test)
