#lang racket/base

(require rackunit
         rackunit/text-ui
         "07.rkt")

(define peter-acc (make-account 100 'open-sesame))
(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))

(define make-joint-test
  (test-suite
    "make-joint"
    (test-case
      "it should create joint acc"
      (check-equal? ((paul-acc 'rosebud 'withdraw) 20) 80)
      (check-equal? ((peter-acc 'open-sesame 'deposit) 10) 90))))

(run-tests make-joint-test)
