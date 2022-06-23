let
    Source = Table.Combine({#"Cursos de Pós-Graduação", #"Cursos de Graduação"}),
    #"Replaced Value" = Table.ReplaceValue(Source,"Ensino Superior-Grad.Regular-Benjamin Constant","Ensino Superior - Graduação Regular",Replacer.ReplaceValue,{"NIVEL"}),
    #"Replaced Value1" = Table.ReplaceValue(#"Replaced Value","Ensino Superior-Grad.Regular-Parintins","Ensino Superior - Graduação Regular",Replacer.ReplaceText,{"NIVEL"}),
    #"Replaced Value2" = Table.ReplaceValue(#"Replaced Value1","Ensino Superior-Grad.Regular-Itacoatiara","Ensino Superior - Graduação Regular",Replacer.ReplaceText,{"NIVEL"}),
    #"Replaced Value3" = Table.ReplaceValue(#"Replaced Value2","Ensino Superior-Grad.Regular-Humaitá","Ensino Superior - Graduação Regular",Replacer.ReplaceText,{"NIVEL"}),
    #"Replaced Value4" = Table.ReplaceValue(#"Replaced Value3","Ensino Superior-Grad.Regular-Coari","Ensino Superior - Graduação Regular",Replacer.ReplaceText,{"NIVEL"})
in
    #"Replaced Value4"