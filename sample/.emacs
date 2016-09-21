(prefer-coding-system 'utf-8)
(require 'package)
(require 'cl)
(require 'server)

;; env
(defconst +PORT+ 5678)
(defconst +HOST+ "0.0.0.0"))

(defvar *dependencies* '(
                         elnode
                         ))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)
(package-refresh-contents)

(dolist (dependency *dependencies*)
  (unless (package-installed-p dependency)
    (package-install dependency))
    (require dependency))

;; elnode's env
(server-start)
(require 'elnode)
(setq elnode-init-port nil)
(setq elnode--do-error-logging nil)
(setq elnode-log-files-directory nil)

;; users code
(defun handler (con)
  (elnode-http-start con 200 '("Content-Type" . "text/html"))
  (elnode-http-return con
                      (print 
"<html>
  <head>
    <title>web app sample</title>
  </head>
  <body>web app sample</body>
</html>")))

(elnode-start 'handler :port +PORT+ :host +HOST+)
