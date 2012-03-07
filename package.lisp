;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :srfi-97
  (:use)
  (:export
   :srfiload
   *included-srfis*
   :*omitted-srfis*))

(defpackage :srfi-97.internal
  (:use :srfi-97 :cl))
