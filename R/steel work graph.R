{r}
#| label: fig-employment-steel
#| fig-cap: Employment by Industry, full-time employment, Australia 

library(reportabs)
library(ggplot2)
library(tidyverse)

industry_employment <- read_absdata("industry_employment", export_dir = "data")

industry_employment |> 
  filter(indicator == "Employed full-time") |> 
  group_by(anzsic_group, date) |> 
  summarise(value = sum(value),
            .groups = "drop") |> 
  filter(anzsic_group %in% c("Iron and Steel Forging", "Basic Ferrous Metal Manufacturing", "Basic Ferrous Metal Product Manufacturing")) |> 
  ggplot(aes(x = date, y = value, col = anzsic_group)) + 
  scale_colour_nrc() +
  scale_x_date() + 
  scale_y_continuous(labels = scales::label_comma()) + 
  geom_line() + 
  theme_nrc(legend = "top") +
  labs(x = NULL,
       y = NULL)