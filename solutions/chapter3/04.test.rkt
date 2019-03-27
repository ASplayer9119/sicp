#lang racket/base

(require rackunit
         rackunit/text-ui
         "04.rkt")

(define acc (make-account 100 'secret-password))

(define protected-account-test
  (test-suite
    "make-account"
    (test-case
      "when called with incorrect password more then 7 consecutive times it should call the police"
      (check-equal? ((acc 'some-other-password 'deposit) 50)
                    "Incorrect password")
      (check-equal? ((acc 'secret-password 'deposit) 50)
                    150)
      (check-equal? ((acc 'some-other-password 'deposit) 50)
                    "Incorrect password")
      (check-equal? ((acc 'some-other-password 'deposit) 50)
                    "Incorrect password")
      (check-equal? ((acc 'some-other-password 'deposit) 50)
                    "Incorrect password")
      (check-equal? ((acc 'some-other-password 'deposit) 50)
                    "Incorrect password")
      (check-equal? ((acc 'some-other-password 'deposit) 50)
                    "Incorrect password")
      (check-equal? ((acc 'some-other-password 'deposit) 50)
                    "Incorrect password")
      (check-equal? ((acc 'some-other-password 'deposit) 50)
                    "Incorrect password")
      (check-equal? ((acc 'some-other-password 'deposit) 50)
                    "The police are on their way!"))))

(run-tests protected-account-test)
