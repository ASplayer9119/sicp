#lang racket/base

(require rackunit
         rackunit/text-ui
         "59.rkt")

(define union-set-test
  (test-suite
    "union-set"
    (test-case
      "it should return union of two sets"
      (check-equal? (union-set (list 1 2 3) (list 4 3 5))
                    (list 2 1 4 3 5)))))

(run-tests union-set-test)
