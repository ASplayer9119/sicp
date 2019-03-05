#lang racket/base

(require rackunit
         rackunit/text-ui
         "21.rkt")

(define square-list-test
  (test-suite
    "square-list"
    (test-case
      "1. should produce correct result"
      (check-equal? (square-list-1 (list 1 2 3 4))
                    (list 1 4 9 16)))
    (test-case
      "2. should produce correct result"
      (check-equal? (square-list-2 (list 1 2 3 4))
                    (list 1 4 9 16)))))

(run-tests square-list-test)
