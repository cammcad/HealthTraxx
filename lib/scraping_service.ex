defmodule ScrapingService do
  @moduledoc """
  Public API for ScrapingService.
  """

  @doc """
  Start.

  ## Examples

      iex> ScrapingService.start()
  """
  def start() do
    ScrapingService.Poller.Poller.start_poller()
  end

  @doc """
  Stop.

  ## Examples

      iex> ScrapingService.stop()
  """
  def stop() do
    ScrapingService.Poller.Poller.stop_poller()
  end
end
