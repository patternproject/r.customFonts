## Displaying custom fonts 

# Src:
# https://github.com/yixuan/showtext

## load libraries ####
# only install if not already done
# http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them
list.of.packages <- c("ggplot2", "showtext", "grid")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

require(showtext)
require(ggplot2)
require(grid)

## checking the platform ####
.Platform$OS.type

## add fonts ####
# Google Fonts repository (http://www.google.com/fonts) 
font.add.google("Lato", "lato")
font.families()

font.add.google("Poppins", "myfont")
showtext.auto()

font.add.google("Oswald", "oswald")
showtext.auto()
font.families()

font.add.google("Indie Flower", "infl")
showtext.auto()
font.families()

## finally the plot ####
p = ggplot(NULL, aes(x = 1, y = 1)) + ylim(0.8, 1.2) +
  theme(axis.title = element_blank(), axis.ticks = element_blank(),
        axis.text = element_blank()) +
  annotate("text", 1, 1.1, family = "oswald", size = 15,
           label = "Grumpy wizards make toxic.") +
  annotate("text", 1, 0.9, label = 'Grumpy wizards make toxic.',
         family = "infl", size = 12)

showtext.auto()  ## automatically use showtext for new devices

print(p)  ## on-screen device (does not show here, some how, look for pdf or png)

pdf("showtext-example-3.pdf", 7, 4)  ## PDF device
print(p)
dev.off()

ggsave("showtext-example-4.png", width = 7, height = 4, dpi = 96)  ## PNG device

showtext.auto(FALSE)  ## turn off if no longer needed
