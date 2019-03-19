#lang racket/base

(require "helpers.rkt")

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num) (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        ((=number? base 1) 1)
        ((and (number? base) (number? exponent)) (expt base exponent))
        (else (list '** base exponent))))

(define (install-sum-package)
  (define (addend s) (car s))
  (define (augend s) (cadr s))
          
  (put 'deriv '+
    (lambda (exp var)
      (make-sum (deriv (addend exp) var)
                (deriv (augend exp) var))))
  'done)

(define (install-product-package)
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
          
  (put 'deriv '*
    (lambda (exp var)
      (make-sum
        (make-product (multiplier exp)
                      (deriv (multiplicand exp) var))
        (make-product (deriv (multiplier exp) var)
                      (multiplicand exp)))))
  'done)

(define (install-exponentiation-package)
  (define (base e) (car e))
  (define (exponent e) (cadr e))
  
  (put 'deriv '**
    (lambda (exp var)
      (make-product (make-product
                      (exponent exp)
                      (make-exponentiation (base exp)
                                           (make-sum (exponent exp) -1)))
                    (deriv (base exp) var))))
  'done)

(install-sum-package)
(install-product-package)
(install-exponentiation-package)

(deriv '(+ x 2) 'x)
(deriv '(* x y) 'x)
(deriv '(** x 4) 'x)
