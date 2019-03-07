#lang racket/base

(require rackunit
         rackunit/text-ui
         "30.rkt")

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

(define square-tree-map-test
  (test-suite
    "square-tree-map"
    (test-case
      "it should square leaves of tree"
      (check-equal? (square-tree-map t) res))))

(run-tests square-tree-test)
(run-tests square-tree-map-test)
