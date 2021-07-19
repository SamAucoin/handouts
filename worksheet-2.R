# Getting Started

library(readr)
pums <- read_csv(
  file = 'data/census_pums/sample.csv',
  col_types = cols_only(
    AGEP = 'i',
    WAGP = 'd',
    SCHL = 'c',
    SEX = 'c', 
    SCIENGP = 'c'))

## Layered Grammar

library(ggplot2)
ggplot(data = pums, aes(x = WAGP)) +
  geom_histogram()

library(dplyr)
pums <- filter(
  pums,
  WAGP > 0,
  WAGP < max(WAGP, na.rm = TRUE))

ggplot(data = pums, aes(x = WAGP)) +
  geom_histogram()

ggplot(pums,
  aes(x = AGEP,y = WAGP)) +
  geom_point()

ggplot(pums,
  aes(x = AGEP, y = WAGP)) +
  geom_density_2d()

## Layer Customization
filter_SCHL <- pums[pums$SCHL %in% c(16, 21, 22, 24),]

ggplot(filter_SCHL,
  aes(x = SCHL, y = WAGP)) +
  geom_boxplot() 
  
ggplot(filter_SCHL,
         aes(x = SCHL, y = WAGP)) +
  geom_boxplot() +
  geom_point() 

ggplot(filter_SCHL,
  aes(x = SCHL, y = WAGP)) +
  geom_point(color = 'red') +
  geom_boxplot()

ggplot(filter_SCHL,
       aes(x = SCHL, y = WAGP)) +
  geom_point(
    color = 'red',
    stat = 'summary',
    fun = mean)

## Adding Aesthetics

ggplot(filter_SCHL,
  aes(x = SCHL, y = WAGP, color = SEX)) +
  geom_point(
    stat = 'summary',
    fun = mean)  
  

filter_SCHL$SEX <- factor(filter_SCHL$SEX, levels = c('2','1'))

ggplot(filter_SCHL,
       aes(x = SCHL, y = WAGP, color=SEX)) +
  geom_point(
    stat = 'summary',
    fun = mean)

# Storing and Re-plotting

schl_wagp <- ggplot(filter_SCHL,
                    aes(x = SCHL, y = WAGP)) +
  geom_boxplot() 

schl_wagp <- schl_wagp +
  geom_point(
    color = 'red',
    stat = 'summary',
    fun = mean)

ggsave(filename = 'schl_wagp.pdf',
  plot = schl_wagp,
  width = 4, height = 3)

# Smooth Lines
Age_Wage <- ggplot(pums, 
                   aes(x=AGEP, y=WAGP)) +
  geom_point()

Age_Wage + 
  geom_smooth(method = 'lm')

wage_gap <- Age_Wage + 
  geom_smooth(method = 'lm', aes(color = SEX, fill = SEX))

# Axes, Labels and Themes

wage_gap + labs(
  title = 'Wage Gap',
  x = 'Age',
  y = 'Wages (Unadjusted USD)')

wage_gap + scale_y_continuous(
  trans = 'log10')


wage_gap <- wage_gap + labs(
  title = 'Wage Gap',
  x = 'Age',
  y = 'Wages (Unadjusted USD)') + 
  scale_color_manual(values = c('blue','red'), 
                     labels = c('Men','Women')) + 
  scale_fill_manual(values = c('blue','red'), 
                    labels = c('Men','Women')) 

wage_gap + theme_bw() 

wage_gap + theme_bw() +
  labs(title = 'Wage Gap') +
  theme(
    plot.title = element_text(
      face = 'bold',
      hjust = 0.5))


# Facets

ggplot(pums[pums$SCHL %in% c(16, 21, 22, 24),],
       aes(x = AGEP, y = WAGP)) + 
  geom_point() +
  geom_smooth(
    method = 'lm',
    aes(color = SEX, fill = SEX)) +
  facet_wrap(vars(SCHL))



ggplot(data = pums, aes(x = WAGP, fill = SEX))+
geom_histogram(binwidth = 10000)



ggplot(na.omit(pums), aes(x = SCIENGP, y = WAGP, color = SEX))+
  geom_boxplot()+
  scale_color_manual(values = c('blue', 'red'), 
                     labels = c('Men', 'Women')) +
  scale_x_discrete(labels = c('Yes', 'No'))+
  labs(x = 'Has a Science or Engineering Degree',
       y = 'Wages (Unadjusted USD)')+
geom_hline(aes(yintercept = median(WAGP)))


ggplot(pums[pums$SCHL %in% c(16, 21, 22, 24),],
       aes(x = WAGP)) + 
  geom_histogram(bins = 20) +
  facet_grid(vars(SEX),vars(SCHL))+
  geom_histogram(
    bins = 20,
    data = filter_SCHL['WAGP'],
    alpha = 0.5)


