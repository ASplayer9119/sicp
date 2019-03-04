#lang racket/base

(require rackunit
         rackunit/text-ui
         "18.rkt")

(define reverse-test
  (test-suite
    "reverse"
    (test-case
      "it should return list in reverse order"
      (check-equal? (reverse (list 1 4 9 16 25))
                    (list 25 16 9 4 1)))))

(run-tests reverse-test)
