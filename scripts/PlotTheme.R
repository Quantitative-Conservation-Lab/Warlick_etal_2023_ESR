

plot_theme <- function(...) {
  theme(
    #text = element_text(size = 11),
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, color = "black", size = 11), 
    axis.text = element_text(vjust = 0.5, color = "black", size = 11), 
    axis.title = element_text(size = 11.5),
    axis.line.y = element_line(colour = "black"), 
    axis.line.x = element_line(colour = "black"), 
    plot.background = element_rect(), 
    panel.background = element_rect(fill = 'white'), 
    #panel.border = element_rect(fill = NA), #for square around plot
    panel.grid = element_blank(), 
    legend.key = element_blank(),
    strip.background = element_blank(), 
    strip.text = element_text(size = 10),
    legend.text = element_text(size = 10),
    ...)
}

pres_theme <- function(...) {
  theme(
    #text = element_text(size = 11),
    # axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 0.5, color = "black", size = 12),
    axis.text.x = element_text(angle = 40, hjust = 1, color = "black", size = 12),
    axis.text = element_text(vjust = 0.5, color = "black", size = 12), 
    axis.title = element_text(size = 14),
    axis.line.y = element_line(colour = "black"), 
    axis.line.x = element_line(colour = "black"), 
    plot.background = element_rect(), 
    panel.background = element_rect(fill = 'white'),
    panel.border = element_rect(fill = NA),
    panel.grid = element_blank(), 
    legend.key = element_blank(),
    strip.background = element_blank(), 
    strip.text = element_text(size = 13),
    legend.text = element_text(size = 13),
    ...)
} 

pres_theme_180 <- function(...) {
  theme(
    #text = element_text(size = 11),
    axis.text.x = element_text(hjust = 0.5, vjust = 0.5, color = "black", size = 12), 
    axis.text = element_text(vjust = 0.5, color = "black", size = 12), 
    axis.title.x = element_text(size = 14, vjust = -1),
    axis.title = element_text(size = 14),
    axis.line.y = element_line(colour = "black"), 
    axis.line.x = element_line(colour = "black"), 
    plot.background = element_rect(), 
    panel.background = element_rect(fill = 'white'),
    panel.border = element_rect(fill = NA),
    panel.grid = element_blank(), 
    legend.key = element_blank(),
    strip.background = element_blank(), 
    strip.text = element_text(size = 12),
    legend.text = element_text(size = 12),
    legend.title = element_text(size = 13),
    ...)
} 

plot_theme_x180 <- function(...) {
  theme(
    #text = element_text(size = 11),
    axis.text.x = element_text(hjust = 0.5, vjust = 0.5, color = "black", size = 11),
    # axis.text.x = element_text(vjust = 0.5, color = "black", size = 10), 
    axis.text = element_text(vjust = 0.5, color = "black", size = 11), 
    axis.title = element_text(size = 11.5),
    axis.line.y = element_line(colour = "black"), 
    axis.line.x = element_line(colour = "black"), 
    plot.background = element_rect(), 
    panel.background = element_rect(fill = 'white'), 
    #panel.border = element_rect(fill = NA), #for square around plot
    panel.grid = element_blank(), 
    legend.key = element_blank(),
    strip.background = element_blank(), 
    strip.text = element_text(size = 10),
    legend.text = element_text(size = 10),
    ...)
}

rainbow <- c("#363e7e", 'dodgerblue2', "#4aaaa5", "#a3d39c", "#f6b61c", "chocolate2", "red3", "violetred4")
rainbow2 <- c("violetred4", "dodgerblue3", 'deepskyblue1', "#4aaaa5", "#a3d39c", "#f6b61c", "chocolate2", "red3")