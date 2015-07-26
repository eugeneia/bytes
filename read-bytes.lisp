;;;; Macro around READ-BYTE and LDB to ease reading multibyte binary
;;;; strings.

(in-package :bytes)

(defmacro read-bytes (stream length)
  "→ _value_

   *Arguments and Values:*

   _stream_—a _binary input stream_.

   _length_—an {(integer 0 *)} denoting the number of octets to be read.

   _value_—an {(unsigned-byte} _n_{)} where _n_ is {(* 8} _length_{)}.

   *Description:*

   {read-bytes} reads _length_ octets from _stream_ and returns their
   little-endian unsigned _value_. _Length_ is evaluated during
   macro-expansion."
  (let ((g!stream (gensym "stream")))
    `(let ((integer 0)
	   (,g!stream ,stream))
       ,@(loop for n from 0 to (1- length) collect
	      `(setf (ldb (byte 8 ,(* n 8)) integer)
		     (read-byte ,g!stream)))
       integer)))
