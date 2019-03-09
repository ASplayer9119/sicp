#lang racket/base

(require rackunit
         rackunit/text-ui
         "35.rkt")

(define x (cons (list 1 2) (list 3 4)))

(define count-leaves-test
  (test-suite
    "count-leaves"
    (test-case
      "it should return number of leaves in a tree"
      (check-equal? (count-leaves (list x x)) 8))))

(run-tests count-leaves-test)
