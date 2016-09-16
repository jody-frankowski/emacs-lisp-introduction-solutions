;; • Write your own ‘simplified-end-of-buffer’ function definition; then
;; test it to see whether it works.
(defun simplified-end-of-buffer ()
    "Move point to the end of the visible buffer."
  (interactive)
  (push-mark)
  (goto-char (point-max)))

;; • Use ‘if’ and ‘get-buffer’ to write a function that prints a message
;; telling you whether a buffer exists.
(defun buffer-exists (buffer)
  "Prints whether buffer buffer exists."
  (interactive "BName of buffer: ")
  (if (get-buffer buffer)
      (message "The buffer bufferd %s exists." name)
    (message "The buffer bufferd %s does not exist." name)))

(buffer-exists "chapter-04.el")

;; • Using ‘find-tag’, find the source for the ‘copy-to-buffer’
;; function
(find-tag 'copy-to-buffer)
