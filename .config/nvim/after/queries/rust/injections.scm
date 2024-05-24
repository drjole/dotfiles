; extends

(macro_invocation
  (scoped_identifier
    path: (identifier) @path (#eq? @path "sqlx")
    name: (identifier) @name (#match? @name "^(query|query_as)$")
  )
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
      (#set! injection.language "sql")
    )
  )
)
