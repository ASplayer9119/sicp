#lang racket/base

(require rackunit
         rackunit/text-ui
         "66.rkt")

(define db (make-tree (make-record 4 "four")
                      (make-tree (make-record 2 "two")
                                 (make-tree (make-record 1 "one")
                                            '()
                                            '())
                                 (make-tree (make-record 3 "three")
                                            '()
                                            '()))
                      (make-tree (make-record 6 "six")
                                 (make-tree (make-record 5 "five")
                                            '()
                                            '())
                                 (make-tree (make-record 7 "seven")
                                            '()
                                            '()))))

(define lookup-test
  (test-suite
    "lookup"
    (test-case
      "it should return #f if no entry is found"
      (check-equal? (lookup 8 db) #f))
    (test-case
      "it should return value if entry is present in the db"
      (check-equal? (value (lookup 5 db)) "five"))))

(run-tests lookup-test)
