# This is all about area charts and streamgraph
post_topic <- "folyamgraf"

#######
library(ggplot2)
library(dplyr) 
# install.packages("paletteer")
library(paletteer)
# install.packages("ggstream")
library(ggstream)
library(magick)
library(here)
#######

df <- structure(list(geo = c("DE", "DE", "DE", "DE", "DE", 
"DE", "DE", "DE", "DE", "DE", "EL", "EL", "EL", "EL", "EL", "EL", 
"EL", "EL", "EL", "EL", "ES", "ES", "ES", "ES", "ES", "ES", "ES", 
"ES", "ES", "ES", "HU", "HU", "HU", "HU", "HU", "HU", "HU", "HU", 
"HU", "HU", "IT", "IT", "IT", "IT", "IT", "IT", "IT", "IT", "IT", 
"IT"), time = c(2014L, 2015L, 2016L, 2017L, 2018L, 2019L, 2020L, 
2021L, 2022L, 2023L, 2014L, 2015L, 2016L, 2017L, 2018L, 2019L, 
2020L, 2021L, 2022L, 2023L, 2014L, 2015L, 2016L, 2017L, 2018L, 
2019L, 2020L, 2021L, 2022L, 2023L, 2014L, 2015L, 2016L, 2017L, 
2018L, 2019L, 2020L, 2021L, 2022L, 2023L, 2014L, 2015L, 2016L, 
2017L, 2018L, 2019L, 2020L, 2021L, 2022L, 2023L), value = c(172945L, 
441805L, 722270L, 198255L, 161885L, 142450L, 102525L, 148175L, 
217735L, 329035L, 7585L, 11370L, 49875L, 56940L, 64975L, 74910L, 
37860L, 22660L, 29125L, 57895L, 5460L, 14600L, 15570L, 33035L, 
52730L, 115175L, 86380L, 62050L, 116135L, 160460L, 41215L, 174435L, 
28215L, 3115L, 635L, 465L, 90L, 40L, 45L, 30L, 63655L, 82790L, 
121185L, 126550L, 53440L, 35005L, 21330L, 45200L, 77200L, 130565L
)), class = "data.frame", row.names = c(NA, -50L))

####
## Stacked area
p1 <- ggplot(df, aes(x=time, y=value, fill=geo)) + 
    geom_area() +
    scale_fill_paletteer_d("nationalparkcolors::Acadia") +
    scale_x_continuous(breaks = seq(2014, 2024, by=2)) +
    expand_limits(x = c(2014, 2023)) +
    scale_y_continuous(labels = scales::comma_format(big.mark = ",")) +
    labs(title = "Halmozott területdiagram: Menedékkérők száma\n egyes EU országokban",
         x = element_blank(),
         y = element_blank()) +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5),
          legend.title = element_blank()) 

p1

###

path <- paste0(here(),"/_drafts/_tmp")
ggsave(paste0(path,"stacked-area.png"), p1, device = "png")
stck <- image_read(paste0(path, "stacked-area.png"))
stck800 <- image_scale(stck, "800x")
stck400 <- image_scale(stck, "400x")


paste0("./assets/img/", format(Sys.Date(), "%y-%m-%d-"), post_topic)
dirname <- paste0("./assets/img/", format(Sys.Date(), "%y-%m-%d-"), post_topic)
dir.create(dirname)

image_write(stck800, path = paste0(dirname, "/stacked-area800.png"))
image_write(stck400, path = paste0(dirname, "/stacked-area400.png"))
# paste0(dirname, "/stacked-area400.png")

### Simple (non-stacked) area chart

p2 <- ggplot(df, aes(time, value, fill=geo)) +
    geom_area(alpha=0.7, position = "identity") +
    scale_fill_paletteer_d("lisa::FridaKahlo") +
    theme_bw() +
    scale_x_continuous(breaks = seq(2014, 2024, by=2)) +
    expand_limits(x = c(2014, 2023)) +
    scale_y_continuous(labels = scales::comma_format(big.mark = ",")) +
    labs(title = "Egyszerű területdiagram: Menedékkérők száma\n egyes EU országokban",
         x = element_blank(),
         y = element_blank()) +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5),
          legend.title = element_blank()) 

p2

ggsave(paste0(path,"simple-area.png"), p2, device = "png")
nstck <- image_read(paste0(path, "simple-area.png"))
nstck800 <- image_scale(nstck, "800x")
nstck400 <- image_scale(nstck, "400x")

image_write(nstck800, path = paste0(dirname, "/simple-area800.png"))
image_write(nstck400, path = paste0(dirname, "/simple-area400.png"))

###############

## Arányosan (100 százalékra) halmozott területdiagram
    
df1 <- df  %>%
  group_by(time, geo) %>%
  summarise(n = sum(value)) %>%
  mutate(percentage = n / sum(n))

df1
# Plot
p3 <- ggplot(df1, aes(x=time, y=percentage, fill=geo)) + 
    geom_area() +
    scale_fill_paletteer_d("wesanderson::Cavalcanti1") +
    theme_bw() +
    scale_x_continuous(breaks = seq(2014, 2024, by=2)) +
    expand_limits(x = c(2014, 2023)) +
    scale_y_continuous(labels = scales::comma_format(big.mark = ",")) +
    labs(title = "Arányosan (százalékosan) halmozott területdiagram: Menedékkérők száma\n egyes EU országokban",
         x = element_blank(),
         y = element_blank()) +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5),
          legend.title = element_blank())
p3

ggsave(paste0(path,"proportional-area.png"), p3, device = "png")
pstck <- image_read(paste0(path, "proportional-area.png"))
pstck800 <- image_scale(pstck, "800x")
pstck400 <- image_scale(pstck, "400x")

image_write(pstck800, path = paste0(dirname, "/proportional-area800.png"))
image_write(pstck400, path = paste0(dirname, "/proportional-area400.png"))

#####

## Folyamgráf (Streamgraph)

p4 <- ggplot(df, aes(x = time, y = value, fill = geo)) +
    geom_stream(color = "black") +
    scale_fill_paletteer_d("nationalparkcolors::Acadia") +
    theme_bw() +
    scale_x_continuous(breaks = seq(2014, 2024, by=2)) +
    expand_limits(x = c(2014, 2023)) +
    scale_y_continuous(labels = scales::comma_format(big.mark = ",")) +
    labs(title = "Folyamgráf: Menedékkérők száma\n egyes EU országokban",
         x = element_blank(),
         y = element_blank()) +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5),
          legend.title = element_blank())

p4
path
dirname
ggsave(paste0(path,"streamgraph.png"), p4, device = "png")
streamg <- image_read(paste0(path, "streamgraph.png"))
streamg800 <- image_scale(streamg, "800x")
streamg400 <- image_scale(streamg, "400x")

image_write(streamg800, path = paste0(dirname, "/proportional-area800.png"))
image_write(streamg400, path = paste0(dirname, "/proportional-area400.png"))

