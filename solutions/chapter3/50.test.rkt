#lang sicp

(#%require rackunit
           rackunit/text-ui
           "50.rkt"
           "helpers.rkt")

(define s1 (cons-stream 1 (cons-stream 2 3)))
(define s2 (cons-stream 4 (cons-stream 5 6)))
(define sm (stream-multi-map (lambda (x y) (+ x y)) s1 s2))

(define stream-map-test
  (test-suite
    "stream-multi-map"
    (test-case
      "it should lazy mapped given streams"
      (check-equal? (stream-car (stream-cdr sm)) 7))))

(run-tests stream-map-test)
