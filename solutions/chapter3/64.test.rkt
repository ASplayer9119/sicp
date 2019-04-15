#lang sicp

(#%require rackunit
           rackunit/text-ui
           "64.rkt")

(define sqrt-test
  (test-suite
    "sqrt"
    (test-case
      "it should calculate sqrt with given precision"
      (check-= (sqrt 49 0.001) 7 0.001))))

(run-tests sqrt-test)
