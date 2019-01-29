#lang racket/base

(require rackunit
         rackunit/text-ui
         "37.rkt")

(define cont-frac-iter-test
  (test-suite
    "cont-frac-iter"
    (test-case
      "it should calculate 1/phi"
      (check-= (cont-frac-iter (lambda (i) 1.0)
                               (lambda (i) 1.0)
                               100)
                0.61804697
                0.0001))))

(define cont-frac-rec-test
  (test-suite
    "cont-frac-rec"
    (test-case
      "it should calculate 1/phi"
      (check-= (cont-frac-rec (lambda (i) 1.0)
                              (lambda (i) 1.0)
                              100)
                0.61804697
                0.0001))))

(run-tests cont-frac-iter-test)
(run-tests cont-frac-rec-test)
