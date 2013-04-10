" Vim syntax file
" Language:    PressGang CCMS Content Specification
" Maintainer:  Jaromir Hradilek <jhradilek@gmail.com>
" Last Change: 10 April 2013
" Description: A syntax file for PressGang CCMS Content Specifications.

if exists('b:current_syntax') | finish | endif

setlocal iskeyword+=.
syn case match

syn keyword ccmsMetaKeyword Brand BZCOMPONENT BZPRODUCT BZURL contained
syn keyword ccmsMetaKeyword CHECKSUM Description DTD Edition ID contained
syn keyword ccmsMetaKeyword Product publican.cfg Subtitle Title contained
syn keyword ccmsMetaKeyword Type Version contained

syn match   ccmsTopicTitle       '\%(^\s*\)\@<=\S.*\%(\[\d\+\]\s*$\)\@=' contains=@Spell nextgroup=ccmsTopicID skipwhite
syn match   ccmsTopicID          '\[\d\+\]\%(\s*$\)\@=' contains=@NoSpell contained
syn match   ccmsContainerKeyword '\%(^\s*\)\@<=\(Part\|Chapter\|Section\|Appendix\|Process\):' contains=@NoSpell nextgroup=ccmsContainerTitle skipwhite
syn match   ccmsContainerTitle   '\S.*' contains=@Spell contained
syn match   ccmsMetaVariable     '\%(^\s*\)\@<=\S.*=\@=' contains=ccmsMetaKeyword,@NoSpell nextgroup=ccmsMetaValue skipwhite
syn match   ccmsMetaKeyword      '\%(Bug Links\|Copyright Holder\)' contains=@NoSpell contained 
syn region  ccmsMetaValue        matchgroup=ccmsMetaDelimiter start='=\s*' end='\s*$' contains=@Spell contained
syn region  ccmsMetaValue        matchgroup=ccmsMetaDelimiter start='=\s*\[\s*' end='\s*\]\s*$' contains=@Spell contained
syn match   ccmsComment          '\%(^\s*\)\@<=#.*' contains=@Spell

hi def link ccmsTopicTitle       String
hi def link ccmsTopicID          Identifier
hi def link ccmsContainerKeyword Type
hi def link ccmsContainerTitle   Title
hi def link ccmsMetaVariable     Identifier
hi def link ccmsMetaKeyword      Keyword
hi def link ccmsMetaValue        String
hi def link ccmsMetaDelimiter    Normal
hi def link ccmsComment          Comment

let b:current_syntax = 'contentspec'