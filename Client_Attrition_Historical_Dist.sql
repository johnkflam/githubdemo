Select [D_OWNER].[owner_business_unit] as "AcctOwn - Owner Business Unit"
              ,[D_OWNER].[owner_division] as "AcctOwn - Owner Division"
              ,[D_OWNER].[owner_theater] as "AcctOwn - Owner Theater"
              ,[D_OWNER].[owner_region] as "AcctOwn - Owner Region"
              ,[D_OWNER].[owner_team] as "AcctOwn - Owner Team"
              ,[D_OWNER].[owner_name] as "AcctOwn - Owner Name"
              ,[D_OWNER].[owner_market] as "AcctOwn - Owner Market"
              ,[Second Account Owner].[owner_business_unit] as "2ndAcctOwn - 2nd Owner Business Unit"
              ,[Second Account Owner].[owner_division] as "2ndAcctOwn - 2nd Owner Division"
              ,[Second Account Owner].[owner_theater] as "2ndAcctOwn - 2nd Owner Theater"
              ,[Second Account Owner].[owner_region] as "2ndAcctOwn - 2nd Owner Region"
              ,[Second Account Owner].[owner_team] as "2ndAcctOwn - 2nd Owner Team"
              ,[Second Account Owner].[owner_name] as "2ndAcctOwn - 2nd Owner Name"
              ,[Second Account Owner].[owner_market] as "2ndAcctOwn - 2nd Owner Market"
              ,[D_CLIENT].[account_site] as "D_Client - Account Site"
              ,[D_CLIENT].[account_type] as "D_Client - Account Type"
              ,[D_CLIENT].[client] as "D_Client - Client Name"
              ,[D_CLIENT].[client_sid] as "D_Client - Client SID"
              ,[D_CLIENT].[core_service_date] as "D_Client - Core Service Date"
              ,[D_CLIENT].[contract_renew_date] as "D_Client - Contract Renew Date"
              ,[D_CLIENT].[customer_since_date] as "D_Client - Customer Since Date"
              ,[D_CLIENT].[employees_at_location_cnt] as "D_Client - Employees at Location"
              ,[D_CLIENT].[employee_worldwide_cnt] as "D_Client - Employees Worldwide"
              ,[D_CLIENT].[vertical] as "D_Client - Account Vertical"
              ,[D_CLIENT].[SFA_ID_18_digit] as "D_Client - SalesForce Account 18 Digit ID"
              ,[D_CLIENT].[core_service_date] as "Acct - CST Date"           
              ,[D_CLIENT].[contract_term_status] as "Acct - Contract Term Status"
              ,[D_CLIENT].[d_b_employees_at_location] as "Acct - D&B Employees at Location"
              ,[D_CLIENT].[d_b_employees_worldwide] as "Acct - D&B Employees Worldwide"
			  ,[D_CLIENT].[transitioned_to_CD_date]
			  ,[d_AccountOwnerHistory].[SFA_ID_18_digit] as [AcctHistory - Account ID]
			  ,[d_AccountOwnerHistory].[account_name] as [AcctHistory - Account Name]
			  ,[d_AccountOwnerHistory].[vertical] as [AcctHistory - Account Vertical]
			  ,[d_AccountOwnerHistory].[D&B_employees_at_location] as [AcctHistory - D&B Employees at Location]
			  ,[d_AccountOwnerHistory].[D&B_employees_worldwide] as [AcctHistory - D&B Employees Worldwide]
			  ,[d_AccountOwnerHistory].[employees_at_location] as [AcctHistory - Employees at Location]
			  ,[d_AccountOwnerHistory].[employees_worldwide] as [AcctHistory - Employees Worldwide]
			  ,[d_AccountOwnerHistory].[contract_term_status] as [AcctHistory - Contract Term Status]
			  ,[d_AccountOwnerHistory].[owner_business_unit] as [AcctHistory - Account Owner Business Unit]
			  ,[d_AccountOwnerHistory].[owner_theater] as [AcctHistory - Account Owner Theater]
			  ,[d_AccountOwnerHistory].[owner_market] as [AcctHistory - Account Owner Market]
			  ,[d_AccountOwnerHistory].[owner_division] as [AcctHistory - Account Owner Division]
			  ,[d_AccountOwnerHistory].[owner_team] as [AcctHistory - Account Owner Team]
			  ,[d_AccountOwnerHistory].[owner_region] as [AcctHistory - Account Owner Region]
			  ,[d_AccountOwnerHistory].[owner_name] as [AcctHistory - Account Owner]
			  ,[d_AccountOwnerHistory].[second_owner_business_unit] as [AcctHistory - 2nd Account Owner Business Unit]
			  ,[d_AccountOwnerHistory].[second_owner_theater] as [AcctHistory - 2nd Account Owner Theater]
			  ,[d_AccountOwnerHistory].[second_owner_market] as [AcctHistory - 2nd Account Owner Market]
			  ,[d_AccountOwnerHistory].[second_owner_division] as [AcctHistory - 2nd Account Owner Division]
			  ,[d_AccountOwnerHistory].[second_owner_team] as [AcctHistory - 2nd Account Owner Team]
			  ,[d_AccountOwnerHistory].[second_owner_region] as [AcctHistory - 2nd Account Owner Region]
			  ,[d_AccountOwnerHistory].[second_owner_name] as [AcctHistory - 2nd Account Owner]
			  ,[d_AccountOwnerHistory].[service_account_team] as [AcctHistory - Service Account Team]
              ,[Term_Notice].[term_notice] as "OrigOpp - Term Notice"
              ,[First Day in Quarter].[First Day in Quarter]
              ,[Max Subscription End Date - Client].[Max Subscription End Date] as "Max End Date - Client"
              ,[Max Subscription End Date - Client].[Min Subscription Start Date] as "Min Start Date - Client"
			-- [Legacy Edition]
              ,SUM(
				CASE
				WHEN [D_PRODUCT_CATALOG].[po_name] In ('CES Plus - 3'
														,'Captura Expense'
														,'CES Advantage - 3'
														,'CES Premier - 3'
														,'CES Pro - 2'
														,'CES - 3'
														,'CES with Travel Booking'
														,'ASP Expense'
														,'ASP Expense Offline'
														,'UK CES Pro Offline'
														,'CES Pro (Expense Reporting and Travel Booking)'
														,'CES Plus in arrears'
														,'CES in arrears'
														,'CES with Travel Booking in arrears'
														,'ASP Expense in arrears'
														,'ASP Expense Offline in arrears'
														,'CES Pro in arrears'
														,'CES Pro (Expense Reporting and Travel Booking) in arrears'
														,'Captura Expense in arrears')
				THEN 1
				END) as [Legacy Edition]
			-- [Premium Edition]
			  ,SUM(
				CASE
				WHEN [D_PRODUCT_CATALOG].[po_name] In ('Expense - Premium Implementation'
														,'Travel & Expense - Premium Implementation'
														,'Travel & Expense - Premium Implementation in arrears'
														,'Expense - Premium Implementation in arrears'
														,'Expense with TripLink - Premium'
														,'Travel & Expense with TripLink - Premium'
														,'JV Travel & Expense - Premium Implementation in arrears'
														,'Invoice Processing - Premium Implementation')
				THEN 1
				END) as [Premium Edition]
			-- [Professional Edition]
			  ,SUM(
				CASE
				WHEN [D_PRODUCT_CATALOG].[po_name] In ('Expense - Professional Implementation'
														,'Professional Expense - EMEA Expansion'
														,'Travel & Expense - Professional Implementation'
														,'Professional Expense - APA Expansion'
														,'Travel & Expense - Professional Implementation in arrears'
														,'Expense - Professional Implementation in arrears'
														,'Full Professional Rollout'
														,'Professional Plus Implementation - Higher Ed'
														,'Expense with TripLink - Professional'
														,'Travel & Expense with TripLink - Professional'
														,'Expense Standard and Travel Professional Implementation'
														,'Expense with TripLink - Professional with Pre-Prod fees'
														,'Travel & Expense with TripLink - Professional with Pre-Prod fees'
														,'Invoice Processing - Professional Implementation'
														,'JV Invoice Processing - Professional Implementation')
				THEN 1
				END) as [Professional Edition]
			-- [Standard Edition]	
			  ,SUM(
				CASE
				WHEN [D_PRODUCT_CATALOG].[po_name] In ('Expense - Standard Implementation'
														,'Standard Expense Expansion'
														,'Travel & Expense - Standard Implementation'
														,'Concurforce'
														,'Travel & Expense - Concurforce'
														,'Concur Emerging Market - Expense'
														,'Expense - Standard Implementation in arrears'
														,'Travel & Expense - Standard Implementation in arrears'
														,'JV Concur Expense - Asia Pac Edition SCD'
														,'JV Concur Expense'
														,'JV Concur Travel & Expense - Asia Pac Edition SCD'
														,'JV Concur Expense in arrears'
														,'JV Concur Travel & Expense - Asia Pac Edition SCD in arrears'
														,'Expense with TripLink - Standard'
														,'Expense with TripLink - Concurforce'
														,'Travel & Expense with TripLink - Standard'
														,'Travel & Expense with TripLink - Concurforce'
														,'Invoice Processing - Standard Implementation'
														,'Invoice Processing - Concurforce')
				THEN 1
				END) as [Standard Edition]
		-- [account_charge_frequency]
              ,MIN(
				Case
				When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then 1
				When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then 2
				When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then 4
				Else 12
				END) as [account_charge_frequency]
              ,min([D_SUBSCRIPTION].[subscription_start_date]) as "D_SUB - Subscription Start Date"
              ,max([D_SUBSCRIPTION].[subscription_end_date]) as "D_SUB - Subscription End Date"
              ,max([F_SUBSCRIPTION_RAMP].[base_commitment]) as "F_SUB_RAMP - Base Commitment"
              ,sum([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt]) as "F_SUB_RAMP - Rev Rec Rate Amt"
              ,sum([F_SUBSCRIPTION_RAMP].[cust_rate_amt]) as "F_SUB_RAMP - Cust Rate Amt"
              ,sum([F_SUBSCRIPTION_RAMP].[list_price_amt]) as "F_SUB_RAMP - List Price Amt"
          -- [Monthly Base Commitment]
              ,max(
			  CASE
				WHEN [D_PRODUCT_CATALOG].[po_name] In ('Expense - Standard Implementation'
														,'Standard Expense Expansion'
														,'Travel & Expense - Standard Implementation'
														,'Concurforce'
														,'Travel & Expense - Concurforce'
														,'Concur Emerging Market - Expense'
														,'Expense - Standard Implementation in arrears'
														,'Travel & Expense - Standard Implementation in arrears'
														,'JV Concur Expense - Asia Pac Edition SCD'
														,'JV Concur Expense'
														,'JV Concur Travel & Expense - Asia Pac Edition SCD'
														,'JV Concur Expense in arrears'
														,'JV Concur Travel & Expense - Asia Pac Edition SCD in arrears'
														,'Expense with TripLink - Standard'
														,'Expense with TripLink - Concurforce'
														,'Travel & Expense with TripLink - Standard'
														,'Travel & Expense with TripLink - Concurforce'
														,'Invoice Processing - Standard Implementation'
														,'Invoice Processing - Concurforce'
														,'Expense - Professional Implementation'
														,'Professional Expense - EMEA Expansion'
														,'Travel & Expense - Professional Implementation'
														,'Professional Expense - APA Expansion'
														,'Travel & Expense - Professional Implementation in arrears'
														,'Expense - Professional Implementation in arrears'
														,'Full Professional Rollout'
														,'Professional Plus Implementation - Higher Ed'
														,'Expense with TripLink - Professional'
														,'Travel & Expense with TripLink - Professional'
														,'Expense Standard and Travel Professional Implementation'
														,'Expense with TripLink - Professional with Pre-Prod fees'
														,'Travel & Expense with TripLink - Professional with Pre-Prod fees'
														,'Invoice Processing - Professional Implementation'
														,'JV Invoice Processing - Professional Implementation'
														,'Expense - Premium Implementation'
														,'Travel & Expense - Premium Implementation'
														,'Travel & Expense - Premium Implementation in arrears'
														,'Expense - Premium Implementation in arrears'
														,'Expense with TripLink - Premium'
														,'Travel & Expense with TripLink - Premium'
														,'JV Travel & Expense - Premium Implementation in arrears'
														,'Invoice Processing - Premium Implementation'
														,'CES Plus - 3'
														,'Captura Expense'
														,'CES Advantage - 3'
														,'CES Premier - 3'
														,'CES Pro - 2'
														,'CES - 3'
														,'CES with Travel Booking'
														,'ASP Expense'
														,'ASP Expense Offline'
														,'UK CES Pro Offline'
														,'CES Pro (Expense Reporting and Travel Booking)'
														,'CES Plus in arrears'
														,'CES in arrears'
														,'CES with Travel Booking in arrears'
														,'ASP Expense in arrears'
														,'ASP Expense Offline in arrears'
														,'CES Pro in arrears'
														,'CES Pro (Expense Reporting and Travel Booking) in arrears'
														,'Captura Expense in arrears')
			  THEN
			  Case
              When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then [F_SUBSCRIPTION_RAMP].[base_commitment] / 12
              When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then [F_SUBSCRIPTION_RAMP].[base_commitment] / 6
              When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then [F_SUBSCRIPTION_RAMP].[base_commitment] / 3
              Else [F_SUBSCRIPTION_RAMP].[base_commitment]
              End
			  END) as [Monthly Base Commitment]
		-- [Rev Rec Monthly USD]
              ,sum(Case
              When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
              When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
              When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
              Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
              End) as [Rev Rec Monthly USD]
        -- [Client Upsell / Downsell]
                      ,case
                      WHEN ([Max Subscription End Date - Client].[Max Subscription End Date] >= [First Day in Quarter].[First Day in Quarter]
							AND [Max Subscription End Date - Client].[Max Subscription End Date] < DATEADD(q, 1, [First Day in Quarter].[First Day in Quarter]))
							OR (lead([First Day in Quarter].[First Day in Quarter] ,1) over(partition by [D_CLIENT].[client_sid] order by [First Day in Quarter])
								<> DATEADD(q,1,[First Day in Quarter].[First Day in Quarter]))
					  then 'Complete Loss'
                      WHEN (lag (sum([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt]) ,1) over(partition by [D_CLIENT].[client_sid] order by [First Day in Quarter]) is null)
							or (lag ([First Day in Quarter].[First Day in Quarter] ,1) over(partition by [D_CLIENT].[client_sid] order by [First Day in Quarter]) <>
								DATEADD(q,-1,[First Day in Quarter].[First Day in Quarter]))
					  then 'Complete Gain'
                      WHEN sum(Case
                               When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
                               End)
                            < lead (sum(Case
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
                                       End),1)
									over(partition by [D_CLIENT].[client_sid] order by [First Day in Quarter]) -5
					  then 'Partial Gain'
                      WHEN sum(Case
                               When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
                               End)
                             > lead (sum(Case
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
                                        End),1)
									over(partition by [D_CLIENT].[client_sid] order by [First Day in Quarter]) +5
					  then 'Partial Loss'
                      Else 'No Change'
                      END as [Client Upsell / Downsell]              
                      ,Case
                      WHEN lag (sum([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]),1)
							over(partition by [D_CLIENT].[client_sid] order by [First Day in Quarter]) is null
                      Then 0
                      WHEN sum([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]) is null
                      Then 0
                      WHEN sum(Case
                               When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
                               End)
                           < (lead (sum(Case
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
                                       End),1)
									over(partition by [D_CLIENT].[client_sid] order by [First Day in Quarter]) - 5)
                       Then lead (sum(Case
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
										End),1)
									over(partition by [D_CLIENT].[client_sid] order by [First Day in Quarter])
								-
									sum(Case
									When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
									When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
									When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
									Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
									End)
						WHEN sum(Case
                               When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
							   Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
                                 End)
							> (lead (sum(Case
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
                                        End),1)
									over(partition by [D_CLIENT].[client_sid] order by [First Day in Quarter]) + 5)
                         Then  sum(Case
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
										End)
						 -
						 lead (sum(Case
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 12) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Semi-Annually' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 6) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										When [D_SUBSCRIPTION].[account_charge_frequency] = 'Quarterly' Then ([F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / 3) / [LK_SFDC_EXCH_RATE].[conversion_rate]
										Else [F_SUBSCRIPTION_RAMP].[rev_rec_rate_amt] / [LK_SFDC_EXCH_RATE].[conversion_rate]
										End),1)
									over(partition by [D_CLIENT].[client_sid] order by [First Day in Quarter])
						 Else 0
						 END as [Client Upsell / Downsell Amt Monthly USD]
From [edw_direct].[Client360].[D_SUBSCRIPTION]
Inner Join [edw_direct].[Client360].[F_SUBSCRIPTION_RAMP] on [D_SUBSCRIPTION].[subscription_sid] = [F_SUBSCRIPTION_RAMP].[subscription_sid]
Inner Join [edw_direct].[Client360].[D_CLIENT] on [F_SUBSCRIPTION_RAMP].[client_sid] = [D_CLIENT].[client_sid]
Inner join [edw_direct].[Client360].[LK_SFDC_EXCH_RATE] on [D_SUBSCRIPTION].[billing_currency] = [LK_SFDC_EXCH_RATE].[from_currency]
Inner Join [edw_direct].[Client360].[D_PRODUCT_CATALOG] on [F_SUBSCRIPTION_RAMP].[product_cat_sid] = [D_PRODUCT_CATALOG].[product_cat_sid]
Left Join [edw_direct].[Client360].[D_OWNER] on [D_CLIENT].[account_owner_sid] = [D_OWNER].[owner_sid]
Left Join [edw_direct].[Client360].[D_OWNER] [Second Account Owner] on [D_CLIENT].[second_account_owner_sid] = [Second Account Owner].[owner_sid]
Left Join(
	Select Max([D_SUBSCRIPTION].[subscription_end_date]) as [Max Subscription End Date]
              ,Min([D_SUBSCRIPTION].[subscription_start_date]) as [Min Subscription Start Date]
              ,[D_SUBSCRIPTION].[client_sid]
       From [edw_direct].[Client360].[D_SUBSCRIPTION]
       Inner Join [edw_direct].[Client360].[F_SUBSCRIPTION_RAMP] on [D_SUBSCRIPTION].[subscription_sid] = [F_SUBSCRIPTION_RAMP].[subscription_sid]
       Inner Join [edw_direct].[Client360].[D_PRODUCT_CATALOG] on [F_SUBSCRIPTION_RAMP].[product_cat_sid] = [D_PRODUCT_CATALOG].[product_cat_sid]
       Where         [D_PRODUCT_CATALOG].[pi_item_type] = 'Base'
                     and [F_SUBSCRIPTION_RAMP].[is_final_ramp] = 'Y'
                     and [D_SUBSCRIPTION].[subscription_end_date] >= '09-01-2014'
					 and [D_PRODUCT_CATALOG].[po_name] Not In ('Travel - Professional Implementation'
                                                                           ,'Travel - Standard Implementation'
                                                                           ,'TravelTrx'
                                                                           ,'TravelTrax'
                                                                           ,'Correx in Arrears'
                                                                           ,'TravelTrax in Arrears')
       Group by [D_SUBSCRIPTION].[client_sid]
       ) [Max Subscription End Date - Client]
On [D_CLIENT].[client_sid] = [Max Subscription End Date - Client].[client_sid]
Left Join
  (
              Select [client_sid]
                     ,[term_notice]
              From(
                           Select [term_notice],
                                  [client_sid],
                                  Row_Number () OVER (Partition By [client_sid] Order BY max([close_date]) desc) as [RowNumber]
                           From [edw_direct].[Client360].[D_OPPORTUNITY_V]
                           Where [term_notice] <> ''
                                 and [opportunity_type] = 'New Business'
                                 and [stage] = 'Closed Won'
                           Group By [term_notice],
                                    [client_sid]
              ) [Test]
              Where [RowNumber] = 1
              Group By [client_sid]
                       ,[term_notice]
  ) [Term_Notice] On [Term_Notice].[client_sid] = [D_CLIENT].[client_sid]
Inner Join
  (  
              Select Min([calendar_date]) as [First Day in Quarter]
                           ,[fiscal_quarter_short_name]
             From [edw_direct].[Client360].[D_TIME]
              Where [calendar_date] >= '09-01-2014'
              Group by [fiscal_quarter_short_name]
  ) [First Day in Quarter]
  On [D_SUBSCRIPTION].[subscription_start_date] <= [First Day in Quarter].[First Day in Quarter]
       and [D_SUBSCRIPTION].[subscription_end_date] > [First Day in Quarter].[First Day in Quarter]
Left Join(
	Select *
	FROM [bi_data].[common].[d_AccountOwnerHistory]
	INNER JOIN (
		     Select Min([calendar_date]) as [First Day in Quarter - AccountHistory]
                           ,[fiscal_quarter_short_name]
             From [edw_direct].[Client360].[D_TIME]
              Where [calendar_date] >= '09-01-2014'
              Group by [fiscal_quarter_short_name]
	) [Quarter] On DATEPART(m,
					CASE
					WHEN [d_AccountOwnerHistory].[snapshot_date] = '2016-02-07'
					THEN '2016-01-07'
					ELSE [d_AccountOwnerHistory].[snapshot_date]
					END) = DATEPART(m,[Quarter].[First Day in Quarter - AccountHistory])
					AND DATEPART(yy,[d_AccountOwnerHistory].[snapshot_date]) = DATEPART(yy,[Quarter].[First Day in Quarter - AccountHistory])
	WHERE [d_AccountOwnerHistory].[snapshot_date] <> '2016-01-15'
	) [d_AccountOwnerHistory] On [D_CLIENT].[SFA_ID_18_digit] = [d_AccountOwnerHistory].[SFA_ID_18_digit]
								AND [First Day in Quarter].[First Day in Quarter] = [d_AccountOwnerHistory].[beginning_of_quarter_date]
Where [D_PRODUCT_CATALOG].[pi_item_type] = 'Base'
and [F_SUBSCRIPTION_RAMP].[is_final_ramp] = 'Y'
and [D_SUBSCRIPTION].[subscription_end_date] >= '09-01-2014'
and [D_OWNER].[owner_market] <> 'Japan'
and [D_CLIENT].[account_site] like '%billing%'                                                                                                                           
and [D_SUBSCRIPTION].[is_indirect_ind] = 0
Group by [D_OWNER].[owner_business_unit]
              ,[D_OWNER].[owner_division]
              ,[D_OWNER].[owner_theater] 
              ,[D_OWNER].[owner_region] 
              ,[D_OWNER].[owner_team]
              ,[D_OWNER].[owner_name]
              ,[D_OWNER].[owner_market]
              ,[Second Account Owner].[owner_business_unit]
              ,[Second Account Owner].[owner_division]
              ,[Second Account Owner].[owner_theater]
              ,[Second Account Owner].[owner_region]
              ,[Second Account Owner].[owner_team]
              ,[Second Account Owner].[owner_name]
              ,[Second Account Owner].[owner_market]
              ,[D_CLIENT].[account_site]
              ,[D_CLIENT].[account_type]
              ,[D_CLIENT].[client]
              ,[D_CLIENT].[client_sid]
              ,[D_CLIENT].[core_service_date]
              ,[D_CLIENT].[contract_renew_date]
              ,[D_CLIENT].[customer_since_date]
              ,[D_CLIENT].[currency_code]
              ,[D_CLIENT].[employees_at_location_cnt]
              ,[D_CLIENT].[employee_worldwide_cnt]
              ,[D_CLIENT].[vertical]
              ,[D_CLIENT].[parent]
              ,[D_CLIENT].[parent_id]
              ,[D_CLIENT].[SFA_ID_18_digit]
              ,[D_CLIENT].[program_type]
              ,[D_CLIENT].[core_service_date]     
              ,[D_CLIENT].[pi_program_date]
              ,[D_CLIENT].[renewal_program]
              ,[D_CLIENT].[oot_deferral_reason]
              ,[D_CLIENT].[oot_deferral_decision]
              ,[D_CLIENT].[pi_letter_sent_date]
              ,[D_CLIENT].[last_price_increase]
              ,[D_CLIENT].[contract_renew_date]
              ,[D_CLIENT].[contract_term_status]
              ,[D_CLIENT].[edition]
              ,[D_CLIENT].[d_b_employees_at_location]
              ,[D_CLIENT].[d_b_employees_worldwide]
			  ,[D_CLIENT].[transitioned_to_CD_date]
			  ,[d_AccountOwnerHistory].[SFA_ID_18_digit]
			  ,[d_AccountOwnerHistory].[account_name]
			  ,[d_AccountOwnerHistory].[vertical]
			  ,[d_AccountOwnerHistory].[D&B_employees_at_location]
			  ,[d_AccountOwnerHistory].[D&B_employees_worldwide]
			  ,[d_AccountOwnerHistory].[employees_at_location]
			  ,[d_AccountOwnerHistory].[employees_worldwide]
			  ,[d_AccountOwnerHistory].[contract_term_status]
			  ,[d_AccountOwnerHistory].[owner_business_unit]
			  ,[d_AccountOwnerHistory].[owner_theater]
			  ,[d_AccountOwnerHistory].[owner_market]
			  ,[d_AccountOwnerHistory].[owner_division]
			  ,[d_AccountOwnerHistory].[owner_team]
			  ,[d_AccountOwnerHistory].[owner_region]
			  ,[d_AccountOwnerHistory].[owner_name]
			  ,[d_AccountOwnerHistory].[second_owner_business_unit]
			  ,[d_AccountOwnerHistory].[second_owner_theater]
			  ,[d_AccountOwnerHistory].[second_owner_market]
			  ,[d_AccountOwnerHistory].[second_owner_division]
			  ,[d_AccountOwnerHistory].[second_owner_team]
			  ,[d_AccountOwnerHistory].[second_owner_region]
			  ,[d_AccountOwnerHistory].[second_owner_name]
			  ,[d_AccountOwnerHistory].[service_account_team]
              ,[Term_Notice].[term_notice]
              ,[First Day in Quarter].[First Day in Quarter]
              ,[Max Subscription End Date - Client].[Max Subscription End Date]
              ,[Max Subscription End Date - Client].[Min Subscription Start Date]
--) [all sql]
