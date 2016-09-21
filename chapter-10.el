;; • Using ‘C-h v’ (‘describe-variable’), look at the value of your kill
;; ring.  Add several items to your kill ring; look at its value
;; again.  Using ‘M-y’ (‘yank-pop)’, move all the way around the kill
;; ring.  How many items were in your kill ring?  Find the value of
;; ‘kill-ring-max’.  Was your kill ring full, or could you have kept
;; more blocks of text within it?

;; Press C-y once and then M-y until you see you have looped over the kill-ring.
kill-ring-max

;; • Using ‘nthcdr’ and ‘car’, construct a series of expressions to
;; return the first, second, third, and fourth elements of a list.

(setq test-list '(one two three four five))
(car (nthcdr 0 test-list))
(car (nthcdr 1 test-list))
(car (nthcdr 2 test-list))
(car (nthcdr 3 test-list))
