#lang racket/base

(require rackunit
         rackunit/text-ui
         "56.rkt")

(define expt-test
  (test-suite
    "expt-test"
    (test-case
      "it should return deriv of expt expression"
      (check-equal? (deriv '(** x 4) 'x) '(* 4 (** x 3))))))

(run-tests expt-test)
