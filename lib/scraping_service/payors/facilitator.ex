defmodule ScrapingService.Payors.Facilitator do

  alias ScrapingService.Scraper.Scraper
  alias ScrapingService.Scraper.ScrapeRequest
  alias ScrapingService.Reimbursement.ReimbursementInfo
  alias ScrapingService.Procedure.PayorProcedure
  alias Storage.Reimbursement.ReimbursementStore

  def scrape(%PayorProcedure{payor_name: payor_name, procedure_name: _, procedure_id: procedure_id}) do
    # Look up URL in config by payor_name
    url = ""
    # construct a scrape request
    # send scrape request to scrape adapter
    Scraper.scrape(%ScrapeRequest{payor_name: payor_name, procedure_id: procedure_id, url: url})
  end

  def get_reimbursement_info(%ReimbursementInfo{payor_name: _payor_name, procedure_name: _procedure_name}) do

  end

  @spec is_procedure_supported_by_payor?(ScrapingService.Procedure.PayorProcedure.t()) ::
          :not_supported | {:supported, ScrapingService.Procedure.PayorProcedure.t()}
  def is_procedure_supported_by_payor?(%PayorProcedure{} = payor_procedure) do
     ReimbursementStore.is_procedure_supported?(payor_procedure)
  end
end
