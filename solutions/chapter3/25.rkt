#lang sicp

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (assoc keys records)
      (cond ((null? records) false)
            ((equal? keys (caar records)) (car records))
            (else (assoc keys (cdr records)))))
    (define (lookup keys)
      (let ((record
            (assoc keys (cdr local-table))))
        (if record
            (cdr record)
            false)))
    (define (insert! keys value)
      (let ((record (assoc keys (cdr local-table))))
        (if record
            (set-cdr! record value)
            (set-cdr! local-table
                      (cons (cons keys value)
                            (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation: TABLE" m))))
    dispatch))

(#%provide (all-defined))
