;;;; srfi-97.asd -*- Mode: Lisp;-*-

(cl:in-package :asdf)


(defsystem :srfi-97
  :version "20200226"
  :description "SRFI 97 for CL: SRFI Libraries"
  :long-description "SRFI 97 for CL: SRFI Libraries
https://srfi.schemers.org/srfi-97"
  :author "CHIBA Masaomi"
  :maintainer "CHIBA Masaomi"
  :serial t
  :components ((:file "package")
               (:file "srfi-97")))


(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-97))))
  (let ((name "https://github.com/g000001/srfi-97")
        (nickname :srfi-97))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))


;;; *EOF*
