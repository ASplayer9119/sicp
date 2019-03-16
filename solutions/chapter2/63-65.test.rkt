#lang racket/base

(require rackunit
         rackunit/text-ui
         "63-65.rkt")

(define tree1 (list->tree '(1 2 3 4)))
(define tree2 (list->tree '(2 4 6 8)))

(define union-set-tree-test
  (test-suite
    "union-set-tree"
    (test-case
      "it should return balanced tree with all nodes from given trees"
      (check-equal? (union-set-tree tree1 tree2)
                    (list 3 (list 1 '() (list 2 '() '()))
                            (list 6 (list 4 '() '()) (list 8 '() '())))))))
(define intersection-set-tree-test
  (test-suite
    "intersection-set-tree"
    (test-case
      "it should return balanced tree with nodes that presented in both given trees"
      (check-equal? (intersection-set-tree tree1 tree2)
                    (list 2 '() (list 4 '() '()))))))

(run-tests union-set-tree-test)
(run-tests intersection-set-tree-test)
