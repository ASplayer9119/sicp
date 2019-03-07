#lang racket/base

(require rackunit
         rackunit/text-ui
         "29.rkt")

(define m (make-mobile
            (make-branch 1
              (make-mobile (make-branch 3 6)
                           (make-branch 4
                            (make-mobile (make-branch 7 9)
                                         (make-branch 8 10)))))
            (make-branch 2
                         5)))

(define m2 (make-mobile
              (make-branch 4 6)
              (make-branch 2
                           (make-mobile (make-branch 5 8)
                                        (make-branch 10 4)))))

(define total-weight-test
  (test-suite
    "mobile"
    (test-case
      "total-weight should return weight of mobile"
      (check-equal? (total-weight m) 30))))

(define balanced-test
  (test-suite
    "mobile"
    (test-case
      "balanced? should determine if mobile is balanced"
      (check-equal? (balanced? m) #f)
      (check-equal? (balanced? m2) #t))))

(run-tests total-weight-test)
(run-tests balanced-test)
