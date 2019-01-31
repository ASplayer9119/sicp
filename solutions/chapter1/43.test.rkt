#lang racket/base

(require rackunit
         rackunit/text-ui
         "43.rkt"
         "helpers.rkt")

(define repeated-test
  (test-suite
    "repeated"
    (test-case
      "it should repeat n times"
      (check-equal? ((repeated square 2) 5) 625))))

(run-tests repeated-test)
