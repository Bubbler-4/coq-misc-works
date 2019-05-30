; copied from http://fuqcool.github.io/2014/05/install-emacs-package-from-cmd/

(require 'package)

; find package information from following archives
(setq package-archives '(
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(package-refresh-contents)

(mapcar (lambda (package)
          ; install package if not already installed
          (unless (package-installed-p package)
            (package-install package)))

        ; list of packages to be installed
        '(proof-general
          company-coq))
