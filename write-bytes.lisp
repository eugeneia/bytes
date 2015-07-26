;;;; Macro around WRITE-BYTE and LDB to ease writing multibyte binary
;;;; strings.

(in-package :bytes)

(defmacro write-bytes (integer length stream)
  "*Arguments and Values:*

   _integer_—an {(unsigned-byte} _n_{)} where _n_ is {(* 8} _length_{)}.

   _length_—an {(integer 0 *)} denoting the number of octets to be
   written.

   _stream_—a _binary output stream_.

   *Description:*

   {write-bytes} writes _integer_ to _stream_, represented as _length_
   octets in little-endian order. _Length_ is evaluated during
   macro-expansion."
  (let ((g!integer (gensym "integer"))
	(g!stream (gensym  "stream")))
    `(let ((,g!integer ,integer)
	   (,g!stream ,stream))
       ,@(loop for n from 0 to (1- length) collect
	      `(write-byte (ldb (byte 8 ,(* n 8)) ,g!integer)
			   ,g!stream)))))
