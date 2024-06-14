mod "local" {
  title = "powerpipe"
  require {
    mod "github.com/turbot/steampipe-mod-aws-insights" {
      version = "*"
    }
    mod "github.com/turbot/steampipe-mod-aws-thrifty" {
      version = "*"
    }
    mod "github.com/turbot/steampipe-mod-aws-tags" {
      version = "*"
    }
    mod "github.com/turbot/steampipe-mod-aws-top-10" {
      version = "*"
    }
    mod "github.com/turbot/steampipe-mod-aws-perimeter" {
      version = "*"
    }
    mod "github.com/turbot/steampipe-mod-aws-compliance" {
      version = "*"
    }
  }
}