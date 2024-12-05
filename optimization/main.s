	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 0
	.globl	_createNode                     ; -- Begin function createNode
	.p2align	2
_createNode:                            ; @createNode
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	w0, #24
	bl	_malloc
	cbz	x0, LBB0_2
; %bb.1:
	str	w19, [x0]
	stp	x0, x0, [x0, #8]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB0_2:
Lloh0:
	adrp	x0, l_str@PAGE
Lloh1:
	add	x0, x0, l_str@PAGEOFF
	bl	_puts
	mov	w0, #1
	bl	_exit
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_push                           ; -- Begin function push
	.p2align	2
_push:                                  ; @push
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x20, x1
	mov	x19, x0
	mov	w0, #24
	bl	_malloc
	cbz	x0, LBB1_4
; %bb.1:
	str	w20, [x0]
	stp	x0, x0, [x0, #8]
	ldr	x8, [x19]
	cbz	x8, LBB1_3
; %bb.2:
	ldr	x9, [x8, #8]
	stp	x9, x8, [x0, #8]
	str	x0, [x9, #16]
	ldr	x8, [x19]
	add	x19, x8, #8
LBB1_3:
	str	x0, [x19]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB1_4:
Lloh2:
	adrp	x0, l_str@PAGE
Lloh3:
	add	x0, x0, l_str@PAGEOFF
	bl	_puts
	mov	w0, #1
	bl	_exit
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.globl	_displayForward                 ; -- Begin function displayForward
	.p2align	2
_displayForward:                        ; @displayForward
	.cfi_startproc
; %bb.0:
	cbz	x0, LBB2_4
; %bb.1:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
Lloh4:
	adrp	x0, l_str.6@PAGE
Lloh5:
	add	x0, x0, l_str.6@PAGEOFF
	bl	_puts
Lloh6:
	adrp	x20, l_.str.3@PAGE
Lloh7:
	add	x20, x20, l_.str.3@PAGEOFF
	mov	x21, x19
LBB2_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [x21]
	str	x8, [sp]
	mov	x0, x20
	bl	_printf
	ldr	x21, [x21, #16]
	cmp	x21, x19
	b.ne	LBB2_2
; %bb.3:
	mov	w0, #10
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	b	_putchar
LBB2_4:
Lloh8:
	adrp	x0, l_str.7@PAGE
Lloh9:
	add	x0, x0, l_str.7@PAGEOFF
	b	_puts
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh8, Lloh9
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #160
	.cfi_def_cfa_offset 160
	stp	x28, x27, [sp, #64]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #80]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #96]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #112]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x19, #0
	mov	x21, #0
Lloh10:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh11:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh12:
	ldr	x8, [x8]
	str	x8, [sp, #56]
Lloh13:
	adrp	x20, l___const.main.moves@PAGE
Lloh14:
	add	x20, x20, l___const.main.moves@PAGEOFF
	add	x22, sp, #8
	b	LBB3_3
LBB3_1:                                 ;   in Loop: Header=BB3_3 Depth=1
	ldr	x8, [x21, #8]
	stp	x8, x21, [x0, #8]
	str	x0, [x8, #16]
	str	x0, [x21, #8]
LBB3_2:                                 ;   in Loop: Header=BB3_3 Depth=1
	str	wzr, [x22, x19]
	add	x19, x19, #4
	cmp	x19, #24
	b.eq	LBB3_6
LBB3_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w23, [x20, x19]
	mov	w0, #24
	bl	_malloc
	cbz	x0, LBB3_22
; %bb.4:                                ;   in Loop: Header=BB3_3 Depth=1
	str	w23, [x0]
	stp	x0, x0, [x0, #8]
	cbnz	x21, LBB3_1
; %bb.5:                                ;   in Loop: Header=BB3_3 Depth=1
	mov	x21, x0
	b	LBB3_2
LBB3_6:
	mov	x21, #0
	mov	w25, #0
	mov	w22, #1
	str	w22, [sp, #8]
	mov	w23, #21
	str	wzr, [sp, #32]
	add	x26, sp, #8
	mov	w27, #43691
	movk	w27, #43690, lsl #16
	mov	w28, #6
	add	x24, sp, #32
	mov	w19, #43691
	movk	w19, #10922, lsl #16
	b	LBB3_8
LBB3_7:                                 ;   in Loop: Header=BB3_8 Depth=1
	add	x21, x21, #1
	cmp	x21, #5
	b.eq	LBB3_18
LBB3_8:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_15 Depth 2
                                        ;     Child Loop BB3_16 Depth 2
                                        ;     Child Loop BB3_11 Depth 2
                                        ;     Child Loop BB3_12 Depth 2
	ldr	w8, [x20, w25, sxtw #2]
	lsr	x9, x23, x25
	tbnz	w9, #0, LBB3_14
; %bb.9:                                ;   in Loop: Header=BB3_8 Depth=1
	mov	x9, x25
	sxtw	x9, w9
	mov	w10, #42
	lsr	x9, x10, x9
	tbz	w9, #0, LBB3_12
; %bb.10:                               ;   in Loop: Header=BB3_8 Depth=1
	neg	w9, w8
	cmp	w9, #1
	csneg	w8, w22, w8, le
LBB3_11:                                ;   Parent Loop BB3_8 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w9, w25, #5
	umull	x10, w9, w27
	lsr	x10, x10, #34
	msub	w25, w10, w28, w9
	subs	w8, w8, #1
	b.ne	LBB3_11
LBB3_12:                                ;   Parent Loop BB3_8 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [x26, w25, sxtw #2]
	add	w9, w25, #5
	umull	x10, w9, w27
	lsr	x10, x10, #34
	msub	w9, w10, w28, w9
	cmp	w8, #0
	csel	w25, w25, w9, eq
	cbnz	w8, LBB3_12
; %bb.13:                               ;   in Loop: Header=BB3_8 Depth=1
	str	w22, [x26, w25, sxtw #2]
	add	x8, x24, x21, lsl #2
	str	w25, [x8, #4]
	b	LBB3_7
LBB3_14:                                ;   in Loop: Header=BB3_8 Depth=1
	cmp	w8, #1
	csinc	w8, w8, wzr, gt
LBB3_15:                                ;   Parent Loop BB3_8 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	add	w9, w25, #1
	smull	x10, w9, w19
	lsr	x11, x10, #63
	lsr	x10, x10, #32
	add	w10, w10, w11
	msub	w25, w10, w28, w9
	subs	w8, w8, #1
	b.ne	LBB3_15
LBB3_16:                                ;   Parent Loop BB3_8 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [x26, w25, sxtw #2]
	add	w9, w25, #1
	smull	x10, w9, w19
	lsr	x11, x10, #63
	lsr	x10, x10, #32
	add	w10, w10, w11
	msub	w9, w10, w28, w9
	cmp	w8, #0
	csel	w25, w25, w9, eq
	cbnz	w8, LBB3_16
; %bb.17:                               ;   in Loop: Header=BB3_8 Depth=1
	str	w22, [x26, w25, sxtw #2]
	add	x8, x24, x21, lsl #2
	str	w25, [x8, #4]
	add	w8, w25, #1
	str	x8, [sp]
Lloh15:
	adrp	x0, l_.str.5@PAGE
Lloh16:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	b	LBB3_7
LBB3_18:
	mov	x20, #0
	add	x21, sp, #32
Lloh17:
	adrp	x19, l_.str.3@PAGE
Lloh18:
	add	x19, x19, l_.str.3@PAGEOFF
LBB3_19:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [x21, x20]
	add	w8, w8, #1
	str	x8, [sp]
	mov	x0, x19
	bl	_printf
	add	x20, x20, #4
	cmp	x20, #24
	b.ne	LBB3_19
; %bb.20:
	ldr	x8, [sp, #56]
Lloh19:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh20:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh21:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB3_23
; %bb.21:
	mov	w0, #0
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #80]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
LBB3_22:
Lloh22:
	adrp	x0, l_str@PAGE
Lloh23:
	add	x0, x0, l_str@PAGEOFF
	bl	_puts
	mov	w0, #1
	bl	_exit
LBB3_23:
	bl	___stack_chk_fail
	.loh AdrpAdd	Lloh13, Lloh14
	.loh AdrpLdrGotLdr	Lloh10, Lloh11, Lloh12
	.loh AdrpAdd	Lloh15, Lloh16
	.loh AdrpAdd	Lloh17, Lloh18
	.loh AdrpLdrGotLdr	Lloh19, Lloh20, Lloh21
	.loh AdrpAdd	Lloh22, Lloh23
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str.3:                               ; @.str.3
	.asciz	"%d "

	.section	__TEXT,__const
	.p2align	2, 0x0                          ; @__const.main.moves
l___const.main.moves:
	.long	2                               ; 0x2
	.long	4294967295                      ; 0xffffffff
	.long	3                               ; 0x3
	.long	4294967295                      ; 0xffffffff
	.long	2                               ; 0x2
	.long	4294967295                      ; 0xffffffff

	.section	__TEXT,__cstring,cstring_literals
l_.str.5:                               ; @.str.5
	.asciz	"?! %d\n"

l_str:                                  ; @str
	.asciz	"\353\251\224\353\252\250\353\246\254 \355\225\240\353\213\271 \354\213\244\355\214\250"

l_str.6:                                ; @str.6
	.asciz	"\354\225\236\354\227\220\354\204\234\353\266\200\355\204\260 \354\266\234\353\240\245:"

l_str.7:                                ; @str.7
	.asciz	"\353\246\254\354\212\244\355\212\270\352\260\200 \353\271\204\354\226\264 \354\236\210\354\212\265\353\213\210\353\213\244."

.subsections_via_symbols
