;;;; srfi-97.asd -*- Mode: Lisp;-*-

(cl:in-package :asdf)

(defsystem :srfi-97
  :serial t
  :components ((:file "package")
               (:file "srfi-97")))

(defmethod perform ((o test-op) (c (eql (find-system :srfi-97))))
  (load-system :srfi-97)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :srfi-97.internal :srfi-97))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))
