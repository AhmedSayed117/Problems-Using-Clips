(deftemplate gpa 
	(multislot info (type STRING)))

;read Line By Line from file
(defrule read-from-file
    (declare (salience 50))
=>
    (open "infile3.txt" data "r")
    (bind ?data (readline data))
    (while (neq ?data EOF)
	   (assert (info (explode$ ?data)))
       (bind ?data (readline data)))
    (close data))
	
;Calculate GPA
(defrule Calculate-GPA
    (declare (salience 40))
	(info ?name ?X1 ?X2 ?X3 ?X4)
=>
	(open "outfile3.txt" data "a")
    (printout data ?name "   (" ?X1" " ?X2" "?X3" "?X4 ")   "(/ (+ ?X1 ?X2 ?X3 ?X4 ) 4) crlf)
	(close data))    