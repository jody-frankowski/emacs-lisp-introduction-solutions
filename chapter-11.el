;; • Write a function similar to ‘triangle’ in which each row has a
;;   value which is the square of the row number.  Use a ‘while’ loop.

(defun triangle-square (rows)
  "Sum the square of the number of element in each row for each rows, with the
number of elements in a row being its row number."
  (interactive "nNumber of rows: ")
  (setq sum 0)
  (while (> rows 0)
    (setq sum (+ sum (* rows rows)))
    (setq rows (1- rows)))
  sum)

(triangle-square 0)
(triangle-square 1)
(triangle-square 2)
(triangle-square 3)

;; • Write a function similar to ‘triangle’ that multiplies instead of
;;   adds the values.

(defun triangle-multiply (rows)
  "Sum the multiplication of the number of element in each row for each rows, with the
number of elements in a row being its row number."
  (interactive "nNumber of rows: ")
  (setq product rows)
  (setq rows (1- rows))
  (while (> rows 0)
    (setq product (* product rows))
    (setq rows (1- rows)))
  product)

(triangle-multiply 0)
(triangle-multiply 1)
(triangle-multiply 2)
(triangle-multiply 3)

;; • Rewrite these two functions recursively.  Rewrite these functions
;;   using ‘cond’.

(defun triangle-square-cond (rows)
  "Sum the square of the number of element in each row for each rows, with the
number of elements in a row being its row number."
  (interactive "nNumber of rows: ")
  (cond
    ((<= rows 0) 0)
    ((= rows 1) 1)
    ((> rows 1)
     (+ (* rows rows) (triangle-square-cond (1- rows))))))

(triangle-square-cond 0)
(triangle-square-cond 1)
(triangle-square-cond 2)
(triangle-square-cond 3)

(defun triangle-multiply-cond (rows)
  "Sum the multiplication of the number of element in each row for each rows, with the
number of elements in a row being its row number."
  (interactive "nNumber of rows: ")
  (cond
   ((<= rows 0) 0)
   ((= rows 1) 1)
   ((> rows 1)
    (* rows (triangle-multiply-cond (1- rows))))))

(triangle-multiply-cond 0)
(triangle-multiply-cond 1)
(triangle-multiply-cond 2)
(triangle-multiply-cond 3)

;; • Write a function for Texinfo mode that creates an index entry at
;;   the beginning of a paragraph for every ‘@dfn’ within the paragraph.
;;   (In a Texinfo file, ‘@dfn’ marks a definition.  This book is
;;   written in Texinfo.)

;;   Many of the functions you will need are described in two of the
;;   previous chapters, *note Cutting and Storing Text: Cutting &
;;   Storing Text, and *note Yanking Text Back: Yanking.  If you use
;;   ‘forward-paragraph’ to put the index entry at the beginning of the
;;   paragraph, you will have to use ‘C-h f’ (‘describe-function’) to
;;   find out how to make the command go backwards.

;;   For more information, see *note Indicating Definitions:
;;   (texinfo)Indicating.

(defun create-index-entries-dfn ()
  "Create an index entry at the beginning of the current paragraph for every
@dfn within this paragraph."
  (interactive)
  (save-excursion
    ;; Narrow region to the paragraph
    (mark-paragraph)
    (save-restriction
      (narrow-to-region (point) (mark))
      (backward-paragraph)

      ;; Search and kill dfns
      (let (start end dfns)
        (while (search-forward "@dfn{" nil t)
          (setq start (point))
          (search-forward "}" nil t)
          (setq end (1- (point)))
          (setq dfns (cons (buffer-substring-no-properties start end) dfns))
          )

        (backward-paragraph)

        (setq dfns (reverse dfns))
        (dolist (dfn dfns)
          (insert (concat "\n@cindex " dfn))
          )
        )
      )
    )
  )

;; Lorem ipsum dolor sit amet, @dfn{consectetuer} adipiscing elit.  Donec hendrerit tempor tellus.  Donec pretium posuere tellus.  Proin quam nisl, tincidunt et, mattis eget, convallis nec, purus.  Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.  Nulla posuere.  Donec vitae dolor.  Nullam tristique diam non turpis.  Cras placerat accumsan nulla.  Nullam rutrum.  Nam vestibulum accumsan nisl.
;; Nullam eu ante vel est @dfn{convallis} dignissim.  Fusce suscipit, wisi nec facilisis facilisis, est dui fermentum leo, quis tempor ligula erat quis odio.  Nunc porta vulputate tellus.  Nunc rutrum turpis sed pede.  Sed bibendum.  Aliquam posuere.  Nunc aliquet, augue nec adipiscing interdum, lacus tellus malesuada massa, quis varius mi purus non odio.  Pellentesque condimentum, magna ut suscipit hendrerit, ipsum augue ornare nulla, non luctus diam neque sit amet urna.  Curabitur vulputate vestibulum lorem.  Fusce sagittis, libero non molestie mollis, magna orci ultrices dolor, at vulputate neque nulla lacinia eros.  Sed id ligula quis est convallis tempor.  Curabitur lacinia pulvinar nibh.  Nam a sapien.
