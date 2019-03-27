#lang racket/base

(require rackunit
         rackunit/text-ui
         "03.rkt")

(define acc (make-account 100 'secret-password))

(define protected-account-test
  (test-suite
    "make-account"
    (test-case
      "when take correct password it should process the operation"
      (check-equal? ((acc 'secret-password 'withdraw) 40) 60))
    (test-case
      "when take incorrect password it should return notification"
      (check-equal? ((acc 'some-other-password 'deposit) 50)
                    "Incorrect password"))))

(run-tests protected-account-test)
