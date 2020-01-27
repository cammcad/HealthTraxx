alias Storage.Procedure.PollProcedureConfiguration
alias Storage.Reimbursement.Pumana.Reimbursement, as: Pumana_Reimbursement
alias Storage.Reimbursement.Dcds.Reimbursement, as: Dcds_Reimbursement
alias Storage.Reimbursement.Sigma.Reimbursement, as: Sigma_Reimbursement

# Seed Procedure Configurations (when to poll for procedure reimbursement amount)
%PollProcedureConfiguration{procedure_name: "Hip Replacement", poll_interval: 60000}
|> PollProcedureConfiguration.changeset
|> Storage.Relational.insert

%PollProcedureConfiguration{procedure_name: "Liver Transplant", poll_interval: 120000}
|> PollProcedureConfiguration.changeset
|> Storage.Relational.insert

%PollProcedureConfiguration{procedure_name: "Lobotomy", poll_interval: 180000}
|> PollProcedureConfiguration.changeset
|> Storage.Relational.insert

%PollProcedureConfiguration{procedure_name: "Arm Amputation", poll_interval: 240000}
|> PollProcedureConfiguration.changeset
|> Storage.Relational.insert

%PollProcedureConfiguration{procedure_name: "Appendix Removal", poll_interval: 240000}
|> PollProcedureConfiguration.changeset
|> Storage.Relational.insert

%PollProcedureConfiguration{procedure_name: "Triple Bypass", poll_interval: 240000}
|> PollProcedureConfiguration.changeset
|> Storage.Relational.insert

# Seed Payor Reimbursements

### PUMANA
%Pumana_Reimbursement{procedure_name: "Hip Replacement", reimbursement_amount: 39.99}
|> Pumana_Reimbursement.changeset
|> Storage.Relational.insert

%Pumana_Reimbursement{procedure_name: "Liver Transplant", reimbursement_amount: 452.65}
|> Pumana_Reimbursement.changeset
|> Storage.Relational.insert

%Pumana_Reimbursement{procedure_name: "Lobotomy", reimbursement_amount: 0}
|> Pumana_Reimbursement.changeset
|> Storage.Relational.insert

%Pumana_Reimbursement{procedure_name: "Arm Amputation", reimbursement_amount: 1.57}
|> Pumana_Reimbursement.changeset
|> Storage.Relational.insert

%Pumana_Reimbursement{procedure_name: "Appendix Removal", reimbursement_amount: 26.98}
|> Pumana_Reimbursement.changeset
|> Storage.Relational.insert

%Pumana_Reimbursement{procedure_name: "Triple Bypass", reimbursement_amount: 111.68}
|> Pumana_Reimbursement.changeset
|> Storage.Relational.insert

### DCDS
%Dcds_Reimbursement{procedure_name: "Hip Replacement", procedure_id: "some-long-string", refund: 41.99}
|> Dcds_Reimbursement.changeset
|> Storage.Relational.insert

%Dcds_Reimbursement{procedure_name: "Liver Transplant", procedure_id: "liver-transplant-no-complications", refund: nil}
|> Dcds_Reimbursement.changeset
|> Storage.Relational.insert

%Dcds_Reimbursement{procedure_name: "Lobotomy", procedure_id: "lobotomy", refund: 0.56}
|> Dcds_Reimbursement.changeset
|> Storage.Relational.insert

%Dcds_Reimbursement{procedure_name: "Arm Amputation", procedure_id: "amputation-upper-limb-r-side", refund: 3.78}
|> Dcds_Reimbursement.changeset
|> Storage.Relational.insert

%Dcds_Reimbursement{procedure_name: "Appendix Removal", procedure_id: "appendicitis-recommendation", refund: 32.22}
|> Dcds_Reimbursement.changeset
|> Storage.Relational.insert

%Dcds_Reimbursement{procedure_name: "Triple Bypass", procedure_id: "heart-surgery-bypass-x-3", refund: 105.69}
|> Dcds_Reimbursement.changeset
|> Storage.Relational.insert

### SIGMA
%Sigma_Reimbursement{procedure_name: "Hip Replacement", procedure_id: 1009, avg_reimb: 40.19}
|> Sigma_Reimbursement.changeset
|> Storage.Relational.insert

%Sigma_Reimbursement{procedure_name: "Liver Transplant", procedure_id: 6482, avg_reimb: 443.21}
|> Sigma_Reimbursement.changeset
|> Storage.Relational.insert

%Sigma_Reimbursement{procedure_name: "Lobotomy", procedure_id: 1375, avg_reimb: 1.06}
|> Sigma_Reimbursement.changeset
|> Storage.Relational.insert

%Sigma_Reimbursement{procedure_name: "Arm Amputation", procedure_id: 8424, avg_reimb: nil}
|> Sigma_Reimbursement.changeset
|> Storage.Relational.insert

%Sigma_Reimbursement{procedure_name: "Appendix Removal", procedure_id: 5971, avg_reimb: 29.87}
|> Sigma_Reimbursement.changeset
|> Storage.Relational.insert

%Sigma_Reimbursement{procedure_name: "Triple Bypass", procedure_id: 3246, avg_reimb: 132.54}
|> Sigma_Reimbursement.changeset
|> Storage.Relational.insert
