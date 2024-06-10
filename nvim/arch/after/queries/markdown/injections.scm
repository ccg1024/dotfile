;extends

(fenced_code_block
  ((info_string) @_lang
    (#match? @_lang "(js)"))
  (code_fence_content) @javascript
)

(fenced_code_block
  ((info_string) @_lang
    (#match? @_lang "(jsx)"))
  (code_fence_content) @javascript
)

(fenced_code_block
  ((info_string) @_lang
    (#match? @_lang "(tsx)"))
  (code_fence_content) @typescript
)
