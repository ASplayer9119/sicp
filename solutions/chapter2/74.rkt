#lang racket/base

(require "helpers.rkt")

; just stubs, but this should be implemented for each division
(define (get-dev-tag file)
  'dev1)
(define (get-dev-list file)
  (list 1 2 3))
(define (get-division record)
  'dev1)



(define (get-record employee-name file)
  ((get 'get-record (get-dev-tag file)) employee-name (get-dev-list file)))

(define (get-salary record)
  ((get 'get-salary (get-division record)) record))

(define (find-employee-record employee-name files-list)
  (if (null? files-list)
      #f
      (let ((current-file (car files-list)))
        (if (null? current-file)
            #f
            (let ((employee-record (get-record employee-name current-file)))
              (if (null? employee-record)
                  (find-employee-record employee-name (cdr files-list))
                  employee-record))))))
