;; Construct a list of four birds by evaluating several expressions with
;; ‘cons’.  Find out what happens when you ‘cons’ a list onto itself.
;; Replace the first element of the list of four birds with a fish.
;; Replace the rest of that list with a list of other fish.

;; Constructs the list.
(setq birds (cons 'bird-one (cons 'bird-two (cons 'bird-three (cons 'bird-four ())))))
birds

;; cons the list onto itself (=> ((bird-one bird-two bird-three bird-four) bird-one bird-two bird-three bird-four)).
(cons birds birds)
birds

;; Replaces the first element.
(setcar birds 'fish-one)
birds

;; Replaces the rest of the list.
(setcdr birds '(fish-two fish-three fish-four))
birds
