#lang racket/base

(require rackunit
         rackunit/text-ui
         "34.rkt")

(define horner-test
  (test-suite
    "horner-eval"
    (test-case
      "it should correctly calculate polynomial"
      (check-equal? (horner-eval 2 (list 1 3 0 5 0 1))
                    79))))

(run-tests horner-test)
