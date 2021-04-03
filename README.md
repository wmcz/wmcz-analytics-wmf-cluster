# wmcz-metrics-calculator

## Introduction
This repository can generate information about edits made by participants of outreach courses held by Wikimedia Czech Republic. It aims to provide such data in a machine-readable form, so it can be used by an app generating statistics and reports about Wikimedia Czech Republic activities.

## Running the pipeline
The `run_pipeline.sh` script will run the data pipeline and create `data` folder, together with `data.tar.gz` archive. As of April 2021, the pipeline requires access to internal Wikimedia resources (namely, Hive databases maintained by the Analytics team). The same data can be derived from [public wiki replicas](https://wikitech.wikimedia.org/wiki/Portal:Data_Services#Wiki_Replicas) maintained by Wikimedia Cloud Data Services or from [Wikimedia Dumps](https://dumps.wikimedia.org/), however, the majority of the data pipeline would likely have to be rewritten.

## Accessing the data
As of April 2021, this pipeline is still in early consturction. The data, generated via February 2021 mediawiki_history snapshot, was published at https://people.wikimedia.org/~urbanecm/wmcz/dashboard-stats-data/ as TSV files.

It is possible to load the TSV files into a MySQL database by running [`load_data_from_dump.sh`](https://github.com/urbanecm/wmcz-metrics-calculator/blob/master/04_Load_data_from_dump/load_data_from_dump.sh). To do so, you need to follow the instructions at [04_Load_data_from_dump](https://github.com/urbanecm/wmcz-metrics-calculator/tree/master/04_Load_data_from_dump).