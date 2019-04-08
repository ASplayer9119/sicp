#lang sicp

(define (make-deque) (cons '() '()))

(define (empty-deque? dequeue)
  (null? (front-deque dequeue)))

(define (front-deque dequeue)
  (car dequeue))
(define (rear-deque dequeue)
  (cdr dequeue))

(define (make-el item)
  (cons '() (cons item '())))

(define (set-start-ptr! dequeue item)
  (set-car! dequeue item))
(define (set-end-ptr! dequeue item)
  (set-cdr! dequeue item))

(define (set-next-ptr-el! el item)
  (set-cdr! (cdr el) item))
(define (set-prev-ptr-el! el item)
  (set-car! el item))

(define (get-next-ptr-el el)
  (cddr el))
(define (get-prev-ptr-el el)
  (car el))
(define (get-value-el el)
  (cadr el))

(define (front-insert-deque! dequeue item)
  (let ((el (make-el item)))
    (cond ((empty-deque? dequeue)
           (set-start-ptr! dequeue el)
           (set-end-ptr! dequeue el)
           dequeue)
          (else (set-next-ptr-el! el (front-deque dequeue))
                (set-prev-ptr-el! (front-deque dequeue) el)
                (set-start-ptr! dequeue el)
                dequeue))))

(define (rear-insert-deque! dequeue item)
  (let ((el (make-el item)))
    (cond ((empty-deque? dequeue)
           (set-start-ptr! dequeue el)
           (set-end-ptr! dequeue el)
           dequeue)
          (else (set-next-ptr-el! (rear-deque dequeue) el)
                (set-prev-ptr-el! el (rear-deque dequeue))
                (set-end-ptr! dequeue el)
                dequeue))))

(define (front-delete-deque! dequeue)
  (if (empty-deque? dequeue)
      (error "FRONT-DELETE-DEQUE! called on empty dequeue")
      (begin (set-start-ptr! dequeue (get-next-ptr-el (front-deque dequeue)))
             dequeue)))

(define (rear-delete-deque! dequeue)
  (cond ((empty-deque? dequeue)
         (error "REAR-DELETE-DEQUE! called on empty dequeue"))
        (else (set-end-ptr! dequeue (get-prev-ptr-el (rear-deque dequeue)))
              (set-next-ptr-el! (rear-deque dequeue) '())
              dequeue)))

(define (print-deque dequeue)
  (define (iter x)
    (cond ((null? x) (display "]") (newline))
          (else (display (get-value-el x))
                (if (null? (get-next-ptr-el x))
                    (display "")
                    (display ","))
                (iter (get-next-ptr-el x)))))
  (display "[")
  (iter (front-deque dequeue)))

(define dq1 (make-deque))
(print-deque dq1)
(print-deque (rear-insert-deque! dq1 'b))
(print-deque (front-insert-deque! dq1 'a))
(print-deque (rear-insert-deque! dq1 'c))
(print-deque (front-delete-deque! dq1))
(print-deque (rear-delete-deque! dq1))
(print-deque (front-delete-deque! dq1))