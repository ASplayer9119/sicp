#lang racket/base

(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))

(define (f-iter n)
  (define (iter f1 f2 f3 count)
    (if (= count n)
        f1
        (iter (+ f1 (* 2 f2) (* 3 f3))
              f1
              f2
              (+ count 1))))
  (if (< n 3)
      n
      (iter 2 1 0 2)))

(provide (all-defined-out))
