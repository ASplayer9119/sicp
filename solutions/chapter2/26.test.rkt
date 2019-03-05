#lang racket/base

(require rackunit
         "26.rkt")

(check-equal? (append x y) (list 1 2 3 4 5 6))
(check-equal? (cons x y) (list (list 1 2 3) 4 5 6))
(check-equal? (list x y) (list (list 1 2 3) (list 4 5 6)))
