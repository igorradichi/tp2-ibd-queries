let
    Source = Csv.Document(File.Contents("C:\Users\igorr\Downloads\mat-ead-2019.csv"),[Delimiter=",", Columns=16, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"ID_DISCENTE", Int64.Type}, {"SEXO", type text}, {"ESTADO_CIVIL", type text}, {"DATA_NASCIMENTO", type date}, {"RACA_COR", type text}, {"DEFICIENCIA", type text}, {"NATURALIDADE", type text}, {"UF_NATURALIDADE", type text}, {"DESCR_BAIRRO", type text}, {"CIDADE_END", type text}, {"UF_CIDADE_END", type text}, {"FORMA_INGRESSO", type text}, {"COD_CURSO", type text}, {"CURSO", type text}, {"ANO_INGRESSO", Int64.Type}, {"PERIODO_INGRESSO", Int64.Type}})
in
    #"Changed Type"