let
    Source = Table.Combine({#"Discentes de Pós-Graduação", #"Discentes de EAD"}),
    #"Sorted Rows" = Table.Sort(Source,{{"ID_DISCENTE", Order.Ascending}})
in
    #"Sorted Rows"