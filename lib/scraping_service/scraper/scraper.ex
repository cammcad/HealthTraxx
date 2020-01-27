defmodule ScrapingService.Scraper.Scraper do
  alias ScrapingService.Scraper.ScrapeRequest
  # alias ScrapingService.Scraper.ScrapeResponse

  def scrape(%ScrapeRequest{payor_name: _name, procedure_id: _id, url: _url}) do
    # send scrape request to http adapter to build http request and send off the request
    # receive scrape response from http adapter
  end
end
