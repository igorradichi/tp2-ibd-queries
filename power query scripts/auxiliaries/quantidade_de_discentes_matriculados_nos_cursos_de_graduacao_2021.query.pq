let
    Source = Csv.Document(File.Contents("C:\Users\igorr\Downloads\quantidade_de_discentes_matriculados_nos_cursos_de_graduacao_2021.csv"),[Delimiter=",", Columns=5, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"NIVEL", type text}, {"COD_CURSO", type text}, {"NOME_CURSO", type text}, {"TURNO", type text}, {"QTDE_MATRICULADO", Int64.Type}}),
    #"Added Custom" = Table.AddColumn(#"Changed Type", "ANO", each 2021)
in
    #"Added Custom"