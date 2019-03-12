#lang racket/base

(require rackunit
         rackunit/text-ui
         "42.rkt")

(define queens-test
  (test-suite
    "queens"
    (test-case
      "there is 92 combinations to place 8 queens on 8x8 board"
      (check-equal? (length (queens 8)) 92))))

(run-tests queens-test)
