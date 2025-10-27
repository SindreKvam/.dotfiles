; extends
; Generics → highlight identifiers declared in port clauses
(
  generic_clause
  (interface_list
    (interface_declaration
      (identifier_list
        (identifier) @generic)))
)
; Ports → highlight identifiers declared in port clauses
(
  port_clause
  (interface_list
    (interface_declaration
      (identifier_list
        (identifier) @port)))
)
