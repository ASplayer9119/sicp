#lang sicp

(#%require rackunit
           rackunit/text-ui
           "17.rkt")

(define correct-count-pairs-test
  (test-suite
    "correct-count-pairs"
    (test-case
      "it should correct number of pairs in list structure"
      (check-equal? (correct-count-pairs e1) 2)
      (check-equal? (correct-count-pairs e2) 4)
      (check-equal? (correct-count-pairs e3) 4)
      (check-equal? (correct-count-pairs e4) 1))))

(run-tests correct-count-pairs-test)
