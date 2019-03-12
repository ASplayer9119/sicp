#lang racket/base

(require rackunit
         rackunit/text-ui
         "40.rkt")

(define prime-sum-pairs-test
  (test-suite
    "prime-sum-pairs"
    (test-case
      "modified version should produce same result"
      (check-equal? (prime-sum-pairs 10)
                    (prime-sum-pairs-mod 10)))))

(run-tests prime-sum-pairs-test)
