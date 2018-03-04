library(shiny)
library(ggplot2)  # for the diamonds dataset

shinyUI(pageWithSidebar(
  headerPanel('Methylome to Transcriptome database (M2Tdb)'),
 
  sidebarPanel(
    #selectInput("Trait",
    #            label = "Choose a trait",
    #            choices = c("BMI","HDL", "UC","CAD", "Height","RA","T2D","WHRadjBMI","CD","LDL","SCZ",
    #                       "TG"),
    #           selected = "BMI"),
    helpText('This database is designed to query the pleiotropic associations between DNA methylation sites and genes identified in the Wu et al. (2018 Nature Communications, 9: 918) study. '),
    selectInput("Chr",
                label = "Chromosome",
                choices = c("All","1", "2","3", "4","5","6","7","8","9","10",
                            "11", "12","13", "14","15","16","17","18","19","20",
                            "21","22"),
                selected = "All"),
    textInput("meprobeid", label = ("DNA methylation probe"), 
              value ="", placeholder="e.g. cg06781209"),
    textInput("eprobeid", label = ("Gene expression probe"), 
              value ="", placeholder="e.g. ILMN_2075065"),
    textInput("geneid", label = ("Gene"), 
              value ="", placeholder="e.g. FADS2"),
    textInput("psmr", label = ("SMR p-value threshold"), 
              value ="",placeholder="e.g. 5.5e-7"),
    textInput("phet", label = ("HEIDI p-value threshold"), 
              value ="",placeholder="e.g. 0.05"),
    submitButton("Submit"),
    tags$p(),
    tags$p(tags$strong("Citation:"),"Wu Y, Zeng J, Zhang F, Zhu Z, Qi T, Zheng Z, Lloyd-Jones LR, Marioni RE, Martin NG, Montgomery GW, Deary IJ, Wray NR, Visscher PM, McRae AF & Yang J (2018) Integrative analysis of omics summary data reveals putative mechanisms underlying complex traits. Nature Communications, 9: 918."),
    tags$p(tags$strong("Credits:"), tags$a(href = "http://researchers.uq.edu.au/researcher/12709", "Futao Zhang"), ", ",tags$a(href = "mailto:y.wu2@uq.edu.au", "Yang Wu"),
           "and ", tags$a(href = "http://researchers.uq.edu.au/researcher/2713", "Jian Yang"), " at the Program in ",tags$a(href = "http://cnsgenomics.com/", "Complex Trait Genomics"),
           ", The University of Queensland."),
    tags$p(tags$strong("Troubleshooting:"), tags$a(href = "mailto:jian.yang@imb.uq.edu.au", "Jian Yang")),
    width = 3
  ),
  mainPanel(
    tags$head(includeScript("google-analytics.js")),
    tabsetPanel(
      tabPanel('Methylome to Transcriptome',
               DT::dataTableOutput("mymapping"))
      ,
      br(),
      tags$p(),
      tags$p(tags$strong(helpText('Note:')))
      ,
      helpText('MeProbe: DNA methylation probe')
      ,
      helpText('MeProbe gene: nearest gene to the MeProbe')
      ,
      helpText('eProbe: Gene expression probe')
      ,
      helpText('eProbe gene: tagging gene of the eProbe')
      ,
      helpText('pSMR: p-value from the SMR test')
      ,
      helpText('pHEIDI: p-value from the HEIDI test')
      
      #,
      #tabPanel('Plot',
      #         htmlOutput("text1"),
      #        plotOutput("myplot",width = "100%",height = "800px"))
      #,
      #tabPanel('About',
      #          htmlOutput("about"))
    )
  )
))
