#lang racket/base

(require rackunit
         rackunit/text-ui
         "42.rkt"
         "helpers.rkt")

(define compose-test
  (test-suite
    "compose"
    (test-case
      "it should compose functions"
      (check-equal? ((compose square inc) 6) 49))))

(run-tests compose-test)
