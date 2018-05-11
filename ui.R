library(shinydashboard)

dashboardPage( 
                
               
               dashboardHeader(title = "Campaign Launch Demo", titleWidth = 350,tags$li(class = "dropdown",
                                                                                        actionButton("home", "Home", icon("house"),
                                                                                        style = "color: #FFF; background-color: Transparent; border-color: Transparent; font-size: 20px"))
                               
                               ),
               
               dashboardSidebar( width = 60, collapsed = TRUE,
                                 sidebarMenu(id = "sidebar",
                                             menuItem("", tabName = "tab_homePage", icon = icon("home","fa-2x",lib = "font-awesome")),
                                             menuItem("", tabName = "tab_dayInsights", icon = icon("calendar","fa-2x",lib = "font-awesome") ),
                                             
                                             
                                             
                                             menuItem("", icon = icon("users","fa-2x",lib = "font-awesome"), tabName = "tab_customerInsights"),
                                             
                                           
                                             menuItem("", icon = icon("globe","fa-2x",lib = "font-awesome"), tabName = "tab_locationInsights"),
                                             
                                             menuItem("", icon = icon("product-hunt","fa-2x",lib = "font-awesome"), tabName = "tab_productInsights"),
                                             menuItem("", icon = icon("product-hunt","fa-2x",lib = "font-awesome"), tabName = "tab_combinedInsights")
                                             
                                 )
                                 
               ),
               dashboardBody(
                 useShinyjs(),
                 tags$head(
                   tags$script(HTML("$('body').addClass('sidebar-mini');")),
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
            
                   .users2 {color: #FFF; font-size: 100px;}
                    .product-hunt2 {color: #FFF; font-size: 100px;}
                     .calendar2 {color: #FFF; font-size: 100px;}
                      .globe2 {color: #FFF;font-size: 100px;}
                        .small-box {height: 250px}
                   ')
                 )
                 
                 
                 ),
                 tabItems(
                   tabItem(tabName = "tab_homePage",
                           fluidRow(
                             # tags$div(href="#shiny-tab-tab_customerInsights", fluid = TRUE,
                             #          width = 3, "data-toggle" = "tab",
                             #          infoBox(value = "Go to Customer Insights",title = "Customer Insights")),
                             # tags$div(href="#shiny-tab-tab_productInsights", fluid = TRUE,
                             #          width = 3, "data-toggle" = "tab",
                             #          infoBox(value = "Go to Product Insights",title = "Product Insights")),
                             # tags$div(href="#shiny-tab-tab_locationInsights", fluid = TRUE,
                             #          width = 3, "data-toggle" = "tab",
                             #          infoBox(value = "Go to Location Insights",title = "Location Insights")),
                             # tags$div(href="#shiny-tab-tab_dayInsights", fluid = TRUE,
                             #          width = 3, "data-toggle" = "tab",
                             #          infoBox(value = "Go to Timeline Insights",title = "Timeline Insights")),
                             valueBoxOutput("box_01", width = 4)%>% withSpinner(color = "#0dc5c1") ,
                            
                             valueBoxOutput("box_02", width = 4) 
                           ),
                           br(),
                           br(),
                           fluidRow(
                             valueBoxOutput("box_03", width = 4) ,
                             
                             valueBoxOutput("box_04", width = 4)
                             
                             
                           )
                   ),
#########Day Insights Tab################

                   tabItem(tabName = "tab_dayInsights",
                           fluidRow(
                               box( fluid = TRUE,
                                  width = 6, status = "primary", collapsible = T, solidHeader = T,
                                  title = "Daily Insights",
                                  
                                  tabBox(width=12,id="tabBox_next_previous",
                                         tabPanel("Revenue",
                                                  plotlyOutput('plotly_dailyPlot_Revenue') %>% withSpinner(color = "#0dc5c1")
                                                  ,
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
                                         tabPanel("Transactions",
                                                  plotlyOutput('plotly_dailyPlot_Transactions') %>% withSpinner(color = "#0dc5c1"),
                                                  
                                                  shinyjs::hidden
                                                  (
                                                    sliderInput("slider_Daterange_Transactions",
                                                                "Choose Date Range:",
                                                                animate = TRUE,
                                                                width = "100%",
                                                                min = as.Date("2010-12-01"), max = as.Date("2011-12-09"),
                                                                value = c(as.Date("2010-12-01"),as.Date("2011-12-09")))
                                                  )
                                                  
                                                  
                                                  )
                                  )
                                  
                             ),
                              box( fluid = TRUE,  status = "primary", collapsible = T, solidHeader = T,
                                   width = 6,title = "Hourly Insights",
                                   
                                   tabBox(width=12,id="tabBox_hourly",
                                          tabPanel("Revenue",
                                                   plotlyOutput('plotly_hourlyPlot_Revenue') %>% withSpinner(color = "#0dc5c1"),
                                                   
                                                   shinyjs::hidden
                                                   (
                                                     sliderInput("slider_Daterange_HourlyR",
                                                                 "Choose Date Range:",
                                                                 animate = TRUE,
                                                                 width = "100%",
                                                                 min = as.Date("2010-12-01"), max = as.Date("2011-12-09"),
                                                                 value = c(as.Date("2010-12-01"),as.Date("2011-12-09")))
                                                   )
                                                   
                                          ),
                                          tabPanel("Transactions",
                                                   plotlyOutput('plotly_hourlyPlot_Transactions') %>% withSpinner(color = "#0dc5c1"),
                                                   
                                                   shinyjs::hidden
                                                   (
                                                     sliderInput("slider_Daterange_HourlyT",
                                                                 "Choose Date Range:",
                                                                 animate = TRUE,
                                                                 width = "100%",
                                                                 min = as.Date("2010-12-01"), max = as.Date("2011-12-09"),
                                                                 value = c(as.Date("2010-12-01"),as.Date("2011-12-09")))
                                                   )
                                                   
                                          )
                                   )
                                   
                             ),
                             box(
                               width = 6,  status = "primary", solidHeader = T, collapsible = T, title = "Overall Revenue Trend by Date",
                               plotlyOutput('sidePlot2') %>% withSpinner(color = "#0dc5c1")
                             ),
                             box(
                               width = 6,  status = "warning", solidHeader = T, collapsible = T, title = "Marketing",
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
                               
                               
                             )
                           )),#end of day tab
#########Customer Insights Tab################

                   tabItem(tabName = "tab_customerInsights",
                           fluidRow(
                             box(
                               width = 12,  status = "primary", collapsible = T, solidHeader = T, title = "Revenue per Customer",
                               sliderInput("numOfCustomers", "Number of Customers:",
                                           min = 0, max = 100,
                                           value = 20),
                               plotlyOutput('revenuePerCustomer') %>% withSpinner(color =
                                                                                    "#0dc5c1"),
                               
                               verbatimTextOutput("revenuePerCustomerClickInfo")
                             ),
                             box(
                               width = 8,  status = "primary", collapsible = T, solidHeader = T, title = "RFM Plot",
                               tabBox(width=8,id="tabBox_rfmPlot",
                                      tabPanel("Plots",
                                               
                                               uiOutput("customerRFMchoice") ,
                                               helpText(
                                                 "Note: Selecting a Classification will display graph of",
                                                 br(),
                                                 "customers of that class in all countries"
                                               ),
                                               plotlyOutput('rfmGraphPlot') %>% withSpinner(color = "#0dc5c1")
                                      ),#end of tabpanel
                                      
                                      tabPanel("Pie Chart",
                                               plotlyOutput('rfmGraphPieChart') %>% withSpinner(color = "#0dc5c1")
                                      )#end of tabpanel
                               ) #end of tabBox_rfmPlot
                               
                               
                             ),
                             box(
                               width = 4,  status = "warning", collapsible = T, solidHeader = T, title = "Marketing",
                               shinyjs::hidden(
                                 div(
                                   id="div_personalizedCampaign",
                                   br(),
                                   actionButton(
                                     "cusPersonalizedCampaignEmail",
                                     "Personalised Email Campaign",
                                     icon("envelope"),width = '100%'
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
                                     icon("envelope"),width = '100%'
                                   ),
                                   helpText(
                                     "Note: Selecting this button will launch an SMS Campaign",
                                     br(),
                                     "for top Customers"
                                   )
                                 )),

                                   br(),
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
                                           
                                           actionButton("manualSmsCampaignCustomer",
                                                        "Launch SMS Campaign", icon("envelope"),
                                                         width = '100%'  ),
                                           hr()
                                           
                                           
                                         ),
                                         
                                         
                                         conditionalPanel(
                                           condition = "input.CustomerMarketingChoice == 'emailMarketing'",
                                           
                                           textAreaInput(
                                             "textEmailMarketing",
                                             "Enter campaign text or offers to send: ",
                                             "Special Discount Offers!",
                                             "100%",
                                             "100px",
                                             resize = "vertical"
                                           ),
                                           actionButton("manualEmailCampaignCustomer", "Launch Email Campaign",  icon("envelope"), width = '100%'),
                                           hr()
                                           
                                         )      
                                         
                                     )#end of div_customerMarketing
                                   )#end of shinyjs::hidden
                              

                               
                             )
                           )),#end of customer insight tab
#########Location Insights Tab################

                   tabItem(tabName = "tab_locationInsights",
                           fluidRow(
                             box(width = 12,  status = "primary", collapsible = T, solidHeader = T, title = "Revenue by Location over Time",
                                 plotlyOutput("countryPlotly") %>% withSpinner(color =
                                                                                 "#0dc5c1")
                                 
                             ),
                             box(width = 12, title = "Top Products in Selected Location", status = "primary", collapsible = T, solidHeader = T,
                                 uiOutput("selCountry"),
                                 
                                 
                                 br(),
                                 sliderInput("sliderNumOfProducts", "Select Number of Products:",
                                             min = 0, max = 20,
                                             value = 5),
                                 br(),
                                 hr(),
                                 plotlyOutput("countryTransPlotly") %>% withSpinner(color ="#0dc5c1")
                             ),
                             
                             box(width = 12,  title = "Map Displaying Revenue Generated Per Location", status = "primary", collapsible = T, solidHeader = T,
                                 br(),
                                 leafletOutput("mymap", width = "90%") %>% withSpinner(color =
                                                                                          "#0dc5c1")
                             ),
                             box(width = 6, status = "warning", collapsible = T, solidHeader = T, title = "Marketing",
                                 shinyjs::hidden(
                                   div(
                                     id="div_countryCampaign",
                                     
                                     
                                     h3("Marketing",style = "align:center;text-align:center;"),
                                     hr(style ="border-top: dotted 1px #FFFFFF"),
                                     uiOutput("countryControls"),
                                     helpText("Note: Emails will be sent to all customers in selected", 
                                              br(),
                                              "Locations"),
                                     
                                     uiOutput("productControls"),
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
                             )
                           )),
#########Product Insights Tab################

                   tabItem(tabName = "tab_productInsights",
                           fluidRow(
                             box(width = 12, title = "Top 10 Revenue Generating Products", status = "primary", collapsible = T, solidHeader = T,
                                 plotlyOutput('prodCountryGraph') %>% withSpinner(color =
                                                                                    "#0dc5c1")
                             ),
                             box(width = 12, title = "Revenue of Product in Selected Location", status = "primary", collapsible = T, solidHeader = T,
                                 plotlyOutput('prodCountryGraph1') %>% withSpinner(color =
                                                                                     "#0dc5c1")
                             ),
                             box(width = 12, title = "Map Displaying Revenue Generated Per Location", status = "primary", collapsible = T, solidHeader = T,
                                 #h3("Map Displaying Revenue Generated Per Location",style = "align:center;text-align:center;text-shadow: 2px 2px #FFFFFF"),
                                 br(),
                                 leafletOutput("mymap1", width = "90%") %>% withSpinner(color =
                                                                                          "#0dc5c1")
                             ),
                             box(width = 12, status = "warning", collapsible = T, solidHeader = T, title = "Marketing",
                                 uiOutput('productCountryControls') ,
                                 helpText("Select product to view insights and trends related to the",
                                          br(),
                                          "product"),
                                 hr (),
                                 h3("Product Marketing",style = "align:center;text-align:center;"),
                                 hr(style ="border-top: dotted 1px #FFFFFF"),
                                 uiOutput('ProductCountryMarketingFilter'),
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
                                         icon("envelope"),
                                         style = "color: #fff; background-color: #337ab7; border-color: #2e6da4; width: 100%; padding-left: 2dp: margin: 5dp;"
                                         
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
                           )),
#########Combined Insights Tab################

tabItem(tabName = "tab_combinedInsights",fluidRow(
  
        box(width = 12, title = "Select Date Range To View Data", status = "primary", collapsible = T, solidHeader = T,
            shinyjs::hidden
            (
              sliderInput("slider_comb",
                          "Choose Date Range:",
                          animate = TRUE,
                          width = "100%",
                          min = as.Date("2010-12-01"), max = as.Date("2011-12-09"),
                          value = c(as.Date("2010-12-01"),as.Date("2011-12-09")))
            )
            ),
  
        box(width = 12, title = "Top 10 Revenue Generating Products", status = "primary", collapsible = T, solidHeader = T,
                                                      plotlyOutput('prodCountryGraphComb') %>% withSpinner(color =
                                                                                                         "#0dc5c1")),
        box(width = 12,  status = "primary", collapsible = T, solidHeader = T, title = "Revenue by Location over Time",
            plotlyOutput("countryPlotlyComb") %>% withSpinner(color =
                                                            "#0dc5c1")),
        
        box(width = 10, status = "primary", collapsible = T, solidHeader = T, title = "Top 10 Revenue Generating Customers",
            plotlyOutput("revenuePerCustomerComb") %>% withSpinner(color =
                                                                    "#0dc5c1"),
            verbatimTextOutput("revenuePerCustomerClickInfoComb")
            
            ),
        box(width = 10, status = "primary", collapsible = T, solidHeader = T, title = "Overall Revenue by WeekDays",
            plotlyOutput('plotly_dailyPlot_RevenueComb') %>% withSpinner(color = 
                                                                           "#0dc5c1")
    
            ),
        box(width = 10, status = "primary", collapsible = T, solidHeader = T, title = "Overall Revenue by HourOfDay",
            plotlyOutput('plotly_hourlyPlot_RevenueComb') %>% withSpinner(color = "#0dc5c1")
            
            )
        
        
)
        
        
        
)
                   
                 )
               )
)
