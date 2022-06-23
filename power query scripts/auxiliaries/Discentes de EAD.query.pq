let
    Source = Table.Combine({#"mat-ead-2020", #"mat-ead-2021", #"mat-ead-2019", #"mat-ead-2018"}),
    #"Removed Columns" = Table.RemoveColumns(Source,{"Column1", "Column2", "Column3", "Column4", "Column5", "Column6", "Column7", "Column8", "Column9", "Column10", "Column11", "Column12", "Column13", "Column14", "Column15", "Column16"}),
    #"Filtered Rows" = Table.SelectRows(#"Removed Columns", each [ID_DISCENTE] <> null and [ID_DISCENTE] <> ""),
    #"Sorted Rows" = Table.Sort(#"Filtered Rows",{{"ID_DISCENTE", Order.Ascending}}),
    #"Merged Queries" = Table.NestedJoin(#"Sorted Rows", {"COD_CURSO"}, Cursos, {"COD_CURSO"}, "Cursos", JoinKind.LeftOuter),
    #"Removed Columns2" = Table.RemoveColumns(#"Merged Queries",{"Cursos"}),
    #"Removed Duplicates" = Table.Distinct(#"Removed Columns2", {"ID_DISCENTE", "COD_CURSO", "ANO_INGRESSO"}),
    #"Removed Columns1" = Table.RemoveColumns(#"Removed Duplicates",{"FORMA_INGRESSO", "COD_CURSO", "CURSO", "ANO_INGRESSO", "PERIODO_INGRESSO"}),
    #"Removed Duplicates1" = Table.Distinct(#"Removed Columns1", {"ID_DISCENTE"})
in
    #"Removed Duplicates1"