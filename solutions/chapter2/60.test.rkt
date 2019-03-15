#lang racket/base

(require rackunit
         rackunit/text-ui
         "60.rkt")

(define element-of-set-test
  (test-suite
    "element-of-set?"
    (test-case
      "it should return #f if element is not in the set"
      (check-equal? (element-of-set? 1 (list 2 3 4)) #f))
    (test-case
      "it should return #t if element is in the set"
      (check-equal? (element-of-set? 1 (list 1 2 3 4)) #t))))

(define adjoin-set-test
  (test-suite
    "adjoin-set"
    (test-case
      "it should add element to the set"
      (check-equal? (adjoin-set 1 (list 2 3)) (list 1 2 3)))))

(define union-set-test
  (test-suite
    "union-set"
    (test-case
      "it should return set with all elements from two given sets"
      (check-equal? (union-set (list 1 2 3) (list 1 2 3 4))
                    (list 1 2 3 1 2 3 4)))))

(define intersection-set-test
  (test-suite
    "intersection-set"
    (test-case
      "it should return set with elements that presented in both given sets"
      (check-equal? (intersection-set (list 1 2 3) (list 2 3 4))
                    (list 2 3)))))

(run-tests element-of-set-test)
(run-tests adjoin-set-test)
(run-tests union-set-test)
(run-tests intersection-set-test)
