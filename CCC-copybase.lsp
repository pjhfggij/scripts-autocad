;Copy/Paste to original coordinates in any UCS
;www.cadforum.cz - 2012

;(command "_undefine" "_copyclip" "_undefine" "_copybase" "_undefine" "_pasteclip")

(defun c:ccc ( / ss )
 (defun *error* (msg) (command "_ucs" "_p")(setvar "cmdecho" 1)(princ (strcat "Err: " msg)))
 (setvar "cmdecho" 0)
 (setq ss (ssget "_I"))
 (command "_ucs" "")
 (if (not ss) (setq ss (ssget)))
 (if ss (progn (command "_.copybase" '(0 0 0) ss "")(princ "\nPaste with VVV")))
 (command "_ucs" "_p")
 (setvar "cmdecho" 1)
 (princ)
)

(defun c:ccx ( / ss )
 (defun *error* (msg) (command "_ucs" "_p")(setvar "cmdecho" 1)(princ (strcat "Err: " msg)))
 (setvar "cmdecho" 0)
 (setq ss (ssget "_I"))
 (command "_ucs" "")
 (if (not ss) (setq ss (ssget)))
 (if ss (progn (command "_.copybase" '(0 0 0) ss "")(princ "\nPaste with VVV")))
 (command "_ucs" "_p")
 (setvar "cmdecho" 1)
 (command "_.pselect" "_p" "")
 (command "_.erase")
 (princ)
)

(defun c:vvv ()
 (setvar "cmdecho" 0)
 (command "_ucs" "")
 (command "_.pasteclip" '(0 0 0))
 (command "_ucs" "_p")
 (setvar "cmdecho" 1)
 (princ)
)
 
(defun c:vvx ()
 (setvar "cmdecho" 0)
 (command "_ucs" "")
 (command "_.pasteclip" '(0 0 0))
 (command "_.pselect" "_p" "")
 (command "_.zoom" "o")
 (command "_ucs" "_p")
 (setvar "cmdecho" 1)
 (princ)
)

(princ "\nCopy/Paste orig in any UCS - use CCC and VVV commands")(princ)