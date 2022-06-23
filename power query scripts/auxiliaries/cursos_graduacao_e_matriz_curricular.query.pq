let
    Source = Csv.Document(File.Contents("C:\Users\igorr\Downloads\cursos_graduacao_e_matriz_curricular.csv"),[Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"COD_CURSO", type text}, {"CURSO", type text}, {"NUM_VERSAO", type date}, {"DESCR_ESTRUTURA", type text}, {"PERIODO_IDEAL", Int64.Type}, {"COD_DISCIPLINA", type text}, {"NOME_DISCIPLNA", type text}, {"CREDITOS", Int64.Type}, {"CH_TEORICA", Int64.Type}, {"CH_PRATICA", Int64.Type}, {"CH_TOTAL", Int64.Type}})
in
    #"Changed Type"