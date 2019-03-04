#lang racket/base

(require rackunit
         rackunit/text-ui
         "17.rkt")

(define last-pair-test
  (test-suite
    "last-pair"
    (test-case
      "it should return last pair"
      (check-equal? (last-pair (list 23 72 149 34)) (list 34)))))

(run-tests last-pair-test)
