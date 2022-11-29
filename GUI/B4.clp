(defclass Shape 
	(is-a USER) 
	(role concrete)
	(slot ID (type SYMBOL))
	(slot color (allowed-values red blue green yellow)))


(defclass Square 
	(is-a Shape)
	(slot length))
	

(defclass Rectangle 
	(is-a Shape)
	(slot width)
	(slot length))
	

(definstances shapes 
	(s1 of Square (ID A)(color blue) (length 3)) 
	(r1 of Rectangle (ID C) (width 2) (length 5)))
	
	
(defmessage-handler Square calcArea () 
	(bind ?length(send ?self get-length))
	(bind ?Area (* ?length ?length)) 
	(send ?self put-length ?Area))
	
	
(defmessage-handler Rectangle calcArea () 
	(bind ?length(send ?self get-length))
	(bind ?width(send ?self get-width))
	(bind ?Area (* ?length ?width)) 
	(send ?self put-length ?Area))

