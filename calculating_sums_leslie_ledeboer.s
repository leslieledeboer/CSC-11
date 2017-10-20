// Calculating Sums
// Leslie Ledeboer

.global main

.section .rodata
    enter_message: .asciz "Enter a positive interger value: "
    sum_numbers_message: .asciz "The sum of the numbers is %d.\n\n"
    sum_squares_message: .asciz "The sum of the squares is %d.\n\n"
    input_string: .asciz "%d"
    new_line: .asciz "\n"

.section .data
    number: .word 0                   // the user's positive integer value
    sum_numbers: .word 0              // the sum of the numbers between 1 and number
    sum_squares: .word 0              // the sum of the squares between 1 and number

.section .text
    main:

        push {lr}                     // move link register to stack

    input_valid:
    
        ldr r0, =enter_message        // load enter_message into r0
        bl printf                     // print enter_message

        ldr r0, =input_string         // load input_string into r0
        ldr r1, =number               // load pointer to number into r1
        bl scanf                      // read input from user (number)

        ldr r0, =new_line             // load new_line into r0
        bl printf                     // print new_line

        ldr r4, =number               // load pointer to number into r4
        ldr r4, [r4]                  // load value of number into r4

        cmp r4, #1                    // compare number to the value 1

        blt input_valid               // branch to input_valid if number is less than the value 1

    end_input_valid:

        mov r0, #1                    // move the value 1 into r0

    calculate:

        cmp r0, r4                    // compare the value in r0 to number

        bgt end_calculate             // branch to end_calculate if the value in r0 is greater than number

        add r5, r0                    // add the value in r0 to the value in r5

        mul r6, r0, r0                // multiply r0 and r0, then store the value in r6

        add r7, r6                    // add the value in r6 to the value in r7

        add r0, #1                    // add the value 1 to the value in r0

        bal calculate                 // branch to calculate

    end_calculate:

        ldr r0, =sum_numbers_message  // load sum_numbers_message into r0
        mov r1, r5                    // move the sum of numbers into r1
        bl printf                     // print message with sum of numbers

        ldr r0, =sum_squares_message  // load sum_squares_message into r0
        mov r1, r7                    // move the sum of squares into r1
        bl printf                     // print message with sum of squares

        mov r0, #0                    // return 0

        pop {pc}                      // move link register to program counter