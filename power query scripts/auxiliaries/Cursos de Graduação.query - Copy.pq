let
    Source = Table.Combine({quantidade_de_discentes_matriculados_nos_cursos_de_graduacao_2018, quantidade_de_discentes_matriculados_nos_cursos_de_graduacao_2019, quantidade_de_discentes_matriculados_nos_cursos_de_graduacao_2020, quantidade_de_discentes_matriculados_nos_cursos_de_graduacao_2021}),
    #"Grouped Rows" = Table.Group(Source, {"COD_CURSO"}, {{"Count", each _, type table [NIVEL=nullable text, COD_CURSO=nullable text, NOME_CURSO=nullable text, TURNO=nullable text, QTDE_MATRICULADO=nullable number, ANO=number]}}),
    #"Expanded Count" = Table.ExpandTableColumn(#"Grouped Rows", "Count", {"NIVEL", "NOME_CURSO", "TURNO"}, {"NIVEL", "NOME_CURSO", "TURNO"}),
    #"Reordered Columns" = Table.ReorderColumns(#"Expanded Count",{"COD_CURSO", "NOME_CURSO", "NIVEL", "TURNO"}),
    #"Removed Duplicates" = Table.Distinct(#"Reordered Columns", {"COD_CURSO"})
in
    #"Removed Duplicates"