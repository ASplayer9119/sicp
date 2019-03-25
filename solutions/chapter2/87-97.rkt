#lang racket/base

; Here I defined only needed parts for the exercise
; so it wouldn't work without the rest of the system

; Ex 2.87 - Ex 2.88
(define (install-polynomial-package)
  (define (make-poly variable term-list) (cons variable term-list))
  (define (variable p) (car p))
  (define (term-lsit p) (cdr p))
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons term term-list)))
  (define (the-empty-termlist) '())
  (define (first-term term-list) (car term-list))
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist? term-list) (null? term-list))
  (define (make-term order coeff) (list order coeff))
  (define (order term) (car term))
  (define (coeff term) (cadr term))
  (define (add-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                  (add-terms (term-list p1) (term-list p2)))
        (error "Polys not in same var: ADD-POLY" (list p1 p2))))
  (define (add-terms L1 L2)
    (cond ((empty-termlist? L1) L2)
          ((empty-termlist? L2) L1)
          (else
            (let ((t1 (first-term L1))
                  (t2 (first-term L2)))
              (cond ((> (order t1) (order t2))
                     (adjoin-term
                      t1 (add-terms (rest-terms L1) L2)))
                    ((< (order t1) (order t2))
                     (adjoin-term
                      t2 (add-terms L1 (rest-terms L2))))
                    (else
                      (adjoin-term
                        (make-term (order t1)
                                   (add (coeff t1) (coeff t2)))
                        (add-terms (rest-terms L1)
                                   (rest-terms L2)))))))))
  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                  (mul-terms (term-list p1) (term-list p2)))
        (error "Polys not in same var: MUL-POLY" (list p1 p2))))
  (define (mul-terms L1 L2)
    (if (empty-termlist? L1)
        (the-empty-termlist)
        (add-terms (mul-term-by-all-terms (first-term L1) L2)
                   (mul-terms (rest-terms L1) L2))))
  (define (mul-term-by-all-terms t1 L)
    (if (empty-termlist? L)
      (the-empty-termlist)
      (let ((t2 (first-term L)))
        (adjoin-term
          (make-term (+ (order t1) (order t2))
                     (mul (coeff t1) (coeff t2)))
          (mul-term-by-all-terms t1 (rest-terms L))))))
  (define (=zero-poly? x)
    (define (iter termlist)
      (if (empty-termlist? termlist)
          #t
          (and (=zero? (coeff (first-term termlist)))
               (iter (rest-terms termlist)))))
    (iter (term-list x)))
  (define (negate-poly p)
    (define (negate-term term) (make-term (order term) (- (coeff term))))
    (define (iter termlist new-poly)
      (cond ((empty-termlist? termlist) new-poly)
            (else (iter (rest-terms termlist)
                        (adjoin-term (negater-term (first-term termlist))
                                     new-poly)))))
    (make-poly (variable p)
               (reverse (iter (term-list p) (the-empty-termlist)))))
  (define (tag p) (attach-tag 'polynomial p))
  
  (put 'add '(polynomial polynomial)
    (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'mul '(polynomial polynomial)
    (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'make 'polynomial
    (lambda (var terms) (tag (make-poly var terms))))
  (put '=zero? '(polynomial) =zero-poly?)
  (put 'sub '(polynomial polynomial)
    (lambda (p1 p2) (tag (add-poly p1 (negate-poly p2))))))

(define (make-polynomial var terms)
  ((get 'make 'polynomial) var terms))



; Ex 2.89
(define (first-term term-list) 
  (make-term (- (len term-list) 1) (car term-list))) 

(define (adjoin-term term term-list) 
  (cond ((=zero? term) term-list) 
        ((=equ? (order term) (length term-list)) (cons (coeff term) term-list)) 
        (else (adjoin-term term (cons 0 term-list)))))



; Ex 2.91
(define (div-terms L1 L2)
  (if (empty-termlist? L1)
      (list (the-empty-termlist) (the-empty-termlist))
      (let ((t1 (first-term L1))
            (t2 (first-term L2)))
        (if (> (order t2) Order t1))
            (list (the-empty-termlist) L1)
            (let ((new-c (div (coeff t1) (coeff t2)))
                  (new-o (- (order t1) (order t2))))
              (let ((rest-of-result
                     (div-terms
                      (add-terms L1
                                 (negate-term-list (mul-term-by-all-terms (make-term new-o new-c) L2)))
                      L2)))
                (list (adjoin-term (make-term new-o new-c)
                                   (car rest-of-result))
                      (cadr rest-of-result)))))))

(define (div-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-term (variable p1)
                 (div-terms (term-list p1)
                            (term-list p2)))
      (error "Polys not in same var -- DIV-POLY" (list p1 p2))))



; Ex 2.94
(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))

(define (remainder-terms)
  (cadr (div-terms a b)))

(define (greatest-common-divisor p1 p2)
  (gcd-terms (term-list p1) (term-list p2)))
