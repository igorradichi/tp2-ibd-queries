let
    Source = Csv.Document(File.Contents("C:\Users\igorr\Downloads\cursos_graduacao_e_matriz_curricular.csv"),[Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"COD_CURSO", type text}, {"CURSO", type text}, {"NUM_VERSAO", type date}, {"DESCR_ESTRUTURA", type text}, {"PERIODO_IDEAL", Int64.Type}, {"COD_DISCIPLINA", type text}, {"NOME_DISCIPLNA", type text}, {"CREDITOS", Int64.Type}, {"CH_TEORICA", Int64.Type}, {"CH_PRATICA", Int64.Type}, {"CH_TOTAL", Int64.Type}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type",{"CURSO"}),
    #"Reordered Columns" = Table.ReorderColumns(#"Removed Columns",{"COD_CURSO", "COD_DISCIPLINA", "NUM_VERSAO", "DESCR_ESTRUTURA", "PERIODO_IDEAL", "NOME_DISCIPLNA", "CREDITOS", "CH_TEORICA", "CH_PRATICA", "CH_TOTAL"}),
    #"Removed Columns1" = Table.RemoveColumns(#"Reordered Columns",{"NOME_DISCIPLNA", "CREDITOS", "CH_TEORICA", "CH_PRATICA", "CH_TOTAL"}),
    #"Merged Queries" = Table.NestedJoin(#"Removed Columns1", {"COD_CURSO"}, #"Cursos de Graduação", {"COD_CURSO"}, "Curso", JoinKind.Inner),
    #"Removed Columns2" = Table.RemoveColumns(#"Merged Queries",{"Curso"}),
    #"Removed Duplicates" = Table.Distinct(#"Removed Columns2", {"COD_CURSO", "COD_DISCIPLINA"}),
    #"Replaced Value" = Table.ReplaceValue(#"Removed Duplicates","OBRIGATÓRIA","OBRIGATÓRIAS",Replacer.ReplaceValue,{"DESCR_ESTRUTURA"})
in
    #"Replaced Value"