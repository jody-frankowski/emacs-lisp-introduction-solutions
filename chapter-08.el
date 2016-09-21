;; • Write an interactive function that searches for a string.  If the
;; search finds the string, leave point after it and display a message
;; that says “Found!”.  (Do not use ‘search-forward’ for the name of
;;                          this function; if you do, you will overwrite the existing version
;;                          of ‘search-forward’ that comes with Emacs.  Use a name such as
;;                          ‘test-search’ instead.)

(defun test-search (string)
  "Searches for string, moves point and prints 'Found!' if it find it."
  (interactive "MString: ")
  (when (search-forward string)
      (message "Found!")))

(test-search "Write a function")

;; • Write a function that prints the third element of the kill ring in
;; the echo area, if any; if the kill ring does not contain a third
;; element, print an appropriate message.

(defun print-third-element-of-kill-ring ()
  "Prints the third element of the kill ring in the echo area, if any; if the
kill ring does not contain a third element, prints an appropriate message."
  (let '(string (nth 2 kill-ring))
    (if string
        (message "%s" string)
      (message "Error: The kill-ring has no third element."))))

(setq kill-ring '(one two three))
(print-third-element-of-kill-ring)
(setq kill-ring '(one two))
(print-third-element-of-kill-ring)
