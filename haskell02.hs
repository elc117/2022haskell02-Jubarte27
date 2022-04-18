import Data.List.Split (startsWith)
temperaturaFebre t = t > 37.8

comFebre :: [Float] -> [Float]
comFebre = filter temperaturaFebre

comFebre' :: [Float] -> [Float]
comFebre' = filter (> 37.8)

itemize :: [String] -> [String]
itemize = map (\s -> "<li>" ++ s ++ "</li>")

bigCircles :: Float -> [Float] -> [Float]
bigCircles max areas = filter (> max) areas

quarentena :: [(String,Float)] -> [(String,Float)]
quarentena = filter (\(_, temperatura) -> temperaturaFebre temperatura)

idadesEm :: [Int] -> Int -> [Int]
idadesEm idades anoReferencia = map (anoReferencia -) idades

changeNames :: [String] -> [String]
changeNames = map maybeAddSuper
    where maybeAddSuper name = if head name == 'A' then "Super" ++ name else name

onlyShorts :: [String] -> [String]
onlyShorts = filter (\s -> length s < 5)