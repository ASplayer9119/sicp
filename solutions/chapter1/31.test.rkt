#lang racket/base

(require rackunit
         rackunit/text-ui
         "31.rkt"
         "helpers.rkt")

(define product-iter-test
  (test-suite
    "product-iter"
    (test-case
      "it should return product of numbers in interval"
      (check-equal? (product-iter identity 1 inc 5) 120))))

(define product-rec-test
  (test-suite
    "product-rec"
    (test-case
      "it should return product of numbers in interval"
      (check-equal? (product-rec identity 1 inc 5) 120))))

(define factorial-test
  (test-suite
    "factorial"
    (test-case
      "it should calculate factorial of given number"
      (check-equal? (factorial 10) 3628800))))

(define pi-approx-test
  (test-suite
    "pi-approx"
    (test-case
      "it should calculate approximation to pi"
      (check-= (pi-approx 1000) 3.14 0.01))))

(run-tests product-iter-test)
(run-tests product-rec-test)
(run-tests factorial-test)
(run-tests pi-approx-test)
