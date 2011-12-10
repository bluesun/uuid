;;;; Author Boian Tzonev <boiantz@gmail.com>
;;;; 2007-2011, All Rights Reserved
;;;;
;;;; This software may be distributed and used according to the terms of the Lisp Lesser GNU Public License (LLGPL)
;;;; (http://opensource.franz.com/preamble.html).

;;;; this file contains the functions dependent on the libraries "ironclad" and "trivial-utf-8"

(cl:in-package :uuid)

(defun make-v3-uuid (namespace name)
  "Generates a version 3 (named based MD5) uuid."
  (format-v3or5-uuid
   (digest-uuid :md5 (uuid-to-byte-array namespace) name)
   3))

(defun make-v5-uuid (namespace name)
  "Generates a version 5 (name based SHA1) uuid."
  (format-v3or5-uuid
   (digest-uuid :sha1 (uuid-to-byte-array namespace) name)
   5))

(defun digest-uuid (digest uuid name)
  "Helper function that produces a digest from a namespace (a byte array) and a string. Used for the
generation of version 3 and 5 uuids."
  (let ((digester (ironclad:make-digest digest)))
    (ironclad:update-digest digester uuid)
    (ironclad:update-digest digester (trivial-utf-8:string-to-utf-8-bytes name))
    (ironclad:produce-digest digester)))