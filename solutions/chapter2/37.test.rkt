#lang racket/base

(require rackunit
         rackunit/text-ui
         "37.rkt")

(define m (list (list 1 2 3)
                (list 4 5 6)
                (list 6 7 8)))
(define v (list 1 2 3))
(define w (list 4 5 6))

(define matrix-test
  (test-suite
    "matrix operations"
    (test-case
      "dot-product should return product of vectors"
      (check-equal? (dot-product v w) 32))
      
    (test-case
      "matrix-*-vector should return correct product vector"
      (check-equal? (matrix-*-vector m v)
                    (list 14 32 44)))
                    
    (test-case
      "transpose should return transposed matrix"
      (check-equal? (transpose m)
                    (list (list 1 4 6)
                          (list 2 5 7)
                          (list 3 6 8))))
                          
    (test-case
      "matrix-*-matrix should return correct product matrix"
      (check-equal? (matrix-*-matrix m m)
                    (list (list 27 33 39)
                          (list 60 75 90)
                          (list 82 103 124))))))

(run-tests matrix-test)
