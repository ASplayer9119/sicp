#lang racket/base

(require rackunit
         rackunit/text-ui
         "39.rkt")

(define reverse-test
  (test-suite
    "reverse"
    (test-case
      "fold-right should produce correct reverse"
      (check-equal? (reverse (list 1 2 3)) (list 3 2 1)))
    (test-case
      "fold-left should produce correct reverse"
      (check-equal? (reverse-2 (list 1 2 3)) (list 3 2 1)))))

(run-tests reverse-test)
