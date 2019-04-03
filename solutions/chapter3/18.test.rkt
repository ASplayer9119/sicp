#lang sicp

(#%require rackunit
           rackunit/text-ui
           "18.rkt")

(define l (list 1 2 3))

(define has-cycle?-test
  (test-suite
    "has-cycle?"
    (test-case
      "it should return #f if cycle is not in the list"
      (check-equal? (has-cycle? l) #f))
    (test-case
      "it should return #t if cycle is in the list"
      (append! l l)
      (check-equal? (has-cycle? l) #t))))

(run-tests has-cycle?-test)
