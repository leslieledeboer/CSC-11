// Two Integers
// Leslie Ledeboer

.global main

.section .rodata
    hello_msg: .asciz "Hello! Welcome to Two Integers.\n\n"
    enter_msg_1: .asciz "Enter an integer for the first number: "
    enter_msg_2: .asciz "Enter an integer for the second number: "
    sum_msg: .asciz "The sum of %d and %d is %d.\n\n"
    difference_msg: .asciz "The difference of %d and %d is %d.\n\n"
    product_msg: .asciz "The product of %d and %d is %d.\n\n"
    input_strng: .asciz "%d"

.section .rodata
    number_1: .word 0
    number_2: .word 0
    sum: .word 0
    difference: .word 0
    product: .word 0

.section .text
    main:
        push {lr}

        ldr r0, =hello_msg
        bl printf

        ldr r0, =enter_msg_1
        bl printf

        ldr r0, =input_strng
        ldr r1, =number_1
        bl scanf

        ldr r0, =enter_msg_2
        bl printf

        ldr r0, =input_strng
        ldr r1, =number_2
        bl scanf

        ldr r0, =number_1
        ldr r0, [r0]
        ldr r1, =number_2
        ldr r1, [r1]

        add r2, r0, r1

        ldr r3, =sum
        str r2, r3

        sub r2, r1, r0

        ldr r3, =difference
        str r2, r3

        mul r2, r0, r1

        ldr r3, =product
        str r2, r3
        
        ldr r0, =sum_msg
        ldr r1, =number_1
        ldr r1, [r1]
        ldr r2, =number_2
        ldr r2, [r2]
        ldr r3, =sum
        ldr r3, [r3]
        bl printf

        ldr r0, =difference_msg
        ldr r1, =number_2
        ldr r1, [r1]
        ldr r2, =number_1
        ldr r2, [r2]
        ldr r3, =difference
        ldr r3, [r3]
        bl printf

        ldr r0, =product_msg
        ldr r1, =number_1
        ldr r1, [r1]
        ldr r2, =number_2
        ldr r2, [r2]
        ldr r3, =product
        ldr r3, [r3]
        bl printf

        mov r0, #0
        
        pop {pc}