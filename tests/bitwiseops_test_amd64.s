// +build amd64 !noasm !appengine

#include "textflag.h"

TEXT ·oruint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      a+0(FP), R14
        MOVBQZX      b+1(FP), R13
        MOVB         R13, R15
        ORQ          R14, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·anduint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      a+0(FP), R14
        MOVBQZX      b+1(FP), R13
        MOVB         R13, R15
        ANDB         R14, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·xoruint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      a+0(FP), R14
        MOVBQZX      b+1(FP), R13
        MOVB         R13, R15
        XORQ         R14, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·notuint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      a+0(FP), R15
        XORQ         $-1, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·andnotuint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      a+0(FP), R14
        MOVBQZX      b+1(FP), R13
        MOVB         R13, R15
        XORB         $-1, R15
        ANDB         R14, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·shluint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      x+0(FP), R14
        MOVBQZX      shift+1(FP), R13
        MOVB         R14, R15
        MOVB         R13, CX
        MOVL         $8, R14
        CMPB         R13, $8
        CMOVWCC      R14, CX
        MOVBQZX      CL, CX
        SHLB         CL, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·shruint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      x+0(FP), R14
        MOVBQZX      shift+1(FP), R13
        MOVB         R14, R15
        MOVB         R13, CX
        MOVL         $8, R14
        CMPB         R13, $8
        CMOVWCC      R14, CX
        MOVBQZX      CL, CX
        SHRB         CL, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·oruint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      a+0(FP), R14
        MOVWQZX      b+2(FP), R13
        MOVW         R13, R15
        ORQ          R14, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·anduint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      a+0(FP), R14
        MOVWQZX      b+2(FP), R13
        MOVW         R13, R15
        ANDW         R14, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·xoruint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      a+0(FP), R14
        MOVWQZX      b+2(FP), R13
        MOVW         R13, R15
        XORQ         R14, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·notuint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      a+0(FP), R15
        XORQ         $-1, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·andnotuint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      a+0(FP), R14
        MOVWQZX      b+2(FP), R13
        MOVW         R13, R15
        XORW         $-1, R15
        ANDW         R14, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·shluint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      x+0(FP), R14
        MOVBQZX      shift+2(FP), R13
        MOVW         R14, R15
        MOVW         R13, CX
        MOVL         $16, R14
        CMPB         R13, $16
        CMOVWCC      R14, CX
        MOVBQZX      CL, CX
        SHLW         CX, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·shruint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      x+0(FP), R14
        MOVBQZX      shift+2(FP), R13
        MOVW         R14, R15
        MOVW         R13, CX
        MOVL         $16, R14
        CMPB         R13, $16
        CMOVWCC      R14, CX
        MOVBQZX      CL, CX
        SHRW         CX, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·oruint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      a+0(FP), R14
        MOVLQZX      b+4(FP), R13
        MOVL         R13, R15
        ORQ          R14, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·anduint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      a+0(FP), R14
        MOVLQZX      b+4(FP), R13
        MOVL         R13, R15
        ANDL         R14, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·xoruint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      a+0(FP), R14
        MOVLQZX      b+4(FP), R13
        MOVL         R13, R15
        XORQ         R14, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·notuint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      a+0(FP), R15
        XORQ         $-1, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·andnotuint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      a+0(FP), R14
        MOVLQZX      b+4(FP), R13
        MOVL         R13, R15
        XORL         $-1, R15
        ANDL         R14, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·shluint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      x+0(FP), R14
        MOVBQZX      shift+4(FP), R13
        MOVL         R14, R15
        MOVL         R13, CX
        MOVL         $31, R14
        CMPB         R13, $32
        CMOVLCC      R14, CX
        MOVBQZX      CL, CX
        SHLL         CX, R15
        MOVL         $1, R14
        XORQ         CX, CX
        CMPB         R13, $32
        CMOVLCC      R14, CX
        MOVBQZX      CL, CX
        SHLL         CX, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·shruint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      x+0(FP), R14
        MOVBQZX      shift+4(FP), R13
        MOVL         R14, R15
        MOVL         R13, CX
        MOVL         $31, R14
        CMPB         R13, $32
        CMOVLCC      R14, CX
        MOVBQZX      CL, CX
        SHRL         CX, R15
        MOVL         $1, R14
        XORQ         CX, CX
        CMPB         R13, $32
        CMOVLCC      R14, CX
        MOVBQZX      CL, CX
        SHRL         CX, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·oruint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         a+0(FP), R14
        MOVQ         b+8(FP), R13
        MOVQ         R13, R15
        ORQ          R14, R15
        MOVQ         R15, ret0+16(FP)
        RET

TEXT ·anduint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         a+0(FP), R14
        MOVQ         b+8(FP), R13
        MOVQ         R13, R15
        ANDQ         R14, R15
        MOVQ         R15, ret0+16(FP)
        RET

TEXT ·xoruint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         a+0(FP), R14
        MOVQ         b+8(FP), R13
        MOVQ         R13, R15
        XORQ         R14, R15
        MOVQ         R15, ret0+16(FP)
        RET

TEXT ·notuint64s(SB),$16-16
        MOVQ         $0, ret0+8(FP)
block0:
        MOVQ         a+0(FP), R15
        XORQ         $-1, R15
        MOVQ         R15, ret0+8(FP)
        RET

TEXT ·andnotuint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         a+0(FP), R14
        MOVQ         b+8(FP), R13
        MOVQ         R13, R15
        XORQ         $-1, R15
        ANDQ         R14, R15
        MOVQ         R15, ret0+16(FP)
        RET

TEXT ·shluint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         x+0(FP), R14
        MOVBQZX      shift+8(FP), R13
        MOVQ         R14, R15
        MOVQ         R13, CX
        MOVL         $63, R14
        CMPB         R13, $64
        CMOVQCC      R14, CX
        MOVBQZX      CL, CX
        SHLQ         CX, R15
        MOVL         $1, R14
        XORQ         CX, CX
        CMPB         R13, $64
        CMOVQCC      R14, CX
        MOVBQZX      CL, CX
        SHLQ         CX, R15
        MOVQ         R15, ret0+16(FP)
        RET

TEXT ·shruint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         x+0(FP), R14
        MOVBQZX      shift+8(FP), R13
        MOVQ         R14, R15
        MOVQ         R13, CX
        MOVL         $63, R14
        CMPB         R13, $64
        CMOVQCC      R14, CX
        MOVBQZX      CL, CX
        SHRQ         CX, R15
        MOVL         $1, R14
        XORQ         CX, CX
        CMPB         R13, $64
        CMOVQCC      R14, CX
        MOVBQZX      CL, CX
        SHRQ         CX, R15
        MOVQ         R15, ret0+16(FP)
        RET

TEXT ·orint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      a+0(FP), R14
        MOVBQZX      b+1(FP), R13
        MOVB         R13, R15
        ORQ          R14, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·andint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      a+0(FP), R14
        MOVBQZX      b+1(FP), R13
        MOVB         R13, R15
        ANDB         R14, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·xorint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      a+0(FP), R14
        MOVBQZX      b+1(FP), R13
        MOVB         R13, R15
        XORQ         R14, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·notint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      a+0(FP), R15
        XORQ         $-1, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·andnotint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      a+0(FP), R14
        MOVBQZX      b+1(FP), R13
        MOVB         R13, R15
        XORB         $-1, R15
        ANDB         R14, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·shlint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      x+0(FP), R14
        MOVBQZX      shift+1(FP), R13
        MOVB         R14, R15
        MOVB         R13, CX
        MOVL         $8, R14
        CMPB         R13, $8
        CMOVWCC      R14, CX
        MOVBQZX      CL, CX
        SHLB         CL, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·shrint8s(SB),$8-9
        MOVB         $0, ret0+8(FP)
block0:
        MOVBQZX      x+0(FP), R14
        MOVBQZX      shift+1(FP), R13
        MOVB         R14, R15
        MOVB         R13, CX
        MOVL         $8, R14
        CMPB         R13, $8
        CMOVWCC      R14, CX
        MOVBQZX      CL, CX
        SARB         CL, R15
        MOVB         R15, ret0+8(FP)
        RET

TEXT ·orint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      a+0(FP), R14
        MOVWQZX      b+2(FP), R13
        MOVW         R13, R15
        ORQ          R14, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·andint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      a+0(FP), R14
        MOVWQZX      b+2(FP), R13
        MOVW         R13, R15
        ANDW         R14, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·xorint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      a+0(FP), R14
        MOVWQZX      b+2(FP), R13
        MOVW         R13, R15
        XORQ         R14, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·notint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      a+0(FP), R15
        XORQ         $-1, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·andnotint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      a+0(FP), R14
        MOVWQZX      b+2(FP), R13
        MOVW         R13, R15
        XORW         $-1, R15
        ANDW         R14, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·shlint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      x+0(FP), R14
        MOVBQZX      shift+2(FP), R13
        MOVW         R14, R15
        MOVW         R13, CX
        MOVL         $16, R14
        CMPB         R13, $16
        CMOVWCC      R14, CX
        MOVBQZX      CL, CX
        SHLW         CX, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·shrint16s(SB),$8-10
        MOVW         $0, ret0+8(FP)
block0:
        MOVWQZX      x+0(FP), R14
        MOVBQZX      shift+2(FP), R13
        MOVW         R14, R15
        MOVW         R13, CX
        MOVL         $16, R14
        CMPB         R13, $16
        CMOVWCC      R14, CX
        MOVBQZX      CL, CX
        SARW         CX, R15
        MOVW         R15, ret0+8(FP)
        RET

TEXT ·orint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      a+0(FP), R14
        MOVLQZX      b+4(FP), R13
        MOVL         R13, R15
        ORQ          R14, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·andint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      a+0(FP), R14
        MOVLQZX      b+4(FP), R13
        MOVL         R13, R15
        ANDL         R14, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·xorint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      a+0(FP), R14
        MOVLQZX      b+4(FP), R13
        MOVL         R13, R15
        XORQ         R14, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·notint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      a+0(FP), R15
        XORQ         $-1, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·andnotint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      a+0(FP), R14
        MOVLQZX      b+4(FP), R13
        MOVL         R13, R15
        XORL         $-1, R15
        ANDL         R14, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·shlint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      x+0(FP), R14
        MOVBQZX      shift+4(FP), R13
        MOVL         R14, R15
        MOVL         R13, CX
        MOVL         $31, R14
        CMPB         R13, $32
        CMOVLCC      R14, CX
        MOVBQZX      CL, CX
        SHLL         CX, R15
        MOVL         $1, R14
        XORQ         CX, CX
        CMPB         R13, $32
        CMOVLCC      R14, CX
        MOVBQZX      CL, CX
        SHLL         CX, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·shrint32s(SB),$8-12
        MOVL         $0, ret0+8(FP)
block0:
        MOVLQZX      x+0(FP), R14
        MOVBQZX      shift+4(FP), R13
        MOVL         R14, R15
        MOVL         R13, CX
        MOVL         $31, R14
        CMPB         R13, $32
        CMOVLCC      R14, CX
        MOVBQZX      CL, CX
        SARL         CX, R15
        MOVL         $1, R14
        XORQ         CX, CX
        CMPB         R13, $32
        CMOVLCC      R14, CX
        MOVBQZX      CL, CX
        SARL         CX, R15
        MOVL         R15, ret0+8(FP)
        RET

TEXT ·orint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         a+0(FP), R14
        MOVQ         b+8(FP), R13
        MOVQ         R13, R15
        ORQ          R14, R15
        MOVQ         R15, ret0+16(FP)
        RET

TEXT ·andint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         a+0(FP), R14
        MOVQ         b+8(FP), R13
        MOVQ         R13, R15
        ANDQ         R14, R15
        MOVQ         R15, ret0+16(FP)
        RET

TEXT ·xorint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         a+0(FP), R14
        MOVQ         b+8(FP), R13
        MOVQ         R13, R15
        XORQ         R14, R15
        MOVQ         R15, ret0+16(FP)
        RET

TEXT ·notint64s(SB),$16-16
        MOVQ         $0, ret0+8(FP)
block0:
        MOVQ         a+0(FP), R15
        XORQ         $-1, R15
        MOVQ         R15, ret0+8(FP)
        RET

TEXT ·andnotint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         a+0(FP), R14
        MOVQ         b+8(FP), R13
        MOVQ         R13, R15
        XORQ         $-1, R15
        ANDQ         R14, R15
        MOVQ         R15, ret0+16(FP)
        RET

TEXT ·shlint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         x+0(FP), R14
        MOVBQZX      shift+8(FP), R13
        MOVQ         R14, R15
        MOVQ         R13, CX
        MOVL         $63, R14
        CMPB         R13, $64
        CMOVQCC      R14, CX
        MOVBQZX      CL, CX
        SHLQ         CX, R15
        MOVL         $1, R14
        XORQ         CX, CX
        CMPB         R13, $64
        CMOVQCC      R14, CX
        MOVBQZX      CL, CX
        SHLQ         CX, R15
        MOVQ         R15, ret0+16(FP)
        RET

TEXT ·shrint64s(SB),$16-24
        MOVQ         $0, ret0+16(FP)
block0:
        MOVQ         x+0(FP), R14
        MOVBQZX      shift+8(FP), R13
        MOVQ         R14, R15
        MOVQ         R13, CX
        MOVL         $63, R14
        CMPB         R13, $64
        CMOVQCC      R14, CX
        MOVBQZX      CL, CX
        SARQ         CX, R15
        MOVL         $1, R14
        XORQ         CX, CX
        CMPB         R13, $64
        CMOVQCC      R14, CX
        MOVBQZX      CL, CX
        SARQ         CX, R15
        MOVQ         R15, ret0+16(FP)
        RET

