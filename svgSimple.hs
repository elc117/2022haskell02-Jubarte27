import Text.Printf

-- String inicial do SVG
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

svgCircle :: Int -> Int -> Int -> String -> String
svgCircle x y r color =
  printf "<circle cx='%d' cy='%d' r='%d' fill='%s' />\n" x y r color

svgRect :: Float -> Float -> Float -> Float -> String -> String
svgRect x y w h color =
  printf "<rect x='%.2f' y='%.2f' width='%.2f' height='%.2f' fill='%s' />\n" x y w h color

mickey :: String
mickey =
  svgBegin 500 500 ++
  svgCircle 250 300 200 "rgb(0, 0, 0, 1)" ++
  svgCircle 100 100 75 "rgb(0, 0, 0, 1)" ++
  svgCircle 400 100 75 "rgb(0, 0, 0, 1)" ++
  svgEnd

parquet :: String
parquet = 
  svgBegin width height ++
  svgRect 0 0 width height "rgb(255, 255, 255, 1)" ++
  foldl1 (++) blackRects ++
  svgEnd
    where
      blackRects = [svgRect (x + offset) (y + offset) 50 50 "rgb(0, 0, 0, 1)"
        | offset <- [0, 50],
          y <- [0, 100 .. height],
          x <- [0, 100 .. width]]
      width = 500
      height = 500

main :: IO ()
main = do
  writeFile "circles.svg" mickey
  writeFile "squares.svg" parquet
