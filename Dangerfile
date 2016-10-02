
# Global variables

####################################################################################################

# Warn about large PR
warn("This PR is too big. Consider breaking it down into multiple PRs.") if git.lines_of_code > 500

# Warn about incomplete PR description.
warn("Please provide a summary in the Pull Request description") if github.pr_body.length < 5

####################################################################################################

## Use Travis' build artifacts feature to let Danger read the build, and test logs.
## Snippet borrowed from https://github.com/artsy/eigen/blob/master/Dangerfile
#
#build_file = File.join(ENV["TRAVIS_BUILD_DIR"], "xcode_build_raw.log")
#
## We want to understand how much Swift is slowing our compilation cycles by
## so look at the top 1000 Swift symbols from the build log 
#most_expensive_swift_table = `cat #{build_file} | egrep '\.[0-9]ms' | sort -t "." -k 1 -n | tail -1000 | sort -t "." -k 1 -n -r`
#
## each line looks like "29.2ms   ~/IconDrawable.swift.swift:50:19   @objc override func viewDidLoad()"
#time_values = most_expensive_swift_table.lines.map { |line| line.split.first.to_i }.reject { |value| value == 0 }
#
## Looks for outliers
#require_relative "config/enumerable_stats"
#outliers = time_values.outliers(3)
#
## Take any build timeing outliers, and convert them into a useful markdown table.  
#if outliers.any?
#    
#  warn("Detected some Swift building time outliers")
#
#  current_branch = env.request_source.pr_json["head"]["ref"]
#  headings = "Time | Class | Function |\n| --- | ----- | ----- |"
#  
#  warnings = most_expensive_swift_table.lines[0...outliers.count].map do |line|
#    time, location, function_name = line.split "\t"
#    github_loc = location.gsub("/#{TRAVIS_REPO_SLUG}/tree/#{current_branch}")
#    github_loc_code = github_loc.split(":")[0...-1].join("#L")
#    name = File.basename(location).split(":").first
#    "#{time} | [#{name}](#{github_loc_code}) | #{function_name}"
#  end
#
#  markdown(([headings] + warnings).join)
#end
