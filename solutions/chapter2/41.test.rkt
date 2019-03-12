#lang racket/base

(require rackunit
         rackunit/text-ui
         "41.rkt")

(define triples-test
  (test-suite
    "triples-test"
    (test-case
      "it should return ordered triples that sums to given number"
      (check-equal? (triples-sum 10 8)
                    (list (list 1 3 4) (list 1 2 5))))))

(run-tests triples-test)
