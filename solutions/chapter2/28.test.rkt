#lang racket/base

(require rackunit
         rackunit/text-ui
         "28.rkt")

(define x (list (list 1 2) (list 3 4)))

(define fringe-test
  (test-suite
    "fringe"
    (test-case
      "it should return ordered leaves of tree"
      (check-equal? (fringe x)
                    (list 1 2 3 4))
      (check-equal? (fringe (list x x))
                    (list 1 2 3 4 1 2 3 4)))))

(run-tests fringe-test)
