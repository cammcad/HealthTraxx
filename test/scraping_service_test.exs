defmodule ScrapingServiceTest do
  use ExUnit.Case
  doctest ScrapingService

  test "greets the world" do
    assert ScrapingService.hello() == :world
  end
end
