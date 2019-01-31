#lang racket/base

(require rackunit
         rackunit/text-ui
         "46.rkt")

(define sqrt-test
  (test-suite
    "sqrt"
    (test-case
      "it should calculate sqrt"
      (check-= (sqrt 9) 3 0.001))))

(define fixed-point-test
  (test-suite
    "fixed-point"
    (test-case
      "it should calculate fixed-point"
      (check-= (fixed-point cos 1.0) 0.7390 0.0001))))

(run-tests sqrt-test)
(run-tests fixed-point-test)
