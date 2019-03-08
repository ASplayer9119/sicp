#lang racket/base

(require rackunit
         rackunit/text-ui
         "33.rkt")

(define (square x) (* x x))

(define accumulate-test
  (test-suite
    "accumulate"
    (test-case
      "it can implement map"
      (check-equal? (map square (list 1 2 3))
                    (list 1 4 9)))
    (test-case
      "it can implement append"
      (check-equal? (append (list 1 2 3) (list 4 5 6))
                    (list 1 2 3 4 5 6)))
    (test-case
      "it can implement length"
      (check-equal? (length (list 1 2 3)) 3))))

(run-tests accumulate-test)
