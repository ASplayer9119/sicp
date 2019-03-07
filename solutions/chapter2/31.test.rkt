#lang racket/base

(require rackunit
         rackunit/text-ui
         "31.rkt")

(define t (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))
(define res (list 1
                  (list 4 (list 9 16) 25)
                  (list 36 49)))

(define square-tree-test
  (test-suite
    "square-tree"
    (test-case
      "it should square leaves of tree"
      (check-equal? (square-tree t) res))))

(run-tests square-tree-test)
