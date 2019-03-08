#lang racket/base

(require rackunit
         rackunit/text-ui
         "32.rkt")

(define subsets-test
  (test-suite
    "subsets"
    (test-case
      "it should return all subsets of given set"
      (check-equal? (subsets (list 1 2 3))
                    (list (list) (list 3) (list 2)
                          (list 2 3) (list 1)
                          (list 1 3) (list 1 2)
                          (list 1 2 3))))))

(run-tests subsets-test)
