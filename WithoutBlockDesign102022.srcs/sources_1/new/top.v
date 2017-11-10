//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
//Date        : Fri Nov 10 02:03:20 2017
//Host        : DESKTOP-5Q0ADMK running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module top
   ();

  wire [3:0]ALUControl_0_ALUControl;
  wire [31:0]ALU_0_ALU_Output_Result;
  wire ALU_0_ALU_Output_Sign;
  wire ALU_0_ALU_Output_Zero;
  wire [31:0]Add32_0_Add_Output;
  wire [31:0]Add32_With_4_0_Add_With_4_Output;
  wire BranchConctrol_0_Output_Exec_Branch;
  wire [3:0]Control_0_ALUOp;
  wire Control_0_ALUSrc;
  wire [3:0]Control_0_Branch;
  wire Control_0_Jump;
  wire Control_0_MemRead;
  wire Control_0_MemWrite;
  wire Control_0_MemtoReg;
  wire Control_0_RegDst;
  wire Control_0_RegWrite;
  wire Control_0_Clear;
  wire Control_0_PCWrite;
  wire Control_0_ZeroExt;
  wire [31:0]DataMem_0_Read_Data;
  wire [31:0]InstrMem_0_Instr;
  wire [31:0]JumpAddrGen_0_JumpAddr;
  wire [31:0]Mux32_0_Mul_Output;
  wire [31:0]Mux32_1_Mul_Output;
  wire [31:0]Mux32_2_Mul_Output;
  wire [31:0]Mux32_3_Mul_Output;
  wire [31:0]Mux32_4_Mul_Output;
  wire [31:0]PC_0_This_IP;
  wire [31:0]RegFile_0_Read_Data_1;
  wire [31:0]RegFile_0_Read_Data_2;
  wire [31:0]ShiftLeft2_0_Output;
  wire [31:0]ShiftLeft2_1_Output;
  wire [31:0]SignExt_0_Output_32;

  ALUControl ALUControl_0
       (.ALUControl(ALUControl_0_ALUControl),
        .ALUOp_in(Control_0_ALUOp),
        .Func(InstrMem_0_Instr[5:0]));
  ALU ALU_0
       (.ALU_Control_in(ALUControl_0_ALUControl),
        .ALU_Input_1(RegFile_0_Read_Data_1),
        .ALU_Input_2(Mux32_0_Mul_Output),
        .ALU_Output_Result(ALU_0_ALU_Output_Result),
        .ALU_Output_Sign(ALU_0_ALU_Output_Sign),
        .ALU_Output_Zero(ALU_0_ALU_Output_Zero));
  Add32 Add32_0
       (.Add_Input_1(Add32_With_4_0_Add_With_4_Output),
        .Add_Input_2(ShiftLeft2_1_Output),
        .Add_Output(Add32_0_Add_Output));
  Add32_With_4 Add32_With_4_0
       (.Add_With_4_Input(PC_0_This_IP),
        .Add_With_4_Output(Add32_With_4_0_Add_With_4_Output));
  BranchControl BranchConctrol_0
       (.BranchControl_Input_Type(Control_0_Branch),
        .Sign_in(ALU_0_ALU_Output_Sign),
        .Zero_in(ALU_0_ALU_Output_Zero),
        .BranchControl_Output_Exec_Branch(BranchConctrol_0_Output_Exec_Branch));
  Control Control_0
       (.ALUOp(Control_0_ALUOp),
        .ALUSrc(Control_0_ALUSrc),
        .Branch(Control_0_Branch),
        .Instr(InstrMem_0_Instr[31:26]),
        .Jump(Control_0_Jump),
        .MemRead(Control_0_MemRead),
        .MemWrite(Control_0_MemWrite),
        .MemtoReg(Control_0_MemtoReg),
        .RegDst(Control_0_RegDst),
        .RegWrite(Control_0_RegWrite),
        .PCWrite(Control_0_PCWrite),
        .ZeroExt(Control_0_ZeroExt));
  DataMem DataMem_0
       (.Addr(ALU_0_ALU_Output_Result),
        .MemRead_in(Control_0_MemRead),
        .MemWrite_in(Control_0_MemWrite),
        .Read_Data(DataMem_0_Read_Data),
        .Write_Data(RegFile_0_Read_Data_2));
  InstrMem InstrMem_0
       (.Instr(InstrMem_0_Instr),
        .ReadAddr(PC_0_This_IP));
  JumpAddrGen JumpAddrGen_0
       (.Instr_27_2(ShiftLeft2_0_Output[27:2]),
        .JumpAddr(JumpAddrGen_0_JumpAddr),
        .PC_Plus_31_28(Add32_With_4_0_Add_With_4_Output[31:28]));
  Mux32 Mux32_0
       (.Mul_Output(Mux32_0_Mul_Output),
        .Mul_Sel(Control_0_ALUSrc),
        .Mux_Input_1(RegFile_0_Read_Data_2),
        .Mux_Input_2(SignExt_0_Output_32));
  Mux32 Mux32_1
       (.Mul_Output(Mux32_1_Mul_Output),
        .Mul_Sel(Control_0_RegDst),
        .Mux_Input_1(InstrMem_0_Instr[20:16]),
        .Mux_Input_2(InstrMem_0_Instr[15:11]));
  Mux32 Mux32_2
       (.Mul_Output(Mux32_2_Mul_Output),
        .Mul_Sel(BranchConctrol_0_Output_Exec_Branch),
        .Mux_Input_1(Add32_With_4_0_Add_With_4_Output),
        .Mux_Input_2(Add32_0_Add_Output));
  Mux32 Mux32_3
       (.Mul_Output(Mux32_3_Mul_Output),
        .Mul_Sel(Control_0_Jump),
        .Mux_Input_1(Mux32_2_Mul_Output),
        .Mux_Input_2(JumpAddrGen_0_JumpAddr));
  Mux32 Mux32_4
       (.Mul_Output(Mux32_4_Mul_Output),
        .Mul_Sel(Control_0_MemtoReg),
        .Mux_Input_1(Add32_0_Add_Output),
        .Mux_Input_2(DataMem_0_Read_Data));
  PC PC_0
       (.Next_IP(Mux32_3_Mul_Output),
        .This_IP(PC_0_This_IP));
  RegFile RegFile_0
       (.Read_Data_1(RegFile_0_Read_Data_1),
        .Read_Data_2(RegFile_0_Read_Data_2),
        .Read_Reg_1(InstrMem_0_Instr[25:21]),
        .Read_Reg_2(InstrMem_0_Instr[20:16]),
        .RegWrite_in(Control_0_RegWrite),
        .Write_Data(Mux32_4_Mul_Output),
        .Write_Reg(Mux32_1_Mul_Output[4:0]));
  ShiftLeft2 ShiftLeft2_0
       (.SL2_Input(InstrMem_0_Instr[25:0]),
        .SL2_Output(ShiftLeft2_0_Output));
  ShiftLeft2 ShiftLeft2_1
       (.SL2_Input(SignExt_0_Output_32),
        .SL2_Output(ShiftLeft2_1_Output));
  SignExt SignExt_0
       (.Input_16(InstrMem_0_Instr[15:0]),
        .Output_32(SignExt_0_Output_32));
endmodule
