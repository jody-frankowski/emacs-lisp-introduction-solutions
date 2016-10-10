;; • Write a function to search for a regular expression that matches
;; two or more blank lines in sequence.

(defun search-blank-lines ()
  "Search forward two or more blank lines."
  (interactive)
  (re-search-forward "\n\n\n+")
  )

;; • Write a function to search for duplicated words, such as “the the”.
;; *Note Syntax of Regular Expressions: (emacs)Regexps, for
;; information on how to write a regexp (a regular expression) to
;; match a string that is composed of two identical halves.  You can
;; devise several regexps; some are better than others.  The function
;; I use is described in an appendix, along with several regexps.
;; *Note ‘the-the’ Duplicated Words Function: the-the.

(defun the-the ()
  "Search forward duplicate words."
  (interactive)
  (re-search-forward "\\b\\([^@ \n\t]+\\)[ \n\t]+\\1\\b")
  )

;; Lorem ipsum the the lorem ipsum
