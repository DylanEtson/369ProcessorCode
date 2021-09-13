.data	
list1:		.word		3, 9, 1, 2, 6, 3, -4, -7, -8, 4, -2,  8, 7, 6
.text 		# list1 is an array of integers storing the given sequence of values	 
.globl	tomato
tomato: 
addi	$sp, $sp, -8       
addi	$t0, $a0, -1       
sw  	$t0, 0($sp)        
sw  	$ra, 4($sp)        
bne 	$a0, $zero, orange   
li  	$v0, 0             
addi	$sp, $sp, 8        
jr 	$ra                  
orange:   
move  $a0, $t0            
jal   	tomato 
lw    	$t0, 0($sp)  
sll	$t1, $t0, 2  
add   	$t1, $t1, $a1     
lw    	$t2, 0($t1)       
add   	$v0, $v0, $t2     
lw    	$ra, 4($sp)                
addi 	$sp, $sp, 8        
jr 	$ra                  
# main function starts here                                            						
.globl main
main:	
    addi	$sp, $sp, -4	# Make space on stack
	sw	$ra, 0($sp)	# Save return address
	la	$a1, list1	# a1 has the base address pointing to the first 
# element of the “list1” array declared in .data section above
	li	$a0, 9		# loads the immediate value into the destination register
	jal	tomato	
return:	
li	$v0, 0			# Return value
	lw	$ra, 0($sp)		# Restore return address
	addi	$sp, $sp, 4		# Restore stack pointer
	jr 	$ra			# Return
# Step through this code in your simulator and monitor the register values. 
# What does the tomato function do?   
# Write your answer HERE 
	# The tomato function takes in an argument a0 and creates room in the stack
	# for that amount of elements and their return addresses and stores the first elements from list1
	# into the new array. This is because with each iteration of tomato, you create room
	# for two words in the stack by adding 8 to the stack pointer (4 for each word) and 
	# then store the value in a0 as well as the value in ra while decrementing a0 on each
	# call. The function stops being called when a0 == 0, which then proceeds to store the
	# actual values into the array that was created later on in the code. The tomato function exists so we can allocate an array of a specified
	# length in memory so we can use values from list1 in a computation.
