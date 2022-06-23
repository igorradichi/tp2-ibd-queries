let
    Source = Table.Combine({pos_mat_2021, pos_mat_2020, pos_mat_2019, pos_mat_2018}),
    #"Removed Columns" = Table.RemoveColumns(Source,{"FORMA_INGRESSO"}),
    #"Filtered Rows" = Table.SelectRows(#"Removed Columns", each ([ID_DISCENTE] <> null)),
    #"Removed Columns1" = Table.RemoveColumns(#"Filtered Rows",{"Column1", "Column2", "Column3", "Column4", "Column5", "Column6", "Column7", "Column8", "Column9", "Column10", "Column11", "Column12", "Column13", "Column14", "Column15", "Column16"}),
    #"Sorted Rows" = Table.Sort(#"Removed Columns1",{{"ID_DISCENTE", Order.Ascending}}),
    #"Removed Duplicates" = Table.Distinct(#"Sorted Rows", {"ID_DISCENTE", "COD_CURSO", "ANO_INGRESSO"}),
    #"Removed Columns2" = Table.RemoveColumns(#"Removed Duplicates",{"ANO", "CURSO", "ANO_INGRESSO", "PERIODO_INGRESSO"}),
    #"Merged Queries" = Table.NestedJoin(#"Removed Columns2", {"COD_CURSO"}, #"Cursos de Pós-Graduação", {"COD_CURSO"}, "Cursos de Pós-Graduação", JoinKind.Inner),
    #"Removed Columns3" = Table.RemoveColumns(#"Merged Queries",{"Cursos de Pós-Graduação", "COD_CURSO"}),
    #"Removed Duplicates1" = Table.Distinct(#"Removed Columns3", {"ID_DISCENTE"})
in
    #"Removed Duplicates1"