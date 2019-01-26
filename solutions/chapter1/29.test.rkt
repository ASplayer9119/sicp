#lang racket/base

(require rackunit
         rackunit/text-ui
         "29.rkt"
         "helpers.rkt")

(define simpson-test
  (test-suite
    "simpson"
    (test-case
      "it should integrate cube"
      (check-= (simpson cube 0.0 1 100) 0.25 0.01)
      (check-= (simpson cube 0.0 1 1000) 0.25 0.01))))

(run-tests simpson-test)
