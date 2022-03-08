
data <- read.csv("beta_diversity_pig_human_mouse_result.txt", header=T, sep="")

library(ggplot2)

library(ggpubr)

data$group <- factor(data$group,levels = c("Inter-Pigs-Human-feces","Inter-Pigs-Mouse-feces","Inter-Human-Mouse-feces"))

my_comparisons <- list(c("Inter-Pigs-Human-feces","Inter-Pigs-Mouse-feces"),c("Inter-Human-Mouse-feces","Inter-Pigs-Mouse-feces"))

ggboxplot(data,x="group",y="beta",color = "group",palette = "jco")+stat_compare_means(comparisons = my_comparisons,method = "wilcox")+stat_compare_means()+rotate_x_text(angle = 45)
