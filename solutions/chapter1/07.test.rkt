#lang racket/base

(require rackunit
         rackunit/text-ui
         "07.rkt")

(define sqrt-test
  (test-suite
    "sqrt"
    (test-case
      "when take large number"
      (check-= (sqrt 10000000000000) 3162277.66017 0.01))

    (test-case
      "when take small number"
      (check-= (sqrt 0.000001) 0.001 0.01))))

(run-tests sqrt-test)
