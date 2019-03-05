#lang racket/base

(require rackunit
         rackunit/text-ui
         "20.rkt")

(define same-parity-test
  (test-suite
    "same-parity"
    (test-case
      "it should return list with same parity as first arg"
      (check-equal? (same-parity 1 2 3 4 5 6 7)
                    (list 1 3 5 7))
      (check-equal? (same-parity 2 3 4 5 6 7)
                    (list 2 4 6)))))

(run-tests same-parity-test)
