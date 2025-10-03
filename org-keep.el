;; Agregar handler para request-file-content via advice
;; Advice added to org-roam-ui.el

(defun org-roam-ui--handle-file-content-request (data ws)
  "Send file content when requested from websocket DATA through WS."
  (let* ((file (alist-get 'file data))
         (node-id (alist-get 'nodeId data)))
    (when (and file (file-exists-p file))
      (let* ((node (org-roam-node-from-id node-id))
             (title (org-roam-node-title node))
             (content (with-temp-buffer
                        (insert-file-contents file)
                        (buffer-string))))
        (websocket-send-text ws
                             (json-encode
                              `((type . "file-content")
                                (content . ,content)
                                (title . ,title))))
        (message "Enviado contenido de: %s" title)))))

(defun org-roam-ui--ws-on-message-advice (orig-fun ws frame)
  "Advice para interceptar mensajes de request-file-content.
ORIG-FUN es la función original, WS el websocket, FRAME el mensaje."
  (let* ((msg (json-parse-string
               (websocket-frame-text frame) :object-type 'alist))
         (command (alist-get 'command msg))
         (data (alist-get 'data msg)))
    (if (string= command "request-file-content")
        (org-roam-ui--handle-file-content-request data ws)
      ;; Si no es request-file-content, llamar a la función original
      (funcall orig-fun ws frame))))

;; Aplicar el advice
(advice-add 'org-roam-ui--ws-on-message :around #'org-roam-ui--ws-on-message-advice)

;; Para remover el advice más tarde:
;; (advice-remove 'org-roam-ui--ws-on-message #'org-roam-ui--ws-on-message-advice)

(message "Advice aplicado a org-roam-ui--ws-on-message")