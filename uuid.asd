;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(defpackage #:uuid-asd
  (:use :cl :asdf))

(in-package :uuid-asd)

(defsystem uuid
  :name "uuid"
  :version "20-07-2011"
  :maintainer "Boian Tzonev"
  :author "Boian Tzonev"
  :licence "LLGPL"
  :description "UUID Generation"
  :long-description "Lisp implementation of rfc 4122"

  :serial t ;; the dependencies are linear.  
  
  ;; please add :uuid-without-dependencies to *features* to disable
  ;; the "ironclad" and "trivial-utf-8" dependencies. make-v3-uuid
  ;; (named based MD5) and make-v5-uuid (name based SHA1) will be
  ;; disabled
  :components ((:file "uuid")
	       #-uuid-without-dependencies (:file "uuid-with-dependencies"))
  #-uuid-without-dependencies :depends-on 
  #-uuid-without-dependencies ("ironclad" "trivial-utf-8"))

