#lang racket/base

(require rackunit
         rackunit/text-ui
         "02.rkt")

(define s (make-monitored sqrt))

(define make-monitored-test
  (test-suite
    "make-monitored"
    (test-case
      "it should return result of applying provided procedure"
      (check-equal? (s 100) 10)
      (check-equal? (s 25) 5))
    (test-case
      "it should return number of calls"
      (check-equal? (s 'how-many-calls?) 2))
    (test-case
      "it should reset calls counter"
      (check-equal? (s 'reset-count) 0)
      (check-equal? (s 36) 6)
      (check-equal? (s 'how-many-calls?) 1))))

(run-tests make-monitored-test)
