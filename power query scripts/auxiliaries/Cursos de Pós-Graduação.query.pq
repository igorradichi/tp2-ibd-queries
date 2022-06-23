let
    Source = Csv.Document(File.Contents("C:\Users\igorr\Downloads\cursos_pos.csv"),[Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"Column1", type text}, {"Column2", type text}, {"Column3", type text}, {"Column4", type text}, {"Column5", type text}, {"Column6", type text}, {"Column7", type text}, {"Column8", type text}, {"Column9", type text}, {"Column10", type text}, {"Column11", type text}}),
    #"Promoted Headers" = Table.PromoteHeaders(#"Changed Type", [PromoteAllScalars=true]),
    #"Changed Type1" = Table.TransformColumnTypes(#"Promoted Headers",{{"COD_CURSO", type text}, {"NOME_CURSO", type text}, {"TURNO", type text}, {"SITUACAO", type text}, {"NIVEL_CURSO", type text}, {"MODALIDADE", type text}, {"AREA_CONHECIMENTO", type text}, {"CAMPUS", type text}, {"DOC_AUTORIZACAO", type text}, {"DOC_RECONHECIMENTO", type text}, {"COD_EMEC", type text}}),
    #"Reordered Columns" = Table.ReorderColumns(#"Changed Type1",{"COD_CURSO", "NOME_CURSO", "NIVEL_CURSO", "TURNO", "SITUACAO", "MODALIDADE", "AREA_CONHECIMENTO", "CAMPUS", "DOC_AUTORIZACAO", "DOC_RECONHECIMENTO", "COD_EMEC"}),
    #"Renamed Columns" = Table.RenameColumns(#"Reordered Columns",{{"NIVEL_CURSO", "NIVEL"}}),
    #"Removed Columns" = Table.RemoveColumns(#"Renamed Columns",{"SITUACAO"}),
    #"Removed Duplicates" = Table.Distinct(#"Removed Columns", {"COD_CURSO"})
in
    #"Removed Duplicates"