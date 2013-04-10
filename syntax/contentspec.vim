" Vim syntax file
" Language:    PressGang CCMS Content Spec
" Maintainer:  Jaromir Hradilek <jhradilek@gmail.com>
" Last Change: 10 April 2013
" Description: A syntax file for PressGang CCMS Content Spec

if exists('b:current_syntax') | finish | endif

setlocal iskeyword+=.
syn case match

syn keyword ccmsMetaKeyword Brand BZCOMPONENT BZPRODUCT BZURL contained
syn keyword ccmsMetaKeyword CHECKSUM Description DTD Edition ID contained
syn keyword ccmsMetaKeyword Product publican.cfg Subtitle Title contained
syn keyword ccmsMetaKeyword Type Version contained

syn match   ccmsTopicTitle       '\%(^\s*\)\@<=\S.\{-}\%(\s*\[\d\+\]\s*$\)\@=' contains=@Spell nextgroup=ccmsTopicID skipwhite
syn match   ccmsTopicID          '\[\d\+\]\%(\s*$\)\@=' contains=@NoSpell contained
syn match   ccmsContainerKeyword '\%(^\s*\)\@<=\(Part\|Chapter\|Section\|Appendix\|Process\):' contains=@NoSpell nextgroup=ccmsContainerTitle skipwhite
syn match   ccmsContainerTitle   '\S.*' contains=@Spell contained
syn match   ccmsMetaVariable     '\%(^\s*\)\@<=\S.\{-}\%(\s*=\)\@=' contains=ccmsMetaKeyword,@NoSpell nextgroup=ccmsMetaValue skipwhite
syn match   ccmsMetaKeyword      '\%(Bug Links\|Copyright Holder\)' contains=@NoSpell contained 
syn region  ccmsMetaValue        matchgroup=ccmsNormal start='=\s*' end='\s*$' contains=@Spell,ccmsMetaMultiline,ccmsMetaChecksum contained
syn region  ccmsMetaMultiline    matchgroup=ccmsDelimiter start='\%(=\s*\)\@<=\[\s*' end='\s*\]\s*' contains=@Spell contained
syn match   ccmsMetaChecksum     '[0-9a-fA-F]\{32\}' contains=@NoSpell contained
syn match   ccmsComment          '\%(^\s*\)\@<=#.*' contains=@Spell

hi def link ccmsNormal           Normal
hi def link ccmsDelimiter        Delimiter
hi def link ccmsTopicTitle       String
hi def link ccmsTopicID          Identifier
hi def link ccmsContainerKeyword Type
hi def link ccmsContainerTitle   Title
hi def link ccmsMetaVariable     Identifier
hi def link ccmsMetaKeyword      Keyword
hi def link ccmsMetaValue        String
hi def link ccmsMetaMultiline    String
hi def link ccmsMetaChecksum     Special
hi def link ccmsComment          Comment

let b:current_syntax = 'contentspec'
