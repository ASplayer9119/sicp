#lang racket/base

(require rackunit
         rackunit/text-ui
         "32.rkt"
         "helpers.rkt")

(define sum-test
  (test-suite
    "sum"
    (test-case
      "it should calculate sum"
      (check-equal? (sum identity 1 inc 5) 15))))

(define product-test
  (test-suite
    "product"
    (test-case
      "it should calculate product"
      (check-equal? (product identity 1 inc 5) 120))))

(run-tests sum-test)     
(run-tests product-test) 
