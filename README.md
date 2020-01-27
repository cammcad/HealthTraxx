# HealthTraxx Reimbursement Tracking

**Tracking reimbursement amounts for insurance companies (Pumana, DCDS, Sigma)**

## Installation

https://www.pgadmin.org/download/

Postgresql is the chosen storage adapter for this project, this project assumes you have postgresql
installed and configured before continuing with the installation.

Create and seed the database
$ mix ecto.setup

Get mix project dependencies
$ mix deps.get

Compile and run app
$ iex -S mix