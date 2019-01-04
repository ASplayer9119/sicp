#lang racket/base

(require rackunit
         rackunit/text-ui
         "03.rkt")

(define sum-squares-of-two-largest-test
  (test-suite
    "sum-squares-of-two-largest"
    (test-case
      "when all numbers different"
      (check-equal? (sum-squares-of-two-largest 1 2 3) 13)
      (check-equal? (sum-squares-of-two-largest 1 3 2) 13)
      (check-equal? (sum-squares-of-two-largest 3 2 1) 13)
      (check-equal? (sum-squares-of-two-largest 3 1 2) 13)
      (check-equal? (sum-squares-of-two-largest 2 1 3) 13)
      (check-equal? (sum-squares-of-two-largest 2 3 1) 13))

    (test-case
      "when two largest numbers equal"
      (check-equal? (sum-squares-of-two-largest 1 2 2) 8))

    (test-case
      "when two lowerst numbers equal"
      (check-equal? (sum-squares-of-two-largest 1 1 2) 5))

    (test-case
      "when all numbers equal"
      (check-equal? (sum-squares-of-two-largest 3 3 3) 18))))

(run-tests sum-squares-of-two-largest-test)
