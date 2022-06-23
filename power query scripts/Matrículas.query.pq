let
    Source = Table.Combine({#"Matrículas de EAD", #"Matrículas de Pós-Graduação"}),
    #"Sorted Rows" = Table.Sort(Source,{{"ID_DISCENTE", Order.Ascending}})
in
    #"Sorted Rows"