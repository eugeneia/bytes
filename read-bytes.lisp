;;;; Macro around READ-BYTE and LDB to ease reading multibyte binary
;;;; strings.

(in-package :bytes)

(defmacro! read-bytes (o!stream length)
  "Read and return integer consisting of LENGTH octets from STREAM using
READ-BYTE and LDB. LENGTH is evaluated during macro-expansion. STREAM
must be a binary stream. Ordering is little-endian."
  `(let ((integer 0))
     ,@(loop for n from 0 to (1- length) collect
	    `(setf (ldb (byte 8 ,(* n 8)) integer)
		   (read-byte ,g!stream)))
     integer))