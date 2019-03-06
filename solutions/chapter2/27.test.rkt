#lang racket/base

(require rackunit
         rackunit/text-ui
         "27.rkt")

(define x (list (list 1 2) (list 3 4)))

(define reverse-test
  (test-suite
    "reverse"
    (test-case
      "it should produce shallow reverse of list"
      (check-equal? (reverse x)
                    (list (list 3 4) (list 1 2))))))

(define deep-reverse-test
  (test-suite
    "deep-reverse"
    (test-case
      "it should reverse nested structure"
      (check-equal? (deep-reverse x)
                    (list (list 4 3) (list 2 1))))))

(run-tests reverse-test)
(run-tests deep-reverse-test)
