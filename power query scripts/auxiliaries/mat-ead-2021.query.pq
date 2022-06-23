let
    Source = Csv.Document(File.Contents("C:\Users\igorr\Downloads\mat-ead-2021.csv"),[Delimiter=",", Columns=16, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"Column1", Int64.Type}, {"Column2", type text}, {"Column3", type text}, {"Column4", type date}, {"Column5", type text}, {"Column6", type text}, {"Column7", type text}, {"Column8", type text}, {"Column9", type text}, {"Column10", type text}, {"Column11", type text}, {"Column12", type text}, {"Column13", type text}, {"Column14", type text}, {"Column15", Int64.Type}, {"Column16", Int64.Type}})
in
    #"Changed Type"