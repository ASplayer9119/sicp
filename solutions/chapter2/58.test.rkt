#lang racket/base

(require rackunit
         rackunit/text-ui
         "58.rkt")

(define infix-form-test
  (test-suite
    "infix-form"
    (test-case
      "it should calculate deriv of expression in infix form"
      (check-equal? (deriv '(x + 3 * (x + y + 2)) 'x)
                    4))))

(run-tests infix-form-test)
