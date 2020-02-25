;;;; package.lisp

(cl:in-package :cl-user)


(defpackage "https://github.com/g000001/srfi-97"
  (:use)
  (:export
   srfiload
   *included-srfis*
   *omitted-srfis*))


(defpackage "https://github.com/g000001/srfi-97#internals"
  (:use "https://github.com/g000001/srfi-97"
        cl))


;;; *EOF*
