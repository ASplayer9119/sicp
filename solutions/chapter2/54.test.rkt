#lang racket/base

(require rackunit
         rackunit/text-ui
         "54.rkt")

(define equal-test
  (test-suite
    "equal?"
    (test-case
      "it should return #t if elements in lists are equal to each other"
      (check-equal? (equal? '(this is a list) '(this is a list))
                    #t))
    (test-case
      "it should return #f if elements in lists are not equal to each other"
      (check-equal? (equal? '(this is a list) '(this (is a) list))
                    #f))))

(run-tests equal-test)
