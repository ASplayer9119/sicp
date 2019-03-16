#lang racket/base

(require rackunit
         rackunit/text-ui
         "62.rkt")

(define union-set-test
  (test-suite
    "union-set"
    (test-case
      "it should return ordered set with elements that presented in both given sets"
      (check-equal? (union-set (list 1 2 3 4) (list 2 5 6))
                    (list 1 2 3 4 5 6)))))

(run-tests union-set-test)
