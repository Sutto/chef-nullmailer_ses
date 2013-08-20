# chef-nullmailer_ses

This cookbook provides a simple Chef LWRP to support setting
up nullmailer for serving SES. This avoids the need for a full
MTA on the host such as postfix.

Please note this cookbook currently only works on Ubuntu. It will
install stunnel4, nullmailler and configure them to work with SES.

## Usage

You first need to add this cookbook to your chef repository, as
`nullmailer_ses`. Next, you then use the LWRP as such:

```ruby
nullmailer_ses "your-ses-admin-email@example.com" do
  user_name "ses-smtp-username"
  password  "ses-smtp-password"
  region    "optional-region"
  port      1234 # Local port for Stunnel - defaults to 2525.
end
```

This will configure the specified user as the default sender.

## Contributing

We encourage all community contributions. Keeping this in mind, please follow these general guidelines when contributing:

* Fork the project
* Create a topic branch for what you’re working on (git checkout -b awesome_feature)
* Commit away, push that up (git push your\_remote awesome\_feature)
* Create a new GitHub Issue with the commit, asking for review. Alternatively, send a pull request with details of what you added.
* Once it’s accepted, if you want access to the core repository feel free to ask! Otherwise, you can continue to hack away in your own fork.

Other than that, our guidelines very closely match the GemCutter guidelines [here](http://wiki.github.com/qrush/gemcutter/contribution-guidelines).

(Thanks to [GemCutter](http://rubygems.org/) for the contribution guide)

## Copyright

Copyright 2012-2013 Filter Squad.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
