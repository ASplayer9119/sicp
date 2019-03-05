#lang racket/base

(require rackunit
         rackunit/text-ui
         "25.rkt")

(define solutions-test
  (test-suite
    "combinations of cars and cdrs"
    (test-case
      "it should return 7"
      (check-equal? (solution-1 (list 1 3 (list 5 7) 9)) 7)
      (check-equal? (solution-2 (list (list 7))) 7)
      (check-equal? (solution-3 (list 1
                                      (list 2
                                            (list 3
                                                  (list 4
                                                        (list 5
                                                              (list 6 7)))))))
                    7))))

(run-tests solutions-test)
