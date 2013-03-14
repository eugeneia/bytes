;;;; Package definitions for BYTES.

(defpackage :bytes
  (:documentation
   "Macros around READ-WRITE, WRITE-BYTE and LDB to ease reading and
writing multibyte binary strings.")
  (:use :cl)
  (:export :read-bytes
	   :write-bytes))
