#lang racket/base

(require rackunit
         rackunit/text-ui
         "05.rkt")

(define pi-approx-test
  (test-suite
    "pi-approx"
    (test-case
      "it should calculate pi"
      (check-= (pi-approx) 3.14 0.01))))

(run-tests pi-approx-test)
