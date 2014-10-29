#lang racket

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

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

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

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
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (encode-symbol symbol tree)
  (cond [(and (leaf? tree) (eq? (symbol-leaf tree) symbol))
         '()]
        [(element-of-set? symbol (symbols (left-branch tree)))
         (cons '0 (encode-symbol symbol (left-branch tree)))]
        [(element-of-set? symbol (symbols (right-branch tree)))
         (cons '1 (encode-symbol symbol (right-branch tree)))]
        [else
         (error "symbol not in tree")]))

(define (element-of-set? x set) 
  (cond [(null? set) #f] 
        [(equal? x (car set)) #t]
        [else 
         (element-of-set? x (cdr set))])) 

(provide make-leaf
         leaf?
         symbol-leaf
         weight-leaf
         make-code-tree
         left-branch
         right-branch
         symbols
         weight
         encode
         decode)
