# powerpipe-aws-finops-security

## Overview

**powerpipe-aws-finops-security** leverages Steampipe and Powerpipe to create a centralized dashboard. This dashboard showcases potential cost savings and security best practices by sourcing benchmarks and controls used in Turbot Pipe mods.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Dashboard](#dashboard)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Centralized Dashboard**: View all your cost savings and security best practices in one place.
- **Cost Savings**: Identify potential areas for cost reduction in your AWS environment.
- **Security Best Practices**: Ensure your AWS environment adheres to security best practices by leveraging benchmarks and controls.

## Installation

### Prerequisites

- [Steampipe](https://steampipe.io/downloads)
- [Powerpipe](https://powerpipe.io/downloads)
- [Git](https://git-scm.com/downloads)
- [Node.js](https://nodejs.org/) (for running Powerpipe)

### Steps

1. Clone the repository:
   
   ```bash
   git clone https://github.com/yourusername/powerpipe-aws-finops-security.git
   cd powerpipe-aws-finops-security
   ```
   
3. Install Steampipe:

   Follow the instructions on the [Steampipe download page](https://steampipe.io/downloads) to install Steampipe for your operating system.

4. Install Powerpipe:

   Follow the instructions on the [Powerpipe download page](https://powerpipe.io/downloads) to install Powerpipe.
   > **You only need to follow steps 1 and 2. <br>
   > Use the project folder to initialize powerpipe as shown in the [Usage](#usage) section.**

5. Set up your AWS credentials:

   Ensure that your AWS credentials are set up properly. You can use the AWS CLI to configure your credentials:
   ```bash
   aws configure
   ```
    <details>
      <summary>Don't have AWS CLI?</summary>
      
      You can download it following the instructions on this link: [AWS CLI Install](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-install.html)

      Then you will need to create an IAM user and an Access Key to pass it on the command's parameters: [Access Key](https://docs.aws.amazon.com/pt_br/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey)
      

      If you use SSO to access your account, you can use [aws-azure-login](https://github.com/aws-azure-login/aws-azure-login) to configure credentials.
      
    </details>

   
## Usage
1. Initialize all needed mods by running:
   
   ```bash
   powerpipe mod install github.com/turbot/steampipe-mod-aws-perimeter
   powerpipe mod install github.com/turbot/steampipe-mod-aws-thrifty
   ```
   
3. Start Steampipe:
   
   ```bash
   steampipe service start
   ```
   
4. Run Powerpipe to generate the dashboard:
   
   ```bash
   powerpipe server --mod-location .
   ```
   > **Ensure that you are in the project's directory
   
   
6. Open your browser and navigate to the URL provided by Powerpipe to view the dashboard.

## Dashboard

The dashboard provides a comprehensive view of:

- **Cost Savings**: Detailed analysis of potential cost savings in your AWS environment.
- **Security Best Practices**: Identification of security best practices and potential areas for improvement.


## Contributing

We welcome contributions to improve powerpipe-aws-finops-security. Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (git checkout -b feature/your-feature-name).
3. Make your changes and commit them (git commit -am 'Add some feature').
4. Push to the branch (git push origin feature/your-feature-name).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
