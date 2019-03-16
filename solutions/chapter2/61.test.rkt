#lang racket/base

(require rackunit
         rackunit/text-ui
         "61.rkt")

(define adjoin-set-test
  (test-suite
    "adjoin-set"
    (test-case
      "it should add element to ordered set"
      (check-equal? (adjoin-set 4 (list 1 2 5 6))
                    (list 1 2 4 5 6)))))

(run-tests adjoin-set-test)
