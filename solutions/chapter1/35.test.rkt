#lang racket/base

(require rackunit
         rackunit/text-ui
         "35.rkt")

(define fixed-point-test
  (test-suite
    "fixed-point"
    (test-case
      "it should calculate phi"
      (check-= (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
               1.6180
               0.0001))))

(run-tests fixed-point-test)
