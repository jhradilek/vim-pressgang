" Vim syntax file
" Language:    PressGang CCMS Content Spec
" Maintainer:  Jaromir Hradilek <jhradilek@gmail.com>
" Last Change: 18 April 2013
" Description: A syntax file for PressGang CCMS Content Spec

if exists('b:current_syntax') | finish | endif

setlocal iskeyword+=.
syn case match

syn match   ccmsTopicTitle       '\%(^\s*\)\@<=\S.\{-}\%(\s*\[[^\]]*\]\)\@=' nextgroup=ccmsTopicID,ccmsTopicNew,ccmsTopicNewRef contains=@Spell skipwhite
syn region  ccmsTopicID          contained matchgroup=ccmsDelimiter start='\[\%(\d\+[,\]]\)\@=' end='\]' nextgroup=ccmsTopicPrereq,ccmsTopicRelation,ccmsTopicTarget contains=@Spell skipwhite
syn region  ccmsTopicNew         contained matchgroup=ccmsDelimiter start='\[\%(N\d*,\s*\%(Concept\|Task\|Reference\)[,\]]\)\@=' end='\]' nextgroup=ccmsTopicPrereq,ccmsTopicRelation,ccmsTopicTarget contains=@Spell skipwhite
syn region  ccmsTopicNewRef      contained matchgroup=ccmsDelimiter start='\[\%(X\d\+\]\)\@=' end='\]' nextgroup=ccmsTopicPrereq,ccmsTopicRelation,ccmsTopicTarget contains=@NoSpell skipwhite
syn region  ccmsTopicPrereq      contained matchgroup=ccmsDelimiter start='\[\%(P:\)\@=' end='\]' nextgroup=ccmsTopicRelation,ccmsTopicTarget contains=@NoSpell skipwhite
syn region  ccmsTopicRelation    contained matchgroup=ccmsDelimiter start='\[\%(R:\|Refer-to:\)\@=' end='\]' nextgroup=ccmsTopicPrereq,ccmsTopicTarget contains=ccmsTopicID,@NoSpell skipwhite
syn region  ccmsTopicTarget      contained matchgroup=ccmsDelimiter start='\[\%(T\)\@=' end='\]' nextgroup=ccmsTopicPrereq,ccmsTopicRelation contains=@NoSpell skipwhite

syn match   ccmsContainerKeyword '\%(^\s*\)\@<=\(Appendix\|Chapter\|Part\|Preface\|Process\|Section\):' nextgroup=ccmsContainerTitle contains=@NoSpell skipwhite
syn match   ccmsContainerTitle   contained '\S[^\[]*' nextgroup=ccmsContainerTarget,ccmsTopicID,ccmsTopicNew,ccmsTopicNewRef contains=@Spell skipwhite
syn region  ccmsContainerTarget  contained matchgroup=ccmsDelimiter start='\[\%(T\)\@=' end='\]' contains=@NoSpell skipwhite

syn match   ccmsMetaVariable     '\%(^\s*\)\@<=\k\%(\s\|\k\)\{-}\%(\s*=\)\@=' nextgroup=ccmsMetaValue contains=ccmsMetaKeyword,@NoSpell skipwhite

syn case ignore
syn keyword ccmsMetaKeyword      contained Abstract Brand BZComponent BZProduct BZURL BZVersion CHECKSUM DTD Edition Feedback ID Product publican.cfg Pubsnumber Subtitle Title Type Version
syn match   ccmsMetaKeyword      contained '\%(Book Version\|Bug Links\|Copyright Holder\|Copyright Year\|Inline Injection\|Legal Notice\|Revision History\|Survey Links\)' contains=@NoSpell
syn case match

syn region  ccmsMetaValue        contained matchgroup=ccmsNormal start='=\s*' end='\s*$' contains=@Spell,ccmsMetaMultiline,ccmsMetaChecksum
syn region  ccmsMetaMultiline    contained matchgroup=ccmsDelimiter start='\%(=\s*\)\@<=\[' end='\]' contains=@Spell
syn match   ccmsMetaChecksum     contained '[0-9a-fA-F]\{32\}' contains=@NoSpell

syn region  ccmsGlobalTags       matchgroup=ccmsDelimiter start='\%(^\s*\)\@<=\[' end='\]' contains=@Spell skipwhite

syn match   ccmsComment          '\%(^\s*\)\@<=#.*' contains=@Spell,ccmsTodo
syn keyword ccmsTodo             contained FIXME TODO XXX

hi def link ccmsNormal           Normal
hi def link ccmsDelimiter        Delimiter
hi def link ccmsTopicTitle       String
hi def link ccmsTopicID          Identifier
hi def link ccmsTopicNew         Identifier
hi def link ccmsTopicNewRef      Identifier
hi def link ccmsTopicPrereq      Identifier
hi def link ccmsTopicRelation    Identifier
hi def link ccmsTopicTarget      Identifier
hi def link ccmsContainerKeyword Type
hi def link ccmsContainerTitle   Title
hi def link ccmsContainerTarget  Identifier
hi def link ccmsMetaVariable     Identifier
hi def link ccmsMetaKeyword      Keyword
hi def link ccmsMetaValue        String
hi def link ccmsMetaMultiline    String
hi def link ccmsMetaChecksum     Special
hi def link ccmsGlobalTags       String
hi def link ccmsComment          Comment
hi def link ccmsTodo             Todo

let b:current_syntax = 'contentspec'
