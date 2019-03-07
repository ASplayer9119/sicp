#lang racket/base

(define (square x) (* x x))

(define (square-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
          (if (not (pair? sub-tree))
              (square sub-tree)
              (square-tree-map sub-tree)))
        tree))

(provide (all-defined-out))
