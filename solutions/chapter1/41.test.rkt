#lang racket/base

(require rackunit
         rackunit/text-ui
         "41.rkt"
         "helpers.rkt")

(define double-f-test-inc
  (test-suite
    "double-f inc"
    (test-case
      "it should increment twice"
      (check-equal? ((double-f inc) 1) 3))))

(define double-f-test
  (test-suite
    "double-f"
    (test-case
      "it should take itself"
      (check-equal? (((double-f (double-f double-f)) inc) 5) 21))))

(run-tests double-f-test-inc)
(run-tests double-f-test)
