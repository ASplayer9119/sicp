#lang racket/base

(require rackunit
         rackunit/text-ui
         "12.rkt")

(define pascal-triangle-test
  (test-suite
    "pascal-triangle"
    (test-case
      "when take i less than 1 return 0"
      (check-equal? (pascal-triangle -1 0) 0))
    (test-case
      "when take j less than 1 return 0"
      (check-equal? (pascal-triangle 1 0) 0))
    (test-case
      "when take j greater than i return 0"
      (check-equal? (pascal-triangle 1 2) 0))
    (test-case
      "when take j equal 1 return 1"
      (check-equal? (pascal-triangle 2 1) 1))
    (test-case
      "when take j equal i return 1"
      (check-equal? (pascal-triangle 2 2) 1))
    (test-case
      "it return pascal number by (i,j) indexes"
      (check-equal? (pascal-triangle 5 3) 6))))

(run-tests pascal-triangle-test)
