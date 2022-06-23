let
    Source = Csv.Document(File.Contents("C:\Users\igorr\Downloads\cursos_graduacao_e_matriz_curricular.csv"),[Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"COD_CURSO", type text}, {"CURSO", type text}, {"NUM_VERSAO", type date}, {"DESCR_ESTRUTURA", type text}, {"PERIODO_IDEAL", Int64.Type}, {"COD_DISCIPLINA", type text}, {"NOME_DISCIPLNA", type text}, {"CREDITOS", Int64.Type}, {"CH_TEORICA", Int64.Type}, {"CH_PRATICA", Int64.Type}, {"CH_TOTAL", Int64.Type}}),
    #"Grouped Rows" = Table.Group(#"Changed Type", {"COD_DISCIPLINA"}, {{"NOME_DISCIPLINA", each _, type table [COD_CURSO=nullable text, CURSO=nullable text, NUM_VERSAO=nullable date, DESCR_ESTRUTURA=nullable text, PERIODO_IDEAL=nullable number, COD_DISCIPLINA=nullable text, NOME_DISCIPLNA=nullable text, CREDITOS=nullable number, CH_TEORICA=nullable number, CH_PRATICA=nullable number, CH_TOTAL=nullable number]}}),
    #"Expanded NOME_DISCIPLINA" = Table.ExpandTableColumn(#"Grouped Rows", "NOME_DISCIPLINA", {"NOME_DISCIPLNA", "CREDITOS", "CH_TEORICA", "CH_PRATICA", "CH_TOTAL"}, {"NOME_DISCIPLNA", "CREDITOS", "CH_TEORICA", "CH_PRATICA", "CH_TOTAL"}),
    #"Removed Duplicates" = Table.Distinct(#"Expanded NOME_DISCIPLINA", {"NOME_DISCIPLNA", "CREDITOS", "CH_TEORICA", "CH_PRATICA", "CH_TOTAL"})
in
    #"Removed Duplicates"