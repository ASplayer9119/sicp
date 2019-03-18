#lang racket/base

(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit: CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))



; Ex 2.67
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree
                      (make-leaf 'D 1)
                      (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)



; Ex 2.68
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-1 current-tree)
    (cond ((leaf? current-tree) '())
          ((element-of-set? symbol (symbols (left-branch current-tree)))
           (cons 0 (encode-1 (left-branch current-tree))))
          ((element-of-set? symbol (symbols (right-branch current-tree)))
           (cons 1 (encode-1 (right-branch current-tree))))
          (else (error "bad symbol: ENCODE-SYMBOL" symbol))))
  (encode-1 tree))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define message '(A D A B B C A))
(encode message sample-tree)



; Ex 2.69
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (define (merge tree current-set)
    (if (null? current-set)
        tree
        (merge (make-code-tree (car current-set)
                               tree)
               (cdr current-set))))
  (merge (make-code-tree (car set) (cadr set)) (cddr set)))

(define sample-pairs '((A 4) (B 2) (C 1) (D 1)))

(generate-huffman-tree sample-pairs)



; Ex 2.70
(define rock-song '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom))

(define song-pairs '((a 2) (Get 2) (Sha 3) (Wah 1) (boom 1) (job 2) (na 16) (yip 9)))

(define song-tree (generate-huffman-tree song-pairs))
(define song-encoded (encode rock-song song-tree))
song-encoded
(length song-encoded)
