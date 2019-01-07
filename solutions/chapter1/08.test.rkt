#lang racket/base

(require rackunit
         rackunit/text-ui
         "08.rkt")

(define cube-root-test
  (test-suite
    "cube-root"
    (test-case
      "it should return cube root"
      (check-= (cube-root 27) 3 0.01))))

(run-tests cube-root-test)
