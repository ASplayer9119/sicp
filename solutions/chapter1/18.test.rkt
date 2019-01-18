#lang racket/base

(require rackunit
         rackunit/text-ui
         "18.rkt")

(define mul-fast-test
  (test-suite
    "mul-fast"
    (test-case
      "it should correctly multiplies two numbers"
      (check-equal? (mul-fast 3 5) 15))))

(run-tests mul-fast-test)
