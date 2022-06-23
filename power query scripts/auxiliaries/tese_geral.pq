let
    Source = Csv.Document(File.Contents("C:\Users\igorr\Downloads\tese_geral.csv"),[Delimiter=",", Columns=4, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"TIPO", type text}, {"COD_CURSO", type text}, {"CURSO", type text}, {"QUANTIDADE", Int64.Type}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type",{"CURSO"}),
    #"Merged Queries" = Table.NestedJoin(#"Removed Columns", {"COD_CURSO"}, Cursos, {"COD_CURSO"}, "Cursos", JoinKind.LeftOuter),
    #"Expanded Cursos" = Table.ExpandTableColumn(#"Merged Queries", "Cursos", {"NOME_CURSO"}, {"NOME_CURSO"}),
    #"Removed Columns1" = Table.RemoveColumns(#"Expanded Cursos",{"NOME_CURSO"}),
    #"Added Custom" = Table.AddColumn(#"Removed Columns1", "ANO", each 2021)
in
    #"Added Custom"