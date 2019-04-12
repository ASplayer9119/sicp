#lang sicp

(#%require rackunit
           rackunit/text-ui
           "55.rkt"
           "helpers.rkt")

(define partial-sums-test
  (test-suite
    "partial-sums"
    (test-case
      "it should return partial sums of stream elements"
      (check-equal? (stream-ref (partial-sums integers) 4)
                    15))))

(run-tests partial-sums-test)
