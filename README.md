# Travis Central Appraisal District Data
This is a Rails app that takes data provided on the [Travis Central Appraisal District website](https://www.traviscad.org/reports-request/) and imports it into a Postgres database.

Get the SQL dump [here](https://www.dropbox.com/s/xnncj7hz2ex10bs/tcad_2019.zip?dl=0).

## Modifications made to the layout information
- Changed `Field Name` from Title Case to snake_case for all `appr_hdrs` fields
- Changed `Datatype` from "varcahr(10)" to "varchar(10)" for `land_dets.land_type_cd`
- Changed `Datatype` from "numeric(15)" to "char(15)" for `props.exemption_percentage` because its `Description` says it's a "string representing a floating point number"
- Imported numerics as decimals instead of integers in cases where:
  - `Datatype` includes both precision and scale
  - `Description` say it's a decimal
  - `Field Name` ends in `_factor`
  - `Field Name` ends in `_pct` or includes `_pct_`
  
## Run it locally
```bash
# clone the repo and cd into it
~$ git clone https://github.com/factcondenser/tcad.git; cd tcad

# install dependencies
~/tcad$ bundle install

# create a local db and run migrations
~/tcad$ rails db:create; rails db:migrate

# run the importer for a given record type
~/tcad$ rails db:import["land_det"]
```
