let
    Source = Table.Combine({#"mat-ead-2020", #"mat-ead-2021", #"mat-ead-2019", #"mat-ead-2018"}),
    #"Removed Columns" = Table.RemoveColumns(Source,{"Column1", "Column2", "Column3", "Column4", "Column5", "Column6", "Column7", "Column8", "Column9", "Column10", "Column11", "Column12", "Column13", "Column14", "Column15", "Column16"}),
    #"Filtered Rows" = Table.SelectRows(#"Removed Columns", each [ID_DISCENTE] <> null and [ID_DISCENTE] <> ""),
    #"Sorted Rows" = Table.Sort(#"Filtered Rows",{{"ID_DISCENTE", Order.Ascending}}),
    #"Removed Duplicates" = Table.Distinct(#"Sorted Rows", {"ID_DISCENTE", "COD_CURSO", "ANO_INGRESSO"}),
    #"Removed Columns1" = Table.RemoveColumns(#"Removed Duplicates",{"SEXO", "ESTADO_CIVIL", "DATA_NASCIMENTO", "RACA_COR", "DEFICIENCIA", "NATURALIDADE", "UF_NATURALIDADE", "DESCR_BAIRRO", "CIDADE_END", "UF_CIDADE_END"}),
    #"Reordered Columns" = Table.ReorderColumns(#"Removed Columns1",{"ID_DISCENTE", "COD_CURSO", "FORMA_INGRESSO", "CURSO", "ANO_INGRESSO", "PERIODO_INGRESSO"}),
    #"Removed Columns2" = Table.RemoveColumns(#"Reordered Columns",{"CURSO"}),
    #"Reordered Columns1" = Table.ReorderColumns(#"Removed Columns2",{"ID_DISCENTE", "COD_CURSO", "ANO_INGRESSO", "PERIODO_INGRESSO", "FORMA_INGRESSO"}),
    #"Merged Queries" = Table.NestedJoin(#"Reordered Columns1", {"COD_CURSO"}, Cursos, {"COD_CURSO"}, "Cursos", JoinKind.Inner),
    #"Removed Columns3" = Table.RemoveColumns(#"Merged Queries",{"Cursos"}),
    #"Sorted Rows1" = Table.Sort(#"Removed Columns3",{{"ID_DISCENTE", Order.Ascending}})
in
    #"Sorted Rows1"