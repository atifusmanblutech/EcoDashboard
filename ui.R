library(shinydashboard)


dashboardPage( 
                
               
               dashboardHeader(title = "Campaign Launch Demo", titleWidth = 350,
                               dropdownMenu(type = "messages",
                                            messageItem(
                                              from = "Sales Dept",
                                              message = "Sales are steady this month."
                                            ),
                                            messageItem(
                                              from = "New User",
                                              message = "How do I register?",
                                              icon = icon("question"),
                                              time = "13:45"
                                            ),
                                            messageItem(
                                              from = "Support",
                                              message = "The new server is ready.",
                                              icon = icon("life-ring"),
                                              time = "2014-12-01"
                                            )
                               )),
               
               dashboardSidebar( width = 350, collapsed = TRUE,
                                 sidebarMenu(id = "sidebar",
                                             menuItem("Tab2", tabName = "tab_homePage", icon = icon("users")),
                                             menuItem("Day Insights", tabName = "tab_dayInsights", icon = icon("menu-hamburger", lib = "glyphicon") ),
                                             conditionalPanel("input.sidebar === 'tab_dayInsights'",
                                                              hr(),
                                                              h3("Insights",  style = "align:center;text-align:center"),
                                                              hr(style ="border-top: dotted 1px #FFFFFF"),
                                                              selectInput(
                                                                "Segmentation",
                                                                "Please Select Segmentaion",
                                                                
                                                                choices = c("Daily", "Hourly"),
                                                                1
                                                              ),
                                                              # # option 1
                                                              conditionalPanel(
                                                                condition = "input.Segmentation == 'Daily'",
                                                                selectInput(
                                                                  "segTypeDaily",
                                                                  "Select Type of Daily Segmentation",
                                                                  choices = c("Per Day Revenue", "Per Day Transactions")
                                                                )
                                                              ),
                                                              
                                                              #       # option 2
                                                              conditionalPanel(
                                                                condition = "input.Segmentation == 'Hourly'",
                                                                selectInput(
                                                                  "segTypeHourly",
                                                                  "Select Type of Hourly Segmentation",
                                                                  choices = c("Hourly Revenue", "Hourly Transaction")
                                                                )
                                                              ),
                                                              
                                                              hr(),
                                                              shinyjs::hidden(
                                                                div(id="div_weekdayMarketing",
                                                                    
                                                                    
                                                                    h3("Marketing", style = "align:center;text-align:center"),
                                                                    hr(style ="border-top: dotted 1px #FFFFFF"),
                                                                    selectInput(
                                                                      "WeekdayMarketingChoice",
                                                                      "Please Select Marketing Type",
                                                                      choices = c("Email Marketing" = "emailMarketing", "SMS Marketing" = "smsMarketing"), selected = "smsMarketing"),
                                                                    
                                                                    
                                                                    br(),
                                                                    
                                                                    #### Condition for SMS Marketing
                                                                    conditionalPanel(
                                                                      condition = "input.WeekdayMarketingChoice == 'smsMarketing'",
                                                                      selectInput("choice_autoManualSMS",
                                                                                  "Auto or Manual",
                                                                                  choices = c("Automatic","Manual"),selected = "Automatic"),
                                                                      
                                                                      conditionalPanel("input.choice_autoManualSMS == 'Manual'",
                                                                                       uiOutput("dayFilterControlForSMS"),
                                                                                       helpText("Note: SMS will be sent to all customers on selected Days"),
                                                                                       br(),
                                                                                       textAreaInput(
                                                                                         "textSmsMarketingWeekday",
                                                                                         "Enter campaign text or offers to send: ",
                                                                                         "Sms Marketing Text",
                                                                                         
                                                                                         "100%",
                                                                                         "100px",
                                                                                         resize = "vertical"
                                                                                       ),
                                                                                       helpText("Note: Enter a custom offer that you want to send!"),
                                                                                       br(),
                                                                                       
                                                                                       actionButton(
                                                                                         "manualSmsCampaign",
                                                                                         " Launch SMS Campaign",
                                                                                         icon("envelope")
                                                                                       )
                                                                      ),
                                                                      
                                                                      
                                                                      conditionalPanel("input.choice_autoManualSMS == 'Automatic'",
                                                                                       br(),
                                                                                       actionButton("maxSmsCampaign", "Campaign for Max Revenue Day"),
                                                                                       helpText("Note: Campaigns will lauch for day with Max Revenue"),
                                                                                       
                                                                                       br(),
                                                                                       actionButton("minSmsCampaign", "Campaign for Min Revenue Day"),
                                                                                       
                                                                                       helpText("Note: Campaigns will lauch for day with Max Revenue")
                                                                      )
                                                                      
                                                                      
                                                                      
                                                                    ),
                                                                    
                                                                    #### Condition for Email Marketing
                                                                    conditionalPanel(
                                                                      condition = "input.WeekdayMarketingChoice == 'emailMarketing'",
                                                                      selectInput(
                                                                        "choice_autoManualEmail",
                                                                        "Auto or Manual",
                                                                        choices = c("Automatic","Manual"),1
                                                                      )
                                                                      ,
                                                                      conditionalPanel("input.choice_autoManualEmail == 'Manual'",
                                                                                       
                                                                                       
                                                                                       uiOutput("dayFilterControlForEmail"),
                                                                                       helpText("Note: Emails will be sent to all customers on selected Days"),
                                                                                       br(),
                                                                                       textAreaInput(
                                                                                         "textEmailMarketingWeekday",
                                                                                         "Enter campaign text or offers to send: ",
                                                                                         "Special Discount Offers!",
                                                                                         "100%",
                                                                                         "100px",
                                                                                         resize = "vertical"
                                                                                       ),
                                                                                       helpText("Note: Enter a custom offer that you want to send!"),
                                                                                       br(),
                                                                                       
                                                                                       actionButton(
                                                                                         "manualEmailCampaign",
                                                                                         "Launch Email Campaign",
                                                                                         icon("envelope")
                                                                                         
                                                                                       )
                                                                      ),
                                                                      hr(),
                                                                      conditionalPanel("input.choice_autoManualEmail == 'Automatic'",
                                                                                       actionButton("maxEmailCampaign", "Campaign for Max Revenue Day"),
                                                                                       helpText("Note: Campaigns will launch for day with Max Revenue"),
                                                                                       
                                                                                       
                                                                                       br(),
                                                                                       actionButton("minEmailCampaign", "Campaign for Min Revenue Day"),
                                                                                       helpText("Note: Campaigns will lauch for day with Min Revenue"),
                                                                                       br()
                                                                      )
                                                                      
                                                                    )   
                                                                )
                                                              )
                                                              
                                             ),
                                             
                                             menuItem("Individual Customer Insights", icon = icon("menu-hamburger",lib = "glyphicon"), tabName = "tab_customerInsights"),
                                             conditionalPanel("input.sidebar === 'tab_customerInsights'",
                                                              hr(),
                                                              h3("Individual Insights", style = "align:center;text-align:center;"),
                                                              hr(style ="border-top: dotted 1px #FFFFFF"),
                                                              sliderInput("numOfCustomers", "Number of Customers:",
                                                                          min = 0, max = 100,
                                                                          value = 20),
                                                              shinyjs::hidden(
                                                                div(
                                                                  id="div_personalizedCampaign",
                                                                  br(),
                                                                  actionButton(
                                                                    "cusPersonalizedCampaignEmail",
                                                                    "Personalised Email Campaign",
                                                                    icon("envelope")
                                                                  ),
                                                                  helpText(
                                                                    "Note: Selecting this button will launch an Email Campaign",
                                                                    br(),
                                                                    "for top Customers"
                                                                    
                                                                  ),
                                                                  
                                                                  br(),
                                                                  actionButton(
                                                                    "cusPersonalizedCampaignSms",
                                                                    "Personalised SMS Campaign",
                                                                    icon("envelope")
                                                                  ),
                                                                  helpText(
                                                                    "Note: Selecting this button will launch an SMS Campaign",
                                                                    br(),
                                                                    "for top Customers"
                                                                  ),
                                                                  
                                                                  
                                                                  br(),
                                                                  hr()    
                                                                )
                                                              ),
                                                              
                                                              h3("Classified Insights", style = "align:center;text-align:center;"),
                                                              hr(style ="border-top: dotted 1px #FFFFFF"),
                                                              #  uiOutput("customerRFMchoice") %>% withSpinner(color =
                                                              #                                                 "#696969", type = 7),
                                                              helpText(
                                                                "Note: Selecting a Classification will display graph of",
                                                                br(),
                                                                "customers of that class in all countries"
                                                              ),
                                                              
                                                              
                                                              hr(),
                                                              shinyjs::hidden(
                                                                div(id="div_customerMarketing",
                                                                    h3("Marketing", style = "align:center;text-align:center;"),
                                                                    hr(style ="border-top: dotted 1px #FFFFFF"),
                                                                    selectInput(
                                                                      "CustomerMarketingChoice",
                                                                      "Please Select Marketing Type",
                                                                      choices = c("Email Marketing" = "emailMarketing", "SMS Marketing" = "smsMarketing"),
                                                                      2
                                                                    ),
                                                                    helpText("Note: Select how you want to do marketing"),
                                                                    br(),
                                                                    
                                                                    #### Condition for SMS Marketing
                                                                    conditionalPanel(
                                                                      condition = "input.CustomerMarketingChoice == 'smsMarketing'",
                                                                      
                                                                      textAreaInput(
                                                                        "textSmsMarketing",
                                                                        "Enter campaign text or offers to send: ",
                                                                        "Special Discount Offers!",
                                                                        "100%",
                                                                        "100px",
                                                                        resize = "vertical"
                                                                      ),
                                                                      
                                                                      actionButton("manualSmsCampaignCustomer", "Launch SMS Campaign", icon("envelope")),
                                                                      hr()
                                                                      
                                                                      
                                                                    ),
                                                                    
                                                                    #### Condition for Email Marketing
                                                                    conditionalPanel(
                                                                      condition = "input.CustomerMarketingChoice == 'emailMarketing'",
                                                                      
                                                                      # uiOutput("dayFilterControlForEmail"),
                                                                      # helpText("Note: Emails will be sent to all customers on selected Days"),
                                                                      #
                                                                      textAreaInput(
                                                                        "textEmailMarketing",
                                                                        "Enter campaign text or offers to send: ",
                                                                        "Special Discount Offers!",
                                                                        "100%",
                                                                        "100px",
                                                                        resize = "vertical"
                                                                      ),
                                                                      actionButton("manualEmailCampaignCustomer", "Launch Email Campaign",  icon("envelope")),
                                                                      hr()
                                                                      
                                                                    )      
                                                                    
                                                                )#end of div_customerMarketing
                                                              )#end of shinyjs::hidden
                                                              
                                                              
                                             ),
                                             
                                             
                                             menuItem("Location Centric Insights", icon = icon("menu-hamburger",lib = "glyphicon"), tabName = "tab_locationInsights"),
                                             conditionalPanel("input.sidebar === 'tab_locationInsights'",
                                                              # uiOutput("selCountry"),
                                                              
                                                              
                                                              br(),
                                                              sliderInput("sliderNumOfProducts", "Select Number of Products:",
                                                                          min = 0, max = 20,
                                                                          value = 5),
                                                              br(),
                                                              hr(),
                                                              
                                                              shinyjs::hidden(
                                                                div(
                                                                  id="div_countryCampaign",
                                                                  
                                                                  
                                                                  h3("Marketing",style = "align:center;text-align:center;"),
                                                                  hr(style ="border-top: dotted 1px #FFFFFF"),
                                                                  # uiOutput("countryControls") %>% withSpinner(color =
                                                                  #                                              "#696969", type = 7),
                                                                  helpText("Note: Emails will be sent to all customers in selected", 
                                                                           br(),
                                                                           "Locations"),
                                                                  
                                                                  #uiOutput("productControls"),
                                                                  # choices=c('All','Netherlands','EIRE','Germany','France','Australia'),1),
                                                                  helpText("Note: Discounts will be applied only on selected products"),
                                                                  
                                                                  textAreaInput(
                                                                    "camCountryMessage",
                                                                    "Enter campaign text or offers to send: ",
                                                                    "Special Discount Offers!",
                                                                    "100%",
                                                                    "100px",
                                                                    resize = "vertical"
                                                                  ),
                                                                  actionButton("manualCountryCampaignEmail", "Launch Email Campaign",icon("envelope")),
                                                                  br(),
                                                                  br(),
                                                                  actionButton("manualCountryCampaignSms", "Launch SMS Campaign",icon("envelope")),
                                                                  br(),
                                                                  
                                                                  hr()
                                                                )#end of div_countryCampaign
                                                              )#end of shinyjs::hidden
                                                              
                                             ),
                                             menuItem("Product Insights", icon = icon("menu-hamburger",lib = "glyphicon"), tabName = "tab_productInsights"),
                                             conditionalPanel("input.sidebar === 'tab_productInsights'",
                                                              # uiOutput('productCountryControls') ,
                                                              helpText("Select product to view insights and trends related to the",
                                                                       br(),
                                                                       "product"),
                                                              hr (),
                                                              h3("Product Marketing",style = "align:center;text-align:center;"),
                                                              hr(style ="border-top: dotted 1px #FFFFFF"),
                                                              #uiOutput('ProductCountryMarketingFilter')%>% withSpinner(color =
                                                              #                                                          "#696969", type = 7),
                                                              textAreaInput(
                                                                'ProductCampaignText',
                                                                "Enter campaign text or offers to send: ",
                                                                "Special Discount Offers!",
                                                                "100%",
                                                                "100px",
                                                                resize = "vertical"
                                                              ),
                                                              shinyjs::hidden(
                                                                div(id="div_productAutoCampaign",
                                                                    
                                                                    actionButton(
                                                                      "ProductCampaign",
                                                                      "Launch Email Campaign",
                                                                      icon("envelope")
                                                                      
                                                                    ),
                                                                    hr(),
                                                                    actionButton(
                                                                      "ProductCampaignSms",
                                                                      "Launch SMS Campaign",
                                                                      icon("envelope")
                                                                    ),
                                                                    helpText(
                                                                      "Note: Selected product campaign will be launched", 
                                                                      br(),
                                                                      "targeting consumers of selected location via Email and", 
                                                                      br(),
                                                                      "SMS"
                                                                    )    
                                                                )#end of div_productAutoCampaign
                                                              )#end of shinyjs::hidden
                                                              
                                             )
                                 )
                                 
               ),
               dashboardBody(
                 useShinyjs(),
                 tags$head(
                   #tags$script(HTML("<script type='text/javascript' src='js/hoge.js'></script>")),
                   #HTML("<script type='text/javascript' src='js/script.js'></script>"),
                   tags$script(src="js/script.js"),
                   tags$style(
                   HTML(
                     '
                  /* javascript */
               


                   /* logo 
                   .skin-blue .main-header .logo {
                   background-color: rgb(255,255,255); color:        rgb(0,144,197);
                   font-weight: bold;font-size: 24px;text-align: Right;
                   }*/
                   
                   /* logo when hovered */
                   
                   .skin-blue .sidebar-menu > li.active > a,
                  .skin-blue .sidebar-menu > li:hover > a {
                   border-left-color:#ff0000;
                    font-color:#ffffff;
                    background-color:#0277BD;

                  }

                  .sidebar-collapse .left-side, .sidebar-collapse .main-sidebar{ 
                    transform: translate(0,0);
                     width: 40px;
                     }
                   ')
                 )
                 #tags$head(HTML("<script type='text/javascript' src='js/hoge.js'></script>"))
                 ),
                 tabItems(
                   tabItem(tabName = "tab_homePage",
                                  fluidRow(
                                    tags$div(href="#shiny-tab-tab_customerInsights", fluid = TRUE,
                                             width = 3, "data-toggle" = "tab",
                                             infoBox(value = "Go to Customer Insights",title = "Customer Insights")),
                                    tags$div(href="#shiny-tab-tab_productInsights", fluid = TRUE,
                                             width = 3, "data-toggle" = "tab",
                                             infoBox(value = "Go to Product Insights",title = "Product Insights")),
                                    tags$div(href="#shiny-tab-tab_locationInsights", fluid = TRUE,
                                             width = 3, "data-toggle" = "tab",
                                             infoBox(value = "Go to Location Insights",title = "Location Insights")),
                                    tags$div(href="#shiny-tab-tab_dayInsights", fluid = TRUE,
                                             width = 3, "data-toggle" = "tab",
                                             infoBox(value = "Go to Timeline Insights",title = "Timeline Insights"))
                                  )
                   ),
                                    
                   tabItem(tabName = "tab_dayInsights",
                           fluidRow(
                              # tags$div(href="#shiny-tab-tab_customerInsights", "data-toggle" = "tab",
                              #          infoBox(value = "Go to Tab2 (this works)",title = "Click me")),
                             box( fluid = TRUE,
                                  width = 6,
                                  title = "Daily Insights",
                                  footer = "Graph Displaying Per Day Revenue or Transaction",
                                  plotlyOutput('plotly_dayInsightsPlot1') %>% withSpinner(color = "#0dc5c1"),
                                  
                                  shinyjs::hidden
                                  (
                                  sliderInput("sliderDaterange",
                                              "Choose Date Range:",
                                              animate = TRUE,
                                              width = "100%",
                                              min = as.Date("2010-12-01"), max = as.Date("2011-12-09"),
                                              value = c(as.Date("2010-12-01"),as.Date("2011-12-09")))
                                  )
                             ),
                              box( fluid = TRUE,
                                   width = 6, collapsible = TRUE,
                                   plotlyOutput('plotly_dayInsightsPlot2') %>% withSpinner(color = "#0dc5c1")
                                   
                                #    shinyjs::hidden
                                # (
                                #     sliderInput("sliderDaterange2",
                                #            "Choose Date Range:",
                                #            animate = TRUE,
                                #            width = "100%",
                                #            min = as.Date("2010-12-01"), max = as.Date("2011-12-09"),
                                #            value = c(as.Date("2010-12-01"),as.Date("2011-12-09")))
                                #     )
                             ),
                             box(
                               width = 12,
                               plotlyOutput('sidePlot2') %>% withSpinner(color = "#0dc5c1")
                             )
                           )),
                   tabItem(tabName = "tab_customerInsights",
                           fluidRow(
                             box(
                               width = 12,
                               plotlyOutput('revenuePerCustomer') %>% withSpinner(color =
                                                                                    "#0dc5c1"),
                               
                               verbatimTextOutput("revenuePerCustomerClickInfo")
                             ),
                             box(
                               width = 12,
                               plotlyOutput('rfmGraphPlot') %>% withSpinner(color = "#0dc5c1")
                             )
                           )),
                   tabItem(tabName = "tab_locationInsights",
                           fluidRow(
                             box(width = 12,
                                 plotlyOutput("countryPlotly") %>% withSpinner(color =
                                                                                 "#0dc5c1")
                                 
                             ),
                             box(width = 12,
                                 plotlyOutput("countryTransPlotly") %>% withSpinner(color ="#0dc5c1")
                             ),
                             box(width=12,
                                 
                                 plotlyOutput("transactionPlotly") %>% withSpinner(color =
                                                                                     "#0dc5c1")
                                 
                                 
                             )
                           )),
                   tabItem(tabName = "tab_productInsights",
                           fluidRow(
                             box(width = 12,
                                 plotlyOutput('prodCountryGraph') %>% withSpinner(color =
                                                                                    "#0dc5c1")
                             ),
                             box(width = 12,
                                 plotlyOutput('prodCountryGraph1') %>% withSpinner(color =
                                                                                     "#0dc5c1")
                             ),
                             box(width = 12,
                                 h3("Map Displaying Revenue Generated Per Location",style = "align:center;text-align:center;text-shadow: 2px 2px #FFFFFF"),
                                 br(),
                                 leafletOutput("mymap1", width = "90%") %>% withSpinner(color =
                                                                                          "#0dc5c1")
                             )
                           ))
                   
                 )
               )
)
