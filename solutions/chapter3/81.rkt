#lang sicp

(#%require "helpers.rkt")

(define random-init 0)
(define (rand-update val)
  (+ 1 val))
(define (reset val) val)

(define (rand requests)
  (define (inner stream last-val)
    (define (dispatch method val)
      (cond ((eq? method 'generate) (rand-update last-val))
            ((eq? method 'reset) (reset val))))
    (define next-val (apply dispatch (stream-car requests)))
    (cons-stream last-val
                 (inner (stream-cdr requests) next-val)))
  (inner requests random-init))
