#lang racket/base

(require rackunit
         rackunit/text-ui
         "11.rkt")

(define f-rec-test
  (test-suite
   "f-rec"
   (test-case
    "when take n < 3 it should return n"
    (check-equal? (f-rec 1) 1)
    (check-equal? (f-rec 2) 2))
   (test-case
    "when take n >= 3 it should calculate result by formula"
    (check-equal? (f-rec 3) 4)
    (check-equal? (f-rec 4) 11)
    (check-equal? (f-rec 5) 25)
    (check-equal? (f-rec 6) 59))))

(define f-iter-test
  (test-suite
   "f-iter"
   (test-case
    "when take n < 3 it should return n"
    (check-equal? (f-iter 1) 1)
    (check-equal? (f-iter 2) 2))
   (test-case
    "when take n >= 3 it should calculate result by formula"
    (check-equal? (f-iter 3) 4)
    (check-equal? (f-iter 4) 11)
    (check-equal? (f-iter 5) 25)
    (check-equal? (f-iter 6) 59))))

(run-tests f-rec-test)
(run-tests f-iter-test)
