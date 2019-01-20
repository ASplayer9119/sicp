#lang racket/base

(require rackunit
         rackunit/text-ui
         "19.rkt")

(define fib-tests
  (test-suite
    "fib"
    (test-case
      "it should correctly calculate fib"
      (check-equal? (fib 10) 55))))

(run-tests fib-tests)
