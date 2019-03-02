#lang racket/base

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (find-divide-count n q)
  (define (iter n count)
    (if (= (remainder n q) 0)
        (iter (/ n q) (+ count 1))
        count))
  (iter n 0))

(define (car x)
  (find-divide-count x 2))
(define (cdr x)
  (find-divide-count x 3))

(provide (all-defined-out))
