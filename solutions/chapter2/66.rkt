#lang racket/base

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (make-record key value)
  (list key value))
(define (key x)
  (car x))
(define (value x)
  (cadr x))

(define (lookup x db)
  (if (null? db)
      #f
      (let ((k (key (entry db))))
        (cond ((= x k) (entry db))
              ((< x k) (lookup x (left-branch db)))
              (else (lookup x (right-branch db)))))))

(provide (all-defined-out))
