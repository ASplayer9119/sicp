#lang racket/base

(require "helpers.rkt")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                    (adjoin-position
                      new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board null)

(define (adjoin-position row column res)
  (append (list (cons row column)) res))

(define (safe? k positions)
  (define (good? row col pos)
    (let ((i (car pos))
          (j (cdr pos)))
      (not (or (= row i)
               (= (- row col) (- i j))
               (= (+ row col)
                  (+ i j))))))
  (define (iter row col pos)
    (cond ((null? pos) #t)
          ((null? (car pos)) #t)
          ((good? row col (car pos)) (iter row col (cdr pos)))
          (else #f)))
  (if (or (null? positions)
          (null? (cdr positions))
          (null? (car positions)))
      #t
      (iter (caar positions) (cdar positions) (cdr positions))))

(provide queens)
