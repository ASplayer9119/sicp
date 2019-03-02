#lang racket/base

(require rackunit
         rackunit/text-ui
         "04.rkt")

(define cdr-test
  (test-suite
    "cdr-test"
    (test-case
      "it should return cdr of a pair"
      (check-equal? (cdr (cons 1 2)) 2))))

(run-tests cdr-test)
