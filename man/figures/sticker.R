

# RStudio: https://github.com/rstudio/hex-stickers
# hexbin: http://hexb.in/
# hexbin github: https://github.com/maxogden/hexbin
# make stickers with: https://github.com/GuangchuangYu/hexSticker


# Note the hexbin github readme says to use
# 181x209 as a png (preview on mac can easily resize)
# and also provide an svg
# I used this to convert png to svg: https://www.aconvert.com/image/png-to-svg/


# https://coolors.co/193763-f4f4f4-00173d-ff5a5f-c81d25



library(hexSticker)
sticker(

  # image
  "man/figures/rawr_original.png",
  s_x=1, # slightly to right to appear centered
  s_y=1,
  s_width=1,
  s_height=1,
  white_around_sticker = T,

  # package name
  package="rawr",
  p_size=0,
  p_color = "ivory", # 00030A 010101 #383838
  p_y = 1.475,

  # Output file
  filename="man/figures/rawr.png",

  # Background colour
  h_fill = "#0E2636", # #F0F0F0


  # Border
  # Grey colours: https://www.w3schools.com/colors/colors_shades.asp
  h_color = "#0E2636",   # 3F4243 7F2B94 3B2691 4238AF
  h_size = 2.5,

  dpi = 1000
);system("open man/figures/rawr.png")


# ### Convert to svg
# # From: https://stackoverflow.com/questions/61300636/convert-png-to-svg-in-r
# library(magick)
# my_image <- image_read("man/figures/rawr.png")
# my_svg <- image_convert(my_image, format="svg")
# image_write(my_svg, "man/figures/rawr.svg")
#
# ?image_convert
#

































