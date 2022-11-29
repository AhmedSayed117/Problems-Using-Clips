(deftemplate gpa 
	(multislot info (type STRING)))

(defrule read-from-file
    (declare (salience 50))
  =>
    (open "infile3.txt" data "r")
    (bind ?data (readline data))
    (while (neq ?data EOF)
	   (assert (info (explode$ ?data)))
       (bind ?data (readline data)))
    (close data)
)

(defrule print
    (declare (salience 40))
	(info ?name ?X1 ?X2 ?X3 ?X4)
	
  =>
	(open "outfile3.txt" data "a")
    (printout t ?name "   (" ?X1" " ?X2" "?X3" "?X4 ")   "(/ (+ ?X1 ?X2 ?X3 ?X4 ) 4) crlf)
    (printout data ?name "   (" ?X1" " ?X2" "?X3" "?X4 ")   "(/ (+ ?X1 ?X2 ?X3 ?X4 ) 4) crlf)
	(close data))    