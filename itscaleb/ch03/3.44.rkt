;; *Exercise 3.44:* Consider the problem of transferring an amount
;; from one account to another.  Ben Bitdiddle claims that this can
;; be accomplished with the following procedure, even if there are
;; multiple people concurrently transferring money among multiple
;; accounts, using any account mechanism that serializes deposit and
;; withdrawal transactions, for example, the version of
;; `make-account' in the text above.

(define (transfer from-account to-account amount)
  ((from-account 'withdraw) amount)
  ((to-account 'deposit) amount))

;; Louis Reasoner claims that there is a problem here, and that we
;; need to use a more sophisticated method, such as the one required
;; for dealing with the exchange problem.  Is Louis right?  If not,
;; what is the essential difference between the transfer problem and
;; the exchange problem?  (You should assume that the balance in
;;                             `from-account' is at least `amount'.)

;; I don't believe Louis is right, because transfer doesn't require that
;; the values of the accounts to be swapped like exchange did. Multiple
;; transfers to and from one account to others can happen and will still
;; produce correct values.
