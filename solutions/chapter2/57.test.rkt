#lang racket/base

(require rackunit
         rackunit/text-ui
         "57.rkt")

(define multiarg-test
  (test-suite
    "multiarg"
    (test-case
      "sum and product should handle more than 2 args"
      (check-equal? (deriv '(* x y (+ x 3)) 'x)
                    '(+ (* x y) (* y (+ x 3)))))))

(run-tests multiarg-test)
