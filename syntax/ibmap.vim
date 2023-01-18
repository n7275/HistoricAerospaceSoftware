" Vim Syntax File
" Language: IBM 7090/7094 Macro Assembly Program (MAP) Language
" Maintainer: Matthew W. Hume
" Latest Revision: 29 October 2021
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"Keywords
syn keyword ibmapPsudo USE
syn keyword ibmapPsudo BEGIN 
syn keyword ibmapPsudo ORG 
syn keyword ibmapPsudo BSS 
syn keyword ibmapPsudo BES
syn keyword ibmapPsudo EVEN
syn keyword ibmapPsudo LORG
syn keyword ibmapPsudo LDIR
syn keyword ibmapPsudo COMMON
syn keyword ibmapPsudo OCT
syn keyword ibmapPsudo DEC
syn keyword ibmapPsudo BCI
syn keyword ibmapPsudo VFD
syn keyword ibmapPsudo LIT
syn keyword ibmapPsudo DUP
syn keyword ibmapPsudo EQU
syn keyword ibmapPsudo NULL
syn keyword ibmapPsudo MAX
syn keyword ibmapPsudo MIN
syn keyword ibmapPsudo SET
syn keyword ibmapPsudo BOOL
syn keyword ibmapPsudo RBOOL LBOOL
syn keyword ibmapPsudo IFT IFF
syn keyword ibmapPsudo GOTO
syn keyword ibmapPsudo QUAL
syn keyword ibmapPsudo ENDQ
syn keyword ibmapPsudo CONTROL
syn keyword ibmapPsudo ENTRY
syn keyword ibmapPsudo FILE
syn keyword ibmapPsudo LABEL
syn keyword ibmapPsudo OPD
syn keyword ibmapPsudo OPVFD
syn keyword ibmapPsudo OPSYN
syn keyword ibmapPsudo END
syn keyword ibmapPsudo ETC
syn keyword ibmapPsudo REM
syn keyword ibmapPsudo KEEP
syn keyword ibmapPsudo ABS
syn keyword ibmapPsudo FUL
syn keyword ibmapPsudo PUNCH
syn keyword ibmapPsudo TDC
syn keyword ibmapPsudo PCC
syn keyword ibmapPsudo UNLIST
syn keyword ibmapPsudo LIST
syn keyword ibmapPsudo TITLE
syn keyword ibmapPsudo DETAIL
syn keyword ibmapPsudo EJECT
syn keyword ibmapPsudo SPACE
syn keyword ibmapPsudo LBL
syn keyword ibmapPsudo INDEX
syn keyword ibmapPsudo PMC
syn keyword ibmapPsudo TTL
syn keyword ibmapPsudo PCG
syn keyword ibmapPsudo CALL
syn keyword ibmapPsudo SAVE
syn keyword ibmapPsudo SAVEN
syn keyword ibmapPsudo RETURN
syn keyword ibmapPsudo MACRO
syn keyword ibmapPsudo ENDM
syn keyword ibmapPsudo NOCRS
syn keyword ibmapPsudo ORGCRS
syn keyword ibmapPsudo PURGE

syn keyword ibmap7090  ALC 
syn keyword ibmap7090  ADD
syn keyword ibmap7090  ADM
syn keyword ibmap7090  ALS
syn keyword ibmap7090  ANA
syn keyword ibmap7090  ANS
syn keyword ibmap7090  ARS
syn keyword ibmap7090  AXC
syn keyword ibmap7090  AXT
syn keyword ibmap7090  BSF
syn keyword ibmap7090  BSR
syn keyword ibmap7090  BTT
syn keyword ibmap7090  CAL
syn keyword ibmap7090  CAQ
syn keyword ibmap7090  CAS
syn keyword ibmap7090  CHS
syn keyword ibmap7090  CLA
syn keyword ibmap7090  CLM
syn keyword ibmap7090  CLS
syn keyword ibmap7090  COM
syn keyword ibmap7090  CRQ
syn keyword ibmap7090  CVR
syn keyword ibmap7090  DCT
syn keyword ibmap7090  DVH
syn keyword ibmap7090  DVP
syn keyword ibmap7090  ECTM
syn keyword ibmap7090  EFTM
syn keyword ibmap7090  ENB
syn keyword ibmap7090  ENK
syn keyword ibmap7090  ERA
syn keyword ibmap7090  ESNT
syn keyword ibmap7090  ESTM
syn keyword ibmap7090  ETM
syn keyword ibmap7090  ETT
syn keyword ibmap7090  FAD
syn keyword ibmap7090  FAM
syn keyword ibmap7090  FDH
syn keyword ibmap7090  FMP
syn keyword ibmap7090  FRN
syn keyword ibmap7090  FSB
syn keyword ibmap7090  FSM
syn keyword ibmap7090  HPR
syn keyword ibmap7090  HTR
syn keyword ibmap7090  IIA
syn keyword ibmap7090  IIL
syn keyword ibmap7090  IIR
syn keyword ibmap7090  IIS
syn keyword ibmap7090  IOT
syn keyword ibmap7090  IOCD
syn keyword ibmap7090  IOCP
syn keyword ibmap7090  IORP
syn keyword ibmap7090  IOCT
syn keyword ibmap7090  IORT
syn keyword ibmap7090  IOSP
syn keyword ibmap7090  IOST
syn keyword ibmap7090  LAC
syn keyword ibmap7090  LAS
syn keyword ibmap7090  LBT
syn keyword ibmap7090  LCHA LCHB LCHC LCHD LCHE LCHF LCHG LCHH
syn keyword ibmap7090  LDC
syn keyword ibmap7090  LDI
syn keyword ibmap7090  LDQ
syn keyword ibmap7090  LFT
syn keyword ibmap7090  LFTM
syn keyword ibmap7090  LGL
syn keyword ibmap7090  LGR
syn keyword ibmap7090  LLS
syn keyword ibmap7090  LNT
syn keyword ibmap7090  LRS
syn keyword ibmap7090  LSNM
syn keyword ibmap7090  LTM
syn keyword ibmap7090  LXA
syn keyword ibmap7090  LXD
syn keyword ibmap7090  MPR
syn keyword ibmap7090  MPY
syn keyword ibmap7090  MSE
syn keyword ibmap7090  NOP
syn keyword ibmap7090  NZT
syn keyword ibmap7090  OAI
syn keyword ibmap7090  OFT
syn keyword ibmap7090  ONT
syn keyword ibmap7090  ORA
syn keyword ibmap7090  ORS
syn keyword ibmap7090  OSI
syn keyword ibmap7090  PAC
syn keyword ibmap7090  PAI
syn keyword ibmap7090  PAX
syn keyword ibmap7090  PBT
syn keyword ibmap7090  PDC
syn keyword ibmap7090  PIA
syn keyword ibmap7090  PSE
syn keyword ibmap7090  PXA
syn keyword ibmap7090  PXD
syn keyword ibmap7090  RCHA RCHB RCHC RCHD RCHE RCHF RCHG RCHH
syn keyword ibmap7090  RDS
syn keyword ibmap7090  RDCA RDCB RDCC RDCD RDCE RDCF RDCG RDCH
syn keyword ibmap7090  RDS
syn keyword ibmap7090  REW
syn keyword ibmap7090  RFT
syn keyword ibmap7090  RIA
syn keyword ibmap7090  RIL
syn keyword ibmap7090  RIR
syn keyword ibmap7090  RIS
syn keyword ibmap7090  RND
syn keyword ibmap7090  RNT
syn keyword ibmap7090  RQL
syn keyword ibmap7090  RUN
syn keyword ibmap7090  SMB
syn keyword ibmap7090  SCHA SCHB SCHC SCHD SCHE SCHF SCHG SCHH
syn keyword ibmap7090  SND
syn keyword ibmap7090  SIL
syn keyword ibmap7090  SIR
syn keyword ibmap7090  SLQ
syn keyword ibmap7090  SLW
syn keyword ibmap7090  SSM
syn keyword ibmap7090  SSP
syn keyword ibmap7090  STA
syn keyword ibmap7090  STD
syn keyword ibmap7090  STI
syn keyword ibmap7090  STL
syn keyword ibmap7090  STO
syn keyword ibmap7090  STP
syn keyword ibmap7090  STQ
syn keyword ibmap7090  STR
syn keyword ibmap7090  STT
syn keyword ibmap7090  STZ
syn keyword ibmap7090  SUB
syn keyword ibmap7090  SXA
syn keyword ibmap7090  SXD
syn keyword ibmap7090  TCH
syn keyword ibmap7090  TCNA TCHB TCNC TCND TCHE TCNF TCNG TCNH
syn keyword ibmap7090  TCOA TCOB TCOC TCOD TCOE TCOF TCOG TCOH
syn keyword ibmap7090  TEFA TEFB TEFC TEFD TEFE TEFF TEFG TEFH
syn keyword ibmap7090  TIF
syn keyword ibmap7090  TIO
syn keyword ibmap7090  TIX
syn keyword ibmap7090  TLQTMI
syn keyword ibmap7090  TNO
syn keyword ibmap7090  TNX
syn keyword ibmap7090  TNZ
syn keyword ibmap7090  TOV
syn keyword ibmap7090  TPL
syn keyword ibmap7090  TQO
syn keyword ibmap7090  TQP
syn keyword ibmap7090  TRA
syn keyword ibmap7090  TRCA TRCB TRCC TRCD TRCE TRCF TRCG TRCH
syn keyword ibmap7090  TSX
syn keyword ibmap7090  TTR
syn keyword ibmap7090  TXH
syn keyword ibmap7090  TXI
syn keyword ibmap7090  TXL
syn keyword ibmap7090  TZE
syn keyword ibmap7090  UAM
syn keyword ibmap7090  UFA
syn keyword ibmap7090  UFM
syn keyword ibmap7090  UFS
syn keyword ibmap7090  USM
syn keyword ibmap7090  VDH
syn keyword ibmap7090  VDP
syn keyword ibmap7090  VLM
syn keyword ibmap7090  WEF
syn keyword ibmap7090  WRS
syn keyword ibmap7090  XCA
syn keyword ibmap7090  XCL
syn keyword ibmap7090  XEC
syn keyword ibmap7090  ZET


"Name
"syn match Name "^[A-Z][A-Z0-9][\.*]\|^\s[A-Z][A-Z0-9][\.*]"

syn region Name start="\%1c" end="\%7c"
"Comments
syn match IBSYSComment		"^\*.*"

"IBSYS Cards
syn match IBSYSCard		"^\$.*"

"Sequence Card Numbers
syn region SequenceNum  start="\%73c" end="\%81c"


syn region Variable  start="\%16c" end="\%72c"



" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_ibmap_syntax_inits")
  if version < 508
    let did_ibmap_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink SequenceNum		SpecialComment
  HiLink ibmapPsudo		String
  HiLink ibmap7090		Type
  HiLink Name			Statement
  HiLink IBSYSCard		PreProc
  HiLink IBSYSComment		Comment
  HiLink Variable		Include
  delcommand HiLink
endif

let b:current_syntax = "ibmap"
"
