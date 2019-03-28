#lang racket/base

(define random-init 0)
(define (rand-update val)
  (+ 1 val))

(define rand
  (let ((x random-init))
    (define (dispatch symbol)
      (cond ((eq? symbol 'generate)
             (set! x (rand-update x))
             x)
            ((eq? symbol 'reset)
             (lambda (new-val)
              (set! x new-val)
              x))))
    dispatch))

(provide rand)
