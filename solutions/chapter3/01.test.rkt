#lang racket/base

(require rackunit
         rackunit/text-ui
         "01.rkt")

(define A (make-accumulator 5))

(define accumulator-test
  (test-suite
    "make-accumulator"
    (test-case
      "it sums up passing values with initial one"
      (check-equal? (A 10) 15)
      (check-equal? (A 10) 25))))

(run-tests accumulator-test)
