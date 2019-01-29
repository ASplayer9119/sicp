#lang racket/base

(require rackunit
         rackunit/text-ui
         "38.rkt")

(define e-approx-test
  (test-suite
    "e-approx"
    (test-case
      "it should calculate e - 2"
      (check-= (e-approx 1000) 0.71828182845 0.0001))))

(run-tests e-approx-test)
