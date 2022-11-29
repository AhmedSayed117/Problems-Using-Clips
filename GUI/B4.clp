(defclass Shape 
	(is-a USER) 
	(role abstract)
	(slot ID (type SYMBOL))
	(slot color (allowed-values red blue green yellow)))


(defclass Square
	(is-a Shape)
	(role concrete)
	(slot length (type NUMBER))
	(slot Area (type NUMBER))
	(slot Perimeters (type NUMBER)))


(defclass Rectangle
	(is-a Shape)
	(role concrete)
	(slot width (type NUMBER))
	(slot length (type NUMBER))
	(slot Area (type NUMBER))
	(slot Perimeters (type NUMBER)))
	

(definstances shapes 
	(s1 of Square (ID A)(color blue) (length 3)) 
	(r1 of Rectangle (ID C) (width 2) (length 5)))
	
	
(defmessage-handler Square calcArea () 
	(bind ?length(send ?self get-length))
	(bind ?Area (* ?length ?length)) 
	(send ?self put-Area ?Area))
	
	
(defmessage-handler Rectangle calcArea () 
	(bind ?length(send ?self get-length))
	(bind ?width(send ?self get-width))
	(bind ?Area (* ?length ?width)) 
	(send ?self put-Area ?Area))
	
	
(defmessage-handler Square calcPerimeters () 
	(bind ?length(send ?self get-length))
	(bind ?Perimeters (* ?length 4)) 
	(send ?self put-Perimeters ?Perimeters))
	
	
(defmessage-handler Rectangle calcPerimeters ()
	(bind ?length(send ?self get-length))
	(bind ?width(send ?self get-width))
	(bind ?Perimeters (*(+ ?length ?width) 2))
	(send ?self put-Perimeters ?Perimeters))
