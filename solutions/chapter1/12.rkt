#lang racket/base

(define (pascal-triangle i j)
  (cond ((or (< i 1) (< j 1) (> j i)) 0)
        ((or (= j 1) (= i j)) 1)
        (else (+ (pascal-triangle (- i 1) (- j 1))
                 (pascal-triangle (- i 1) j)))))

(provide pascal-triangle)
