#lang racket/base

(define (square x) (* x x))

(define (tree-map proc tree)
  (map (lambda (sub-tree)
          (if (pair? sub-tree)
              (tree-map proc sub-tree)
              (proc sub-tree)))
        tree))

(define (square-tree tree)
  (tree-map square tree))

(provide square-tree)
