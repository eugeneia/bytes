;;;; System definition for bytes.

(defpackage bytes-asd
  (:documentation
   "System definition for BYTES.")
  (:use :cl :asdf))

(in-package :bytes-asd)

(defsystem bytes
  :description
  "Macros around READ-WRITE, WRITE-BYTE and LDB to ease reading and
writing multibyte binary strings."
  :components ((:file "package")
	       (:file "read-bytes" :depends-on ("package"))
	       (:file "write-bytes" :depends-on ("package")))
  :depends-on ("defmacro!"))
