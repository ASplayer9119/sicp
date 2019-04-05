#lang sicp

(#%require rackunit
           rackunit/text-ui
           "25.rkt")

(define t1 (make-table))
(define get (t1 'lookup-proc))
(define put (t1 'insert-proc!))

(put '(a) 1)
(put '(a b) 2)
(put '(a b c) 3)

(define multikey-table-test
  (test-suite
    "multikey-table"
    (test-case
      "it should handle different number of keys"
      (check-equal? (get '(a)) 1)
      (check-equal? (get '(a b)) 2)
      (check-equal? (get '(a b c)) 3)
      (check-equal? (get '(d)) #f))))

(run-tests multikey-table-test)
