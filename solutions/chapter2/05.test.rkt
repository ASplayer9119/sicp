#lang racket/base

(require rackunit
         rackunit/text-ui
         "05.rkt")

(define cons-test
  (test-suite
    "cons-test"
    (test-case
      "car should return first number in pair"
      (check-equal? (car (cons 1 2)) 1))
    (test-case
      "cdr should return second number in pair"
      (check-equal? (cdr (cons 1 2)) 2))))

(run-tests cons-test)
