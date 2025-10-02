# dbt_bricks

## Overview

This project demonstrates a data transformation workflow using dbt (data build tool) and Databricks. The project leverages the computational power of Databricks to perform SQL-based data transformations, testing, and provides a proper framework for managing the data transformation process.  Version control is managed with Git, and the project can be containerized using Docker for consistent environments.

## Technologies Used

*   **VS Code:**  The primary IDE for development.
*   **Databricks:**  A cloud-based platform for data storage (in table form) and data computation.
*   **Data Build Tool (dbt):** A SQL-first transformation tool that enables data analysts and engineers to transform, test, and document data in the cloud data warehouse.
*   **Docker:**  A containerization platform used to create consistent and reproducible environments.  The project can be run inside a Docker container.
*   **Git:** A distributed version control system for tracking changes to the codebase, saving different versions, and enabling rollback capabilities.

## Workflow

1.  **.csv Data Ingestion:** Raw customer data in .csv format is manually uploaded to Databricks and stored as a table.
2.  **Data Transformation with dbt:**  dbt is used to transform the raw data within Databricks. This involves writing SQL queries to perform transformations such as calculating average sales and maximum sales.
3.  **Databricks Computation:** The data transformations are executed using the computational power of Databricks.
4.  **Data Storage in Databricks:** The transformed data is stored back into Databricks as tables.

## Project Structure

*(This section will be updated based on the actual folder structure of the project.  Please provide the output of `ls C:\prj\dbt_bricks>` so I can accurately describe the project structure.)*

## Prerequisites

*   [VS Code](https://code.visualstudio.com/) installed
*   Access to a Databricks environment
*   [dbt installed](https://docs.getdbt.com/docs/core/installation) and configured to connect to Databricks
*   [Docker](https://www.docker.com/) installed (optional, for containerization)
*   [Git](https://git-scm.com/) installed

## Getting Started

1.  **Clone the repository:**
    ```shell
    git clone <repository_url>
    cd dbt_bricks
    ```
2.  **Configure dbt:**
    *   Update the `profiles.yml` file with your Databricks connection details.
3.  **Run dbt:**
    ```shell
    dbt run
    ```
## Docker steps

1. docker images

💬 Comment:
Lists all Docker images available on your local system.
These include images you’ve pulled from Docker Hub or built locally. It shows details like repository name, tag, image ID, creation time, and size.

2. docker rmi <image_id>

Removes a Docker image from your local machine, specified by its image ID.
Useful for cleaning up unused or outdated images to free up space.
⚠️ Make sure the image is not being used by any containers before removing.

3. docker build -t dbt-dbx-abhi-i1 .

Builds a Docker image from the Dockerfile in the current directory (.), and tags it as dbt-dbx-abhi.
This is how you create a custom image for your project.
The -t flag assigns a name and optionally a tag (name:tag) to the image.

4. docker run -it -v C:\prj\dbt_bricks:/app dbt-dbx-abhi-i1

Runs a container based on the dbt-dbx-abhi-i1 image with:

-it: Interactive terminal mode (lets you interact with the container).

-v /path/to/your/dbt_project:/app: Mounts a local project directory into the container at /app. This allows the container to access your local DBT project files.


## Next Steps

*   Add more detailed instructions for setting up the Databricks environment.
*   Provide specific examples of the dbt transformations used in the project.
*   Document the data model and table schemas.
*   Create a Dockerfile for containerizing the project.