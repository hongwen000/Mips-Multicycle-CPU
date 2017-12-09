`define	OP_RTPYE	000000
`define	OP_BEQ	    000100
`define	OP_BNE	    000101
`define	OP_BGTZ	    000111
`define	OP_ADDI	    001000
`define	OP_ORI	    001101
`define	OP_LW	    100011
`define	OP_SW	    101011
`define	OP_J	    000010
`define	OP_JAL	    000011
`define	OP_HALT	    111111

`define	FUNCT_ADD	100000
`define	FUNCT_SUB	100010
`define	FUNCT_AND	100100
`define	FUNCT_OR	100101
`define	FUNCT_SLL	000000
`define	FUNCT_SLT	101010
`define	FUNCT_JR	001000

`define CONTROL_SINGLES RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt

