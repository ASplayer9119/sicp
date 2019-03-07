#lang racket/base

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a
(define (left-branch x)
  (car x))
(define (right-branch x)
  (cadr x))

(define (branch-length x)
  (car x))
(define (branch-structure x)
  (cadr x))

; b
(define (total-weight x)
  (cond ((null? x) null)
        ((not (pair? x)) x)
        (else (+ (total-weight (branch-structure (left-branch x)))
                 (total-weight (branch-structure (right-branch x)))))))

; c
(define (torgue x)
  (* (branch-length x)
     (total-weight (branch-structure x))))

(define (balanced? x)
  (cond ((not (pair? x)) #t)
        (else (and (= (torgue (left-branch x))
                      (torgue (right-branch x)))
                   (balanced? (branch-structure (left-branch x)))
                   (balanced? (branch-structure (right-branch x)))))))

; d
; we should change only selectors in case we changed constructor
; (define (make-mobile left right) (cons left right))
; (define (make-branch length structure)
;   (cons length structure))

; (define (left-branch x)
;   (car x))
; (define (right-branch x)
;   (cdr x))

; (define (branch-length x)
;   (car x))
; (define (branch-structure x)
;   (cdr x))

(provide (all-defined-out))
