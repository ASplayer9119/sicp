#lang racket/base

(require rackunit
         "38.rkt")

(check-equal? (fold-right / 1 (list 1 2 3)) 3/2)
(check-equal? (fold-left / 1 (list 1 2 3)) 1/6)
(check-equal? (fold-right list null (list 1 2 3))
              (list 1 (list 2 (list 3 null))))
(check-equal? (fold-left list null (list 1 2 3))
              (list (list (list null 1) 2) 3))
