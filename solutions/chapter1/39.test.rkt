#lang racket/base

(require rackunit
         rackunit/text-ui
         "39.rkt")

(define tan-cf-test
  (test-suite
    "tan-cf"
    (test-case
      "it should calculate tan"
      (check-= (tan-cf 10 1000) 0.6483608274 0.0001))))

(run-tests tan-cf-test)
