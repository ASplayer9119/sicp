#lang racket/base

(require "77-80.rkt"
         "helpers.rkt")

(define (all-elements-of-same-type? types)
  (define (iter current-type types)
    (cond ((null? types) #t)
          ((not (eq? current-type (car types))) #f)
          (else (iter current-type (cdr types)))))
  (cond ((null? types) #t)
        ((= (length types) 1) #t)
        (else (iter (car types) (cdr types)))))

(define (can-convert-all-types? target types)
  (= (length types)
     (length (filter (lambda (x) (and x #t))
                     (map (lambda (t) (get-coercion t target)) types)))))

(define (find-conversion types)
  (define (iter remaining)
    (cond ((null? remaining) #f)
          ((can-convert-all-types? (car remaining) types) (car remaining))
          (else (iter (cdr remaining)))))
  (iter types))

(define (convert-all-types target args)
  (let ((type-tags (map type-tag args)))
    (if (can-convert-all-types? target type-tags)
        (map (lambda (x) ((get-coercion (type-tag x) target) x)) args)
        #f)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (cond (proc (apply proc (map contents args)))
            ((all-elements-of-same-type? type-tags)
             (error "No method for these types"
                    (list op type-tags)))
            ((find-conversion type-tags)
             (apply apply-generic op
              (convert-all-types (find-conversion type-tags) args)))
            (else (error "No method for these types"
                         (list op type-tags)))))))
