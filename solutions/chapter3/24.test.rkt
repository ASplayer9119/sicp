#lang sicp

(#%require rackunit
           rackunit/text-ui
           "24.rkt")

(define (rounded-equal? x y)
  (if (and (number? x) (number? y))
      (= (round x) (round y))
      (equal? x y)))

(define operation-table (make-table rounded-equal?))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put 1 2.4 'hi)

(define make-table-test
  (test-suite
    "make-table"
    (test-case
      "it should compare rounded keys"
      (check-equal? (get 1 2) 'hi)
      (check-equal? (get 1 3) #f))))

(run-tests make-table-test)
