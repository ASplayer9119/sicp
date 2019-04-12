#lang sicp

(#%require rackunit
           rackunit/text-ui
           "54.rkt"
           "helpers.rkt")

(define factorials-test
  (test-suite
    "factorials"
    (test-case
      "it should return n+1 factorial"
      (check-equal? (stream-ref factorials 5) 720))))

(run-tests factorials-test)
