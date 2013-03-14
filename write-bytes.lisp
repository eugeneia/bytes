;;;; Macro around WRITE-BYTE and LDB to ease writing multibyte binary
;;;; strings.

(in-package :bytes)

(defmacro write-bytes (o!integer length o!stream)
  "Write LENGTH octets from INTEGER to STREAM using LDB and WRITE-BYTE.
LENGTH is evaluated during macro-expansion. STREAM must be a binary
stream. Ordering is little-endian."
  (let ((g!integer (gensym "integer"))
	(g!stream (gensym  "stream")))
    `(let ((,g!integer ,integer)
	   (,g!stream ,stream))
       ,@(loop for n from 0 to (1- length) collect
	      `(write-byte (ldb (byte 8 ,(* n 8)) ,g!integer)
			   ,g!stream)))))
