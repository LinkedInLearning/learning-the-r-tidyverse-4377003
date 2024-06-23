library("tidyverse")
library("fivethirtyeight")


bechdel %>% 
  ggplot() +
  aes(x = budget_2013,
      y = domgross_2013) +
  geom_point(aes(colour = year)) +
  scale_colour_viridis_b() +
  facet_wrap(~ clean_test)





# Finessing a chart (maybe too much) --------------------------------------

library("ggrepel")
library("hrbrthemes")
library("ggtext")

bechdel_complete <- bechdel %>% 
  drop_na() %>% 
  mutate(profitable = budget_2013 <= domgross_2013)

bechdel_complete %>% 
  ggplot() +
  aes(x = budget_2013,
      y = domgross_2013) +
  geom_point(pch = 21,
             size = 2,
             aes(alpha = ifelse(profitable == 1, 1, 0.9),
                 fill = binary),
             colour = "grey40") +
  geom_label_repel(aes(label = if_else(domgross_2013 > 0.6E9, title, ""),
                       fill = binary),
                   colour = "white") +
  geom_function(fun = function(x) x,
                linetype = "dotted")+ 
  labs(x = "Budget (2013 $)",
       y = "Domgross (2013 $)",
       title = "Profitability of movies that <span style='color:#6765A6'>pass the Bechdel test</span><br>or <span style='color:#FF581B'>fail the test</span>") +
  scale_x_continuous(labels = scales::dollar_format(scale = 1E-6,
                                                    suffix = " Million"),
                     limits = c(0, 500E6),
                     expand = c(0.01, 0)) +
  scale_y_continuous(labels = scales::dollar_format(scale = 1E-9,
                                                    suffix = " Billion"),
                     limits = c(0, 1E9),
                     expand = c(0.01, 0)) +
  scale_alpha(range = c(0.5, 1)) +
  scale_fill_manual(values = c("PASS" = "#6765A6",
                               "FAIL" = "#FF581B")) +
  guides(alpha = guide_none(),
         colour = guide_none(),
         fill = guide_none()) +
  annotate("segment",
           x = 400E6 * 0.9,
           y = 0.40E9 * 0.9,
           xend = 400E6,
           yend = 0.48E9,
           arrow = arrow(type = "closed", length = unit(0.01, "npc")),
           colour = "#42A64B") +
  annotate("text",
           x = 405E6 * 0.9,
           y = 0.48E9 * 1.1,
           label = "Profitable movie",
           colour = "#42A64B",
           hjust = 0) +
  annotate("segment",
           x = 400E6 * 0.9,
           y = 0.40E9 * 0.9,
           xend = 400E6,
           yend = 0.32E9,
           arrow = arrow(type = "closed", length = unit(0.01, "npc")),
           colour = "#E5001D") +
  annotate("text",
           x = 405E6 * 0.9,
           y = 0.32E9 * 0.9,
           label = "Unprofitable movie",
           colour = "#E5001D",
           hjust = 0) +
  theme_ipsum() +
  theme(plot.title = element_markdown())


# gganimate ---------------------------------------------------------------

library("gganimate")

gg_animated_bechdel <- bechdel_complete %>% 
  ggplot() +
  aes(x = budget_2013,
      y = domgross_2013) +
  geom_point(pch = 21,
             size = 2,
             aes(alpha = ifelse(profitable == 1, 1, 0.9),
                 fill = binary),
             colour = "grey40") +
  geom_label_repel(aes(label = if_else(domgross_2013 > 0.6E9, title, ""),
                       fill = binary),
                   colour = "white") +
  geom_function(fun = function(x) x,
                linetype = "dotted") + 
  labs(x = "Budget (2013 $)",
       y = "Domgross (2013 $)") +
  scale_x_continuous(labels = scales::dollar_format(scale = 1E-6,
                                                    suffix = " Million"),
                     limits = c(0, 500E6),
                     expand = c(0.01, 0)) +
  scale_y_continuous(labels = scales::dollar_format(scale = 1E-9,
                                                    suffix = " Billion"),
                     limits = c(0, 1E9),
                     expand = c(0.01, 0)) +
  scale_alpha(range = c(0.5, 1)) +
  scale_fill_manual(values = c("PASS" = "#6765A6",
                               "FAIL" = "#FF581B")) +
  guides(alpha = guide_none(),
         colour = guide_none(),
         fill = guide_none()) +
  transition_states(year) +
  shadow_mark() 

anim_save("gg_animated.gif", gg_animated_bechdel)

