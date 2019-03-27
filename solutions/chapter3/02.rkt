#lang racket/base

(define (make-monitored proc)
  (let ((counter 0))
    (define (mf val)
      (cond ((eq? val 'how-many-calls?) counter)
            ((eq? val 'reset-count) (begin (set! counter 0) counter))
            (else (begin (set! counter (+ counter 1))
                         (proc val)))))
    mf))

(provide make-monitored)
