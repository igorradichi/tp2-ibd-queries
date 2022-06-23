let
    Source = Csv.Document(File.Contents("C:\Users\igorr\Downloads\tese_geral.csv"),[Delimiter=",", Columns=4, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"TIPO", type text}, {"COD_CURSO", type text}, {"CURSO", type text}, {"QUANTIDADE", Int64.Type}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type",{"CURSO"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Columns",{{"TIPO", "TIPO_TRABALHO"}}),
    #"Added Custom" = Table.AddColumn(#"Renamed Columns", "ANO", each 2021),
    #"Reordered Columns" = Table.ReorderColumns(#"Added Custom",{"TIPO_TRABALHO", "COD_CURSO", "ANO", "QUANTIDADE"})
in
    #"Reordered Columns"