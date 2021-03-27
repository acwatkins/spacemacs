;;; packages.el --- acw-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2020 Sylvain Benner & Contributors
;;
;; Author:  <acwat@ADAM-SURFACE>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `acw-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `acw-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `acw-org/pre-init-PACKAGE' and/or
;;   `acw-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst acw-org-packages
  '(org)
  "The list of Lisp packages required by the acw-org layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun acw-org/pre-init-org ()
  (setq org-default-notes-file (concat org-directory "/inbox.org")
        org-roam-directory (concat org-directory "/notes")
        org-roam-db-location (concat org-roam-directory "/db/org-roam.db")
        )
  )

(defun acw-org/post-init-org ()
  (setq org-adapt-indentation nil
        org-hide-leading-stars t
        org-odd-levels-only nil
        org-startup-indented t
        org-startup-folded t)

  (add-hook 'org-mode-hook #'(lambda ()
                               ;; make the lines in the buffer wrap around the edges of the screen.
                               ;; to press C-c q  or fill-paragraph ever again!
                               (visual-line-mode)
                               (org-indent-mode)))
  )


;;; packages.el ends here
