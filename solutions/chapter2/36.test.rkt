#lang racket/base

(require rackunit
         rackunit/text-ui
         "36.rkt")

(define s (list (list 1 2 3) (list 4 5 6)
                (list 7 8 9) (list 10 11 12)))

(define accumulate-n-test
  (test-suite
    "accumulate-n"
    (test-case
      "it should accumulate all n-th element in sequence"
      (check-equal? (accumulate-n + 0 s) (list 22 26 30)))))

(run-tests accumulate-n-test)
